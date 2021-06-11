import 'package:app_transporte/ui/utils/colores_utils.dart';
import 'package:flutter/material.dart';

class CabeceraConBotonWidget extends StatelessWidget {
  const CabeceraConBotonWidget(
      {Key? key,
      required this.size,
      this.mostrarBoton = false,
      this.textoBoton = '',
      required this.textoCabecera})
      : super(key: key);

  final Size size;
  final bool mostrarBoton;
  final String textoBoton;
  final String textoCabecera;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ColoresUtils.colorCabeceras,
      height: size.height * 0.05,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.height * .02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              this.textoCabecera,
              style: TextStyle(
                  color: Colors.grey.shade600, fontSize: size.height * .018),
            ),
            mostrarBoton == true
                ? TextButton(
                    onPressed: () {},
                    child: Text(
                      this.textoBoton,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.02,
                        color: ColoresUtils.colorUno,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
