import 'package:app_transporte/domains/bloc/inicio_bloc.dart';
import 'package:app_transporte/ui/pages/tab_dos.dart';
import 'package:app_transporte/ui/pages/tab_uno.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inicioBloc = Provider.of<InicioBloc>(context);

    return SafeArea(
      child: Scaffold(
          body: inicioBloc.currentIndex == 0
              ? TabUno()
              : inicioBloc.currentIndex == 1
                  ? TabDosPage()
                  : Container(), // new
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: inicioBloc.currentIndex,
            onTap: (int index) {
              inicioBloc.currentIndex = index;
              // setState(() {});
            }, // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                // ignore: deprecated_member_use
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.person),
                // ignore: deprecated_member_use
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                // ignore: deprecated_member_use
                title: Text(''),
              )
            ],
          )),
    );
  }
}
