import 'package:app_transporte/models/transporte.dart';
import 'package:app_transporte/ui/utils/colores_utils.dart';
import 'package:flutter/material.dart';

class BusquedaTransporte extends StatefulWidget {
  const BusquedaTransporte({Key? key}) : super(key: key);

  @override
  _BusquedaTransporteState createState() => _BusquedaTransporteState();
}

class _BusquedaTransporteState extends State<BusquedaTransporte> {
  final _pageController = PageController(
    viewportFraction: 0.8,
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColoresUtils.colorUno,
        title: Text('Seleccionar transporte'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'SELECCIONAR',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final transporte = transportes[index];
          return Container(
              width: double.infinity,
              height: size.height * .90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    transporte.imagen,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.02),
                    child: Text(
                      transporte.nombre,
                      style: TextStyle(
                        fontSize: size.height * .035,
                      ),
                    ),
                  ),
                ],
              ));
        },
        itemCount: transportes.length,
      ),
    );
  }
}
