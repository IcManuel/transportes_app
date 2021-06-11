import 'package:app_transporte/ui/widgets/cabecera_con_boton_widget.dart';
import 'package:app_transporte/ui/widgets/lista_favoritos_widget.dart';
import 'package:app_transporte/ui/widgets/lista_reciente_widget.dart';
import 'package:flutter/material.dart';

class ListaContainerWidget extends StatelessWidget {
  const ListaContainerWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView(
          children: <Widget>[
            CabeceraConBotonWidget(
              textoBoton: 'AGREGAR',
              textoCabecera: 'Favoritos',
              size: size,
              mostrarBoton: true,
            ),
            ListaFavoritosWidget(size: size),
            CabeceraConBotonWidget(
              size: size,
              textoCabecera: 'Actividades recientes',
            ),
            ListaRecientesWidget(size: size)
          ],
        ),
      ),
    );
  }
}
