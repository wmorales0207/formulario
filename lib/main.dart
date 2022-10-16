import 'package:flutter/material.dart';
import 'package:formulario/desings/glass.dart';
import 'package:formulario/desings/neumorphism.dart';
import 'package:formulario/sreens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      debugShowCheckedModeBanner: false,
      // de esta dorma se cambian a nivel global  el color de todos los scalfold de la app.
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
      ),

      initialRoute: 'login',
      routes: {
        'login': (_) => const LoginScreenPage(),
        'home': (_) => const MainScreenPage(),
        'neumo': (_) => const Neumorphs(),
        'glass': (_) => const GlassEfect(),
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
