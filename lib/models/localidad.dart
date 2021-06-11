// To parse this JSON data, do
//
//     final localidadModel = localidadModelFromJson(jsonString);

import 'dart:convert';

LocalidadModel localidadModelFromJson(String str) =>
    LocalidadModel.fromJson(json.decode(str));

String localidadModelToJson(LocalidadModel data) => json.encode(data.toJson());

class LocalidadModel {
  LocalidadModel({
    required this.id,
    required this.nombre,
    required this.imagen,
  });

  int id;
  String nombre;
  dynamic imagen;

  factory LocalidadModel.fromJson(Map<String, dynamic> json) => LocalidadModel(
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
