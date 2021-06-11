import 'package:app_transporte/ui/pages/busqueda_localidad.dart';
import 'package:app_transporte/ui/pages/busqueda_transporte.dart';
import 'package:app_transporte/ui/pages/inicio.dart';
import 'package:app_transporte/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> rutas() {
  return <String, WidgetBuilder>{
    "inicio": (_) => InicioPage(),
    "/": (_) => SplashPage(),
    "buscar-localidad": (_) => BusquedadLocalidadPage(),
    "buscar-transporte": (_) => BusquedaTransporte(),
  };
}
