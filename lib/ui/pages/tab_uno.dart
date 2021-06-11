import 'package:app_transporte/ui/widgets/imagen_container_widget.dart';
import 'package:app_transporte/ui/widgets/lista_container_widget.dart';
import 'package:flutter/material.dart';

class TabUno extends StatelessWidget {
  const TabUno({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          ImagenContainerWidget(
            size: size,
          ),
          ListaContainerWidget(size: size),
        ],
      ),
    );
  }
}
