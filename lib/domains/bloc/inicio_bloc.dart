import 'package:flutter/material.dart';

class InicioBloc extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => this._currentIndex;

  set currentIndex(int d) {
    this._currentIndex = d;
    notifyListeners();
  }
}
