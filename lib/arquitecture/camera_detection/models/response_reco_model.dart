part of arquitecture.camera_detection;

ResponseRecoModel responseRecoModelFromJson(String str) => ResponseRecoModel.fromJson(json.decode(str));

String responseRecoModelToJson(ResponseRecoModel data) => json.encode(data.toJson());

class ResponseRecoModel {
  List<List<dynamic>> recognizedFaceId;

  ResponseRecoModel({
    required this.recognizedFaceId,
  });

  factory ResponseRecoModel.fromJson(Map<String, dynamic> json) => ResponseRecoModel(
        recognizedFaceId: List<List<dynamic>>.from(json["recognized_face_id"].map((x) => List<dynamic>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "recognized_face_id": List<dynamic>.from(recognizedFaceId.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
