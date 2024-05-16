part of domain.camera_detection;

abstract class ICameraDetection {
  Future registerFace(String namePerson, String imageBse64);
  Future detectedFace(String imageBse64);
}

class CameraDetectionRepository implements ICameraDetection {
  static CameraDetectionRepository get to => Get.find<CameraDetectionRepository>();
  CameraDetectionRepository({required CameraDetectionService cameraDetectionService}) : _cameraDetectionService = cameraDetectionService;
  final CameraDetectionService _cameraDetectionService;

  @override
  Future detectedFace(String imageBse64) async {
    try {
      _cameraDetectionService.detectedFace(imageBse64);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future registerFace(String namePerson, String imageBse64) async {
    try {
      _cameraDetectionService.registerFace(namePerson, imageBse64);
    } catch (e) {
      throw e.toString();
    }
  }
}
