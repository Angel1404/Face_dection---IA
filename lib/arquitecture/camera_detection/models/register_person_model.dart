part of arquitecture.camera_detection;

RegisterPersonModel registerPersonModelFromJson(String str) => RegisterPersonModel.fromJson(json.decode(str));

String registerPersonModelToJson(RegisterPersonModel data) => json.encode(data.toJson());

class RegisterPersonModel {
  final String nombre;
  final String imagen;

  RegisterPersonModel({
    required this.nombre,
    required this.imagen,
  });

  RegisterPersonModel copyWith({
    String? nombre,
    String? imagen,
  }) =>
      RegisterPersonModel(
        nombre: nombre ?? this.nombre,
        imagen: imagen ?? this.imagen,
      );

  factory RegisterPersonModel.fromJson(Map<String, dynamic> json) => RegisterPersonModel(
        nombre: json["nombre"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "imagen": imagen,
      };
}
