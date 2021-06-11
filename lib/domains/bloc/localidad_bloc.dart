import 'package:app_transporte/domains/utils/preferencias.dart';
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

  void cargarLocalidadDesde() {
    Preferencias prefs = Preferencias();
    if (prefs.localidadDesde != null) {
      this._desde = prefs.localidadDesde!;
    }
  }

  void seleccionarLocalidad(BuildContext context, int index) {
    Preferencias pref = Preferencias();
    if (this._llamaDesde == 1) {
      this._desde = this._localidades[index];
      pref.localidadDesde = this._localidades[index];
      notifyListeners();
      Navigator.of(context).pop();
    } else {
      print(this._desde.id);
      print(this._hasta.id);
      if (this._desde.id != -1) {
        if (this._desde.id != this._localidades[index].id) {
          this._hasta = this._localidades[index];
          notifyListeners();
          Navigator.of(context).pop();
        } else {
          print('Entra en el else');
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text('Error'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child:
                          Text('No se puede seleccionar la misma localidad '),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Ok'))
                ],
              );
            },
          );
        }
      } else {
        this._hasta = this._localidades[index];
        notifyListeners();
        Navigator.of(context).pop();
      }
    }
  }
}
