import 'package:face_detection/arquitecture/arquitecture.dart';
import 'package:face_detection/domain/camera_detection/camera_detection.dart';
import 'package:get/get.dart';

import '../presentation/presentation.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CameraDetectionService>(() => CameraDetectionService());
    Get.lazyPut<CameraDetectionRepository>(() => CameraDetectionRepository(cameraDetectionService: CameraDetectionService.to));
  }
}

class CameraDetectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CameraDetectionController>(() => CameraDetectionController(cameraDetectionRepo: CameraDetectionRepository.to));
  }
}
