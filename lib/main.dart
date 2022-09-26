import 'package:flutter/material.dart';
import 'package:formulario/sreens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (_) => const LoginScreenPage(),
        'home': (_) => const MainScreenPage() 
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App '),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
