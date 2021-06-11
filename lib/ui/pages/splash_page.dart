import 'package:app_transporte/domains/bloc/localidad_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Provider.of<LocalidadBloc>(context, listen: false).cargarDatos();
    // sacarVersion();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, 'inicio');
    });
    super.initState();
  }

  /*sacarVersion() async {
    try {
      String identifier = (await UniqueIdentifier.serial)!;
      print('Identificador $identifier');
    } on PlatformException {}
    if (!mounted) return;
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Text('Splash'),
        ),
      ),
    );
  }
}
