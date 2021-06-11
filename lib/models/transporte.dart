// To parse this JSON data, do
//
//     final transporteModel = transporteModelFromJson(jsonString);

import 'dart:convert';

TransporteModel transporteModelFromJson(String str) =>
    TransporteModel.fromJson(json.decode(str));

String transporteModelToJson(TransporteModel data) =>
    json.encode(data.toJson());

class TransporteModel {
  TransporteModel({
    required this.id,
    required this.nombre,
    required this.imagen,
  });

  int id;
  String nombre;
  String imagen;

  factory TransporteModel.fromJson(Map<String, dynamic> json) =>
      TransporteModel(
        id: json["id"],
        nombre: json["nombre"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "imagen": imagen,
      };
}

List<TransporteModel> transportes = [
  TransporteModel(id: 1, nombre: "BUS", imagen: "assets/images/bus2.png"),
  TransporteModel(id: 1, nombre: "BUSETA", imagen: "assets/images/buseta.png"),
  TransporteModel(id: 1, nombre: "AVIÓN", imagen: "assets/images/avion.png"),
];
