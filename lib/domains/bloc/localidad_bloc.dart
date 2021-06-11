import 'package:app_transporte/models/localidad.dart';
import 'package:app_transporte/models/services/localidad_service.dart';
import 'package:flutter/material.dart';

class LocalidadBloc extends ChangeNotifier {
  bool _cargando = false;
  List<LocalidadModel> _localidades = [];
  LocalidadModel _desde = LocalidadModel(id: -1, nombre: "", imagen: "");
  LocalidadModel _hasta = LocalidadModel(id: -1, nombre: "", imagen: "");
  int _llamaDesde = 1;

  //get
  bool get cargando => this._cargando;
  List<LocalidadModel> get localidades => this._localidades;
  LocalidadModel get desde => this._desde;
  LocalidadModel get hasta => this._hasta;
  int get llamaDesde => this._llamaDesde;

  // set
  set localidades(List<LocalidadModel> locales) {
    this._localidades = locales;
    notifyListeners();
  }

  set desde(LocalidadModel desde) {
    this._desde = desde;
    notifyListeners();
  }

  set hasta(LocalidadModel hasta) {
    this._hasta = hasta;
    notifyListeners();
  }

  set llamaDesde(int i) {
    this._llamaDesde = i;
  }

  void cargarDatos() async {
    this._cargando = true;
    this._localidades = await LocalidadService.getLocalidades()!;
    this._cargando = false;
    notifyListeners();
  }
}
