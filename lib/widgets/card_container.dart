import 'package:flutter/material.dart';

class CardContainerwidget extends StatelessWidget {
  const CardContainerwidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        height: 300,
        //color: Colors.amber,
        decoration: _createCardDecoration(),
        child: child,
      ),
    );
  }

  BoxDecoration _createCardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        // lleva una lista de boxshadowa
        BoxShadow(
            color: Colors.black12,
            blurRadius: 15, // que tanto quiero expandir el blur
            offset:
                Offset(0, 5) // define la posisicion en ele eje X Y de la sombra
            ),
      ],
    );
  }
}
