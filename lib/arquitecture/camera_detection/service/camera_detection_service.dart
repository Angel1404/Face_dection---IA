part of arquitecture.camera_detection;

class CameraDetectionService extends GetConnect {
  static CameraDetectionService get to => Get.find<CameraDetectionService>();

  Future<String> registerFace(Map<String, dynamic> data) async {
    try {
      final response = await post("url", data);
      if (response.statusCode != 200) throw response.body;

      return response.body["message"];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> detectedFace(String imageBse64) async {
    try {
      final response = await post("url", {"imagen": imageBse64});
      if (response.statusCode != 200) throw response.body;

      return response.body["recognized_face_id"];
    } catch (e) {
      throw e.toString();
    }
  }
}
