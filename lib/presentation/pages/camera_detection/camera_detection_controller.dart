import 'package:camera/camera.dart';
import 'package:get/get.dart';

late List<CameraDescription> cameras;

class CameraDetectionController extends GetxController {
  static CameraDetectionController get to => Get.find<CameraDetectionController>();

  late final CameraController _controllerCamera;
  CameraController get controllerCamera => _controllerCamera;

  @override
  void onInit() {
    super.onInit();

    _controllerCamera = CameraController(cameras.first, ResolutionPreset.max);
    _controllerCamera.initialize();
    _controllerCamera.startImageStream((image) {
      image.format;
    });
  }

  @override
  void onClose() {
    _controllerCamera.dispose();
    super.onClose();
  }
}
