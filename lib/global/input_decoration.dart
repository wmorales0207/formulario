import 'package:flutter/material.dart';

class InputDecorations {
  //// recibe los textos
  static InputDecoration auth_InputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        // define un border paradistinguir lalinea de escritura
        borderSide: BorderSide(
          color: Colors.deepPurple,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        // esta linea define el color que tentra cuando tenga el focus, el mismo color pero mas grueso
        borderSide: BorderSide(
          color: Colors.deepPurple,
          width: 2,
        ),
      ),
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Colors.grey,
      ),
      prefixIcon: prefixIcon ==
              null // si pasan esta info por parametros lo usamos sino lo ponemos por defecto
          ? null
          : Icon(
              prefixIcon,
              color: Colors.deepPurple,
            ),
    );
  }
}
