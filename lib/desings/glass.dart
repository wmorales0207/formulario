import 'package:flutter/material.dart';

class GlassEfect extends StatefulWidget {
  const GlassEfect({super.key});

  @override
  State<GlassEfect> createState() => _GlassEfectState();
}

class _GlassEfectState extends State<GlassEfect> {
  bool isPresent = true;

  @override
  Widget build(BuildContext context) {
    var deepOrange = Colors.deepOrange;

    return Scaffold(
      backgroundColor: deepOrange,
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/images/back.jpg'), fit: BoxFit.fitHeight),
        ),
        child: GestureDetector(
          onTapDown: (_) {
            setState(() => isPresent = true);
          },
          onTapUp: (_) {
            setState(() => isPresent = false);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(isPresent ? 0.4 : 0.5),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 2, color: Colors.white30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
