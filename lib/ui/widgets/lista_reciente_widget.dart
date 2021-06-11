import 'package:app_transporte/models/favorito.dart';
import 'package:flutter/material.dart';

class ListaRecientesWidget extends StatelessWidget {
  const ListaRecientesWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        final item = actividadesRecientes[index];
        return Container(
          height: size.height * 0.05,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03,
                  vertical: size.height * 0.009,
                ),
                child: Text(
                  item.titulo,
                  style: TextStyle(
                    fontSize: size.height * 0.02,
                  ),
                ),
              ),
              Divider(
                height: 0.01,
              )
            ],
          ),
        );
      },
      itemCount: actividadesRecientes.length,
    );
  }
}
