import 'package:app_transporte/domains/bloc/identifier_bloc.dart';
import 'package:app_transporte/domains/bloc/inicio_bloc.dart';
import 'package:app_transporte/domains/bloc/localidad_bloc.dart';
import 'package:app_transporte/domains/bloc/tipo_transporte_bloc.dart';
import 'package:app_transporte/domains/utils/preferencias.dart';
import 'package:app_transporte/routes.dart';
import 'package:app_transporte/ui/utils/colores_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Preferencias pref = Preferencias();
  await pref.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LocalidadBloc(),
        ),
        ChangeNotifierProvider(create: (_) => InicioBloc()),
        ChangeNotifierProvider(
          create: (_) => IdentifierBloc(),
        ),
        ChangeNotifierProvider(
          create: (_) => TipoTransporteBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        routes: rutas(),
        theme: ThemeData(primaryColor: ColoresUtils.colorUno),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
