import 'package:animator/animator.dart';
import 'package:app_transporte/domains/bloc/localidad_bloc.dart';
import 'package:app_transporte/ui/utils/colores_utils.dart';
import 'package:app_transporte/ui/widgets/input_busqueda_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ImagenContainerWidget extends StatelessWidget {
  const ImagenContainerWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final localidadBloc = Provider.of<LocalidadBloc>(context);
    return Container(
      width: double.infinity,
      height: size.height * .4,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: <Widget>[
          /*Container(
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black87.withOpacity(0.5), BlendMode.srcATop),
                image: NetworkImage(localidadBloc.desde.id == -1
                    ? 'https://www.roamingaroundtheworld.com/wp-content/uploads/2019/03/Cuenca-sign.jpg'
                    : localidadBloc.desde.imagen == null
                        ? 'https://www.roamingaroundtheworld.com/wp-content/uploads/2019/03/Cuenca-sign.jpg'
                        : localidadBloc.desde.imagen ),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * .03,
                    top: size.height * .015,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: size.height * 0.04,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),*/
          Positioned(
              child: Container(
            width: double.infinity,
            child: Opacity(
              opacity: .8,
              child: Image.network(
                localidadBloc.desde.id == -1
                    ? 'https://www.roamingaroundtheworld.com/wp-content/uploads/2019/03/Cuenca-sign.jpg'
                    : localidadBloc.desde.imagen == null
                        ? 'https://www.roamingaroundtheworld.com/wp-content/uploads/2019/03/Cuenca-sign.jpg'
                        : localidadBloc.desde.imagen,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: Lottie.asset("assets/lotties/loading.json"),
                  );
                },
              ),
            ),
          )),
          Positioned(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * .08,
                vertical: size.height * .10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputBusquedaWidget(
                    size: size,
                    texto: localidadBloc.desde.id == -1
                        ? '¿De dónde sales?'
                        : localidadBloc.desde.nombre,
                    pagina: 'buscar-localidad',
                    bloc: localidadBloc,
                    seleccionado: localidadBloc.desde.id == -1 ? false : true,
                    label: 'Desde: ',
                    llamaDesde: 1,
                  ),
                  InputBusquedaWidget(
                    size: size,
                    label: 'Hasta: ',
                    texto: localidadBloc.hasta.id == -1
                        ? '¿A dónde vas?'
                        : localidadBloc.hasta.nombre,
                    pagina: 'buscar-localidad',
                    bloc: localidadBloc,
                    seleccionado: localidadBloc.hasta.id == -1 ? false : true,
                    llamaDesde: 2,
                  ),
                  InputBusquedaWidget(
                    label: 'Viajas en: ',
                    size: size,
                    texto: '¿En qué vas?',
                    pagina: 'buscar-transporte',
                    seleccionado: false,
                    bloc: localidadBloc,
                    llamaDesde: 3,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: size.height * 0.02,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Container(
                width: size.width * .9,
                height: size.height * 0.05,
                child: Animator<double>(
                  duration: Duration(
                    milliseconds: 1500,
                  ),
                  cycles: 0,
                  curve: Curves.easeInOut,
                  tween: Tween<double>(begin: 0.0, end: 2.0),
                  builder: (context, animatorState, child) => Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(animatorState.value),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 6,
                        primary: ColoresUtils.colorUno,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Buscar',
                        style: TextStyle(
                          fontSize: size.height * 0.022,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
