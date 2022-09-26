import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  const Bubble({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 40.0,
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.05),
    );
  }
}
