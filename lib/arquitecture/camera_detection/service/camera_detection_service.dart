part of arquitecture.camera_detection;

class CameraDetectionService extends GetConnect {
  static CameraDetectionService get to => Get.find<CameraDetectionService>();

  Future<String> registerFace(Map<String, dynamic> data) async {
    try {
      final response = await post("http://192.168.1.144:5000/guardar_rostro", data);
      if (response.statusCode != 200) throw response.body;

      return response.body["message"];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Map<String, dynamic>> detectedFace(String imageBse64) async {
    try {
      final response = await post("http://192.168.1.144:5000/reconocer_rostro", {"imagen": imageBse64});
      if (response.statusCode != 200) throw response.body;

      return response.body;
    } catch (e) {
      print("Error ser : $e");
      throw e.toString();
    }
  }
}
