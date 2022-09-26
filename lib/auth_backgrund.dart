import 'package:flutter/material.dart';
import 'package:formulario/widgets/widget.dart';

class AuthBackgrund extends StatelessWidget {
  const AuthBackgrund({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          // purbple box
          _PurpleBox(),

          // icon in the center
          CenterIcon(),
        ],
      ),
    );
  }
}

class CenterIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}

//// para definir el fondo morado con todos ssu ajustes
class _PurpleBox extends StatelessWidget {
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
      child: Stack(
        children: const [
          Positioned(
            bottom: 20,
            left: 90,
            child: Bubble(),
          ),
          Positioned(
            top: 20,
            left: 70,
            child: Bubble(),
          ),
          Positioned(
            bottom: -10,
            left: -10,
            child: Bubble(),
          ),
          Positioned(
            top: 20,
            right: -20,
            child: Bubble(),
          ),
          Positioned(
            bottom: -20,
            right: 70,
            child: Bubble(),
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1),
      ]),
    );
  }
}
