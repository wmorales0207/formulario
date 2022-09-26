import 'package:flutter/material.dart';

class AuthBackgrund extends StatelessWidget {
  const AuthBackgrund({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          // purbple box
          _PurpleBox(),
        ],
      ),
    );
  }
}

//// para definir el fondo morado con todos ssu ajustes
class _PurpleBox extends StatelessWidget {
  const _PurpleBox({super.key});

  @override
  Widget build(BuildContext context) {
    // obtiene el size del device
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      // de ser el 40 % de la pantalla
      height: size.height * 0.4,
      //color: Colors.indigo, cuadno usas decoretion tienens que desabilitar el color

      decoration: _buildBoxDecoration(),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return const BoxDecoration(


    );
  }
}
