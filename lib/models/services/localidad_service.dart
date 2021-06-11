import 'dart:convert';
import 'dart:developer';

import 'package:app_transporte/models/localidad.dart';
import 'package:app_transporte/models/responses/localidad_response.dart';
import 'package:app_transporte/ui/utils/webservice.dart';
import 'package:http/http.dart' as http;

class LocalidadService {
  static Future<List<LocalidadModel>>? getLocalidades() async {
    try {
      print(Webservice.obtenerLocalidades);
      var respuesta = await http.get(Uri.parse(Webservice.obtenerLocalidades),
          headers: <String, String>{'Content-Type': 'application/json'});
      var jsonData = json.decode(respuesta.body);
      LocalidadResponseModel resLocalidad =
          LocalidadResponseModel.fromJson(jsonData);
      if (resLocalidad.ok == true) {
        return resLocalidad.localidades;
      } else {
        return [];
      }
    } catch (error) {
      log(error.toString());
      return [];
    }
  }
}
