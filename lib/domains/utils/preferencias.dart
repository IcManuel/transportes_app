import 'dart:convert';

import 'package:app_transporte/models/localidad.dart';
import 'package:app_transporte/models/transporte.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferencias {
  static final Preferencias _instancia = Preferencias._internal();

  factory Preferencias() {
    return _instancia;
  }

  Preferencias._internal();
  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //get y sets
  /* String get token {
    return _prefs.getString('token') ?? "";
  }

  set token(String valor) {
    _prefs.setString('token', valor);
  }
*/

  set localidadDesde(LocalidadModel? l) {
    if (l != null) {
      _prefs.setString('localidadDesde', jsonEncode(l.toJson()));
    } else {
      _prefs.setString('localidadDesde', jsonEncode(''));
    }
  }

  LocalidadModel? get localidadDesde {
    String localidadString = _prefs.getString('localidadDesde') ?? '';
    if (localidadString.length > 0) {
      Map empleadoMap = jsonDecode(localidadString);
      LocalidadModel empleado =
          LocalidadModel.fromJson(empleadoMap.cast<String, dynamic>());
      return empleado;
    } else {
      return null;
    }
  }
  /*

  Empleado? get empleado {
    String usuarioString = _prefs.getString('empleado') ?? '';
    if (usuarioString.length > 0) {
      Map empleadoMap = jsonDecode(usuarioString);
      Empleado empleado =
          Empleado.fromJson(empleadoMap.cast<String, dynamic>());
      return empleado;
    } else
      return null;
  }*/
}
