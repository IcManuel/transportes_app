// To parse this JSON data, do
//
//     final localidadResponseModel = localidadResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:app_transporte/models/localidad.dart';

LocalidadResponseModel localidadResponseModelFromJson(String str) =>
    LocalidadResponseModel.fromJson(json.decode(str));

String localidadResponseModelToJson(LocalidadResponseModel data) =>
    json.encode(data.toJson());

class LocalidadResponseModel {
  LocalidadResponseModel({
    required this.ok,
    required this.localidades,
  });

  bool ok;
  List<LocalidadModel> localidades;

  factory LocalidadResponseModel.fromJson(Map<String, dynamic> json) =>
      LocalidadResponseModel(
        ok: json["ok"],
        localidades: List<LocalidadModel>.from(
            json["localidades"].map((x) => LocalidadModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "localidades": List<dynamic>.from(localidades.map((x) => x.toJson())),
      };
}
