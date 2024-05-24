part of domain.camera_detection;

abstract class ICameraDetection {
  Future<String> registerFace(RegisterPersonModel registerPersonModel);
  Future<Map<String, dynamic>> detectedFace(String imageBse64);
}

class CameraDetectionRepository implements ICameraDetection {
  static CameraDetectionRepository get to => Get.find<CameraDetectionRepository>();
  CameraDetectionRepository({required CameraDetectionService cameraDetectionService}) : _cameraDetectionService = cameraDetectionService;
  final CameraDetectionService _cameraDetectionService;

  @override
  Future<Map<String, dynamic>> detectedFace(String imageBse64) async {
    try {
      return await _cameraDetectionService.detectedFace(imageBse64);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<String> registerFace(RegisterPersonModel registerPersonModel) async {
    try {
      return await _cameraDetectionService.registerFace(registerPersonModel.toJson());
    } catch (e) {
      throw e.toString();
    }
  }
}
