import 'package:app_transporte/domains/bloc/localidad_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemLocationWidget extends StatelessWidget {
  const ItemLocationWidget({
    Key? key,
    required this.size,
    required this.texto,
    required this.index,
  }) : super(key: key);

  final Size size;
  final String texto;
  final int index;

  @override
  Widget build(BuildContext context) {
    final localidadBloc = Provider.of<LocalidadBloc>(context);
    return InkWell(
      onTap: () {
        localidadBloc.llamaDesde == 1
            ? localidadBloc.desde = localidadBloc.localidades[this.index]
            : localidadBloc.hasta = localidadBloc.localidades[this.index];
        Navigator.of(context).pop();
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: size.height * 0.10,
        width: double.maxFinite,
        child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1,
              vertical: size.height * 0.02,
            ),
            child: Text(
              this.texto,
              style: TextStyle(
                fontSize: size.height * 0.035,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
