import 'package:app_transporte/domains/bloc/localidad_bloc.dart';
import 'package:app_transporte/ui/utils/colores_utils.dart';
import 'package:flutter/material.dart';

class InputBusquedaWidget extends StatelessWidget {
  const InputBusquedaWidget({
    Key? key,
    required this.size,
    required this.texto,
    required this.pagina,
    required this.bloc,
    required this.llamaDesde,
    required this.label,
    required this.seleccionado,
  }) : super(key: key);

  final Size size;
  final String texto;
  final String pagina;
  final LocalidadBloc bloc;
  final int llamaDesde;
  final String label;
  final bool seleccionado;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        this.bloc.llamaDesde = this.llamaDesde;
        Navigator.pushNamed(
          context,
          pagina,
        );
      },
      child: Container(
        width: size.width,
        height: size.height * .05,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black38.withOpacity(.7),
              offset: Offset(0.2, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * .22,
                    child: Text(
                      label,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * .020,
                      ),
                    ),
                  ),
                  Text(
                    texto,
                    style: TextStyle(
                      fontSize: size.height * .019,
                      color: seleccionado
                          ? Colors.black.withOpacity(.7)
                          : Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.search,
                size: size.height * 0.038,
                color: ColoresUtils.colorUno,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
