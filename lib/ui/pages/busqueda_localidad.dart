import 'package:app_transporte/domains/bloc/localidad_bloc.dart';
import 'package:app_transporte/ui/utils/colores_utils.dart';
import 'package:app_transporte/ui/widgets/item_location_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BusquedadLocalidadPage extends StatelessWidget {
  const BusquedadLocalidadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localidadBloc = Provider.of<LocalidadBloc>(context);
    final size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColoresUtils.colorUno,
          title: Text(
            'Seleccionar localidad',
            style: TextStyle(
              fontSize: size.height * 0.018,
            ),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (_, int index) {
            final l = localidadBloc.localidades[index];
            return ItemLocationWidget(
              size: size,
              texto: l.nombre,
              index: index,
            );
          },
          itemCount: localidadBloc.localidades.length,
        ),
      ),
    );
  }
}
