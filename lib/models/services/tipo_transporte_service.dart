import 'dart:convert';
import 'dart:developer';

import 'package:app_transporte/models/responses/tipo_transporte_response.dart';
import 'package:app_transporte/models/transporte.dart';
import 'package:app_transporte/ui/utils/webservice.dart';
import 'package:http/http.dart' as http;

class TipoTransporteService {
  static Future<List<TransporteModel>>? getTransportes() async {
    try {
      print(Webservice.obtenerTiposTransporte);
      var respuesta = await http.get(
          Uri.parse(Webservice.obtenerTiposTransporte),
          headers: <String, String>{'Content-Type': 'application/json'});
      var jsonData = json.decode(respuesta.body);
      ResponseTipoTransporteModel resLocalidad =
          ResponseTipoTransporteModel.fromJson(jsonData);
      if (resLocalidad.ok == true) {
        return resLocalidad.tiposTransporte;
      } else {
        return [];
      }
    } catch (error) {
      log(error.toString());
      return [];
    }
  }
}
