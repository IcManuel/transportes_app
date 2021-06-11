import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unique_identifier/unique_identifier.dart';

class IdentifierBloc extends ChangeNotifier {
  String _identifier = '';

  String get identifier => this._identifier;

  void obtenerIdentificador() async {
    try {
      this._identifier = (await UniqueIdentifier.serial)!;
    } on PlatformException {
      print('Error al obtener identificador');
    }
  }
}
