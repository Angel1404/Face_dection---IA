import 'package:camera/camera.dart';
import 'package:face_detection/arquitecture/arquitecture.dart';
import 'package:get/get.dart';

import '../../../domain/domain.dart';
import '../../utils/utils.dart';

late List<CameraDescription> cameras;

class CameraDetectionController extends GetxController {
  static CameraDetectionController get to => Get.find<CameraDetectionController>();
  CameraDetectionController({required ICameraDetection cameraDetectionRepo}) : _cameraDetectionRepo = cameraDetectionRepo;
  final ICameraDetection _cameraDetectionRepo;

  late final CameraController _controllerCamera;

  CameraController get controllerCamera => _controllerCamera;
  final isInitializeController = false.obs;
  bool isOrientationCamera = false;
  @override
  void onInit() {
    super.onInit();
    initData();
  }

  initData() async {
    _controllerCamera = CameraController(cameras.last, ResolutionPreset.max, enableAudio: false);
    await _controllerCamera.initialize();
    isInitializeController.value = _controllerCamera.value.isInitialized;
  }

  changeFace() {
    final newisOrientationCamera = isOrientationCamera = !isOrientationCamera;
    _controllerCamera.setDescription(newisOrientationCamera ? cameras.last : cameras.first);
  }

  Future<String> _takePicture() async {
    final take = await _controllerCamera.takePicture();
    return take.path.isNotEmpty ? take.path : "";
  }

  Future<BaseResponse> registerFace(String namePerson) async {
    try {
      final imageBase64 = await convertFileToBase64(await _takePicture());

      final response = await _cameraDetectionRepo.registerFace(RegisterPersonModel(nombre: namePerson, imagen: imageBase64));
      return BaseResponse(data: response);
    } catch (e) {
      return BaseResponse.errorStr(e.toString());
    }
  }

  final namePersonDetected = "".obs;

  detectedFace() async {
    try {
      final imageBase64 = await convertFileToBase64(await _takePicture());

      final response = await _cameraDetectionRepo.detectedFace(imageBase64);
      namePersonDetected.value = ResponseRecoModel.fromJson(response).recognizedFaceId.first.first;
      print("response: $response");
      return BaseResponse();
    } catch (e) {
      print("Error contrroller: $e");
      return BaseResponse.errorStr(e.toString());
    }
  }

  @override
  void onClose() {
    _controllerCamera.dispose();
    super.onClose();
  }
}
