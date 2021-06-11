// To parse this JSON data, do
//
//     final responseTipoTransporteModel = responseTipoTransporteModelFromJson(jsonString);

import 'dart:convert';

import 'package:app_transporte/models/transporte.dart';

ResponseTipoTransporteModel responseTipoTransporteModelFromJson(String str) =>
    ResponseTipoTransporteModel.fromJson(json.decode(str));

String responseTipoTransporteModelToJson(ResponseTipoTransporteModel data) =>
    json.encode(data.toJson());

class ResponseTipoTransporteModel {
  ResponseTipoTransporteModel({
    required this.ok,
    required this.tiposTransporte,
  });

  bool ok;
  List<TransporteModel> tiposTransporte;

  factory ResponseTipoTransporteModel.fromJson(Map<String, dynamic> json) =>
      ResponseTipoTransporteModel(
        ok: json["ok"],
        tiposTransporte: List<TransporteModel>.from(
            json["tipos_transporte"].map((x) => TransporteModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "tipos_transporte":
            List<dynamic>.from(tiposTransporte.map((x) => x.toJson())),
      };
}
