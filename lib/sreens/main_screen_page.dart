import 'package:flutter/material.dart';

class MainScreenPage extends StatelessWidget {
  const MainScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.amberAccent,
      child: Center(
        child: Column(
          children: [
            Text('data'),
          ],
        ),
      ),
    );
  }
}
