import 'package:app_transporte/ui/utils/colores_utils.dart';
import 'package:flutter/material.dart';

class TabDosPage extends StatelessWidget {
  const TabDosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColoresUtils.colorUno.withOpacity(0.2),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/icono.png",
            height: size.height * .2,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03,
            ),
            height: size.height * 0.3,
            width: double.maxFinite,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              elevation: 5,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1,
                    vertical: size.height * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: size.height * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Usuario',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Contraseña',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Olvidaste tu contraseña?',
                              style: TextStyle(
                                fontSize: size.height * 0.020,
                                color: ColoresUtils.colorUno,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03, vertical: size.height * .02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (cambio) {},
                    ),
                    Text(
                      'Recuérdame',
                      style: TextStyle(
                        fontSize: size.height * 0.02,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      primary: ColoresUtils.colorUno,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  child: Padding(
                    padding: EdgeInsets.all(size.height * 0.02),
                    child: Text(
                      'CREAR CUENTA',
                      style: TextStyle(
                        fontSize: size.height * 0.02,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.15,
              vertical: size.height * 0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.grey.shade500.withOpacity(.7),
                  height: 3,
                  width: size.width * .2,
                ),
                Text(
                  'Social login',
                  style: TextStyle(
                      fontSize: size.height * 0.02,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  color: Colors.grey.shade500.withOpacity(.7),
                  height: 3,
                  width: size.width * .2,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/facebook.png",
                  height: size.height * 0.06,
                ),
                Image.asset(
                  "assets/images/google.png",
                  height: size.height * 0.06,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
