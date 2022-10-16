import 'package:flutter/material.dart';

class Neumorphs extends StatefulWidget {
  const Neumorphs({super.key});

  @override
  State<Neumorphs> createState() => _NeumorphsState();
}

class _NeumorphsState extends State<Neumorphs> {
  @override
  Widget build(BuildContext context) {
    // aca describiremos un efecto de sombras sobre un boton.
    var isDarkMode = true;

    var backgroundColor =
        isDarkMode ? const Color(0xFF2E3239) : const Color(0xFFE7ECEF);
    bool isPressed = true;
    double blur = isPressed ? 5.0 : 30.0;
    // ignore: dead_code
    var distance = isPressed ? const Offset(10, 10) : const Offset(28, 28);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() => isPressed = !isPressed),
          child: AnimatedContainer(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  // sombra superior
                  blurRadius: blur,
                  offset: -distance,
                  color: isDarkMode ? const Color(0xFF2E3239) : Colors.white,
                  //inset: true, this line neets a dependency flutter_inset_box_shadow: 1.0.7
                  // is used to create an sombra interna dentro de un container
                ),
                BoxShadow(
                  // sombra inferior
                  blurRadius: blur,
                  offset: distance,
                  color: isDarkMode
                      ? const Color(0xFF2E3239)
                      : const Color(0xFFA7A9AF),
                  //inset: true, this line neets a dependency flutter_inset_box_shadow: 1.0.7
                ),
              ],
            ),
            duration: const Duration(milliseconds: 100),
          ),
        ),
      ),
    );
  }
}
