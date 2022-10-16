import 'package:flutter/material.dart';
import 'package:formulario/global/input_decoration.dart';
import 'package:formulario/widgets/widget.dart';

class LoginScreenPage extends StatelessWidget {
  const LoginScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgrund(
        // aca estamos usando un componente que debera permitor hacer escroll
        // si es necesario, tener presente qye se desplegara un teclado para esribir sobre el
        // y para eso tendra que permitir scroll
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              CardContainerwidget(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _loginForm(),
                  ],
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              const Text(
                'Crea una nueva cuenta',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

////
class _loginForm extends StatelessWidget {
  _loginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.auth_InputDecoration(
                hintText: 'jonh doe@gmail.com',
                labelText: 'Correo Electronico',
                prefixIcon: Icons.alternate_email),
          ),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            decoration: InputDecorations.auth_InputDecoration(
              hintText: '*********',
              labelText: 'Constrasena',
              prefixIcon: Icons.lock_outline,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
            onPressed: (() {}),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.deepPurple,
            child: Container(
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
