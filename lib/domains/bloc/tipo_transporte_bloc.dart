import 'package:app_transporte/models/services/tipo_transporte_service.dart';
import 'package:app_transporte/models/transporte.dart';
import 'package:flutter/material.dart';

class TipoTransporteBloc extends ChangeNotifier {
  bool _cargando = false;
  int _index = 0;
  TransporteModel _transporte =
      TransporteModel(id: -1, imagen: "", nombre: "", codigo: "");
  List<TransporteModel> _lista = [];

  int get index => this._index;
  TransporteModel get transporte => this._transporte;
  bool get cargando => this._cargando;
  List<TransporteModel> get lista => this._lista;

  set index(int ii) {
    this._index = ii;
  }

  set lista(List<TransporteModel> a) {
    this._lista = a;
    notifyListeners();
  }

  set cargando(bool c) {
    this._cargando = c;
    notifyListeners();
  }

  set transporte(TransporteModel tran) {
    this._transporte = tran;
    notifyListeners();
  }

  void cargarDatos() async {
    this._cargando = true;
    this._lista = await TipoTransporteService.getTransportes()!;
    if (this._lista.length > 0) {
      this._transporte = this._lista[0];
    }
    this._cargando = false;
    notifyListeners();
  }
}
