import 'dart:io';

import 'package:camera/camera.dart';
import 'package:get/get.dart';

import '../../../domain/domain.dart';

late List<CameraDescription> cameras;

class CameraDetectionController extends GetxController {
  static CameraDetectionController get to => Get.find<CameraDetectionController>();
  CameraDetectionController({required ICameraDetection cameraDetectionRepo}) : _cameraDetectionRepo = cameraDetectionRepo;
  final ICameraDetection _cameraDetectionRepo;

  late final CameraController _controllerCamera;

  CameraController get controllerCamera => _controllerCamera;
  final photo = File("").obs;

  @override
  void onInit() {
    super.onInit();

    _controllerCamera = CameraController(cameras.first, ResolutionPreset.max, enableAudio: false);
    _controllerCamera.initialize();
    // _controllerCamera.startImageStream((image) {
    //   image.format;
    // });
  }

  @override
  void onClose() {
    _controllerCamera.dispose();
    super.onClose();
  }
}
