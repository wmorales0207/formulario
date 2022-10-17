import 'package:flutter/material.dart';
import 'package:formulario/global/input_decoration.dart';
import 'package:formulario/providers/login_form_provider.dart';
import 'package:formulario/widgets/widget.dart';
import 'package:provider/provider.dart';

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
                    // aqui se hace la llamada y cierra la viculacion entre el LogingFormProvider(),_loginForm() a traves del KEY
                    // Se crea una instancia de loginprovider, que poria hasta redibujar los widget y solo va a vovor dentro de este scope
                    ChangeNotifierProvider(
                      create: (_) => LogingFormProvider(),
                      child: _loginForm(),
                    ),
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
    // con esta instancia tengo acceso a todo lo que esta clase me ofrece, puedo mover la informacion que
    // aqui se genere o se entre.
    final loginForm = Provider.of<LogingFormProvider>(context);

    return Form(
      // esta linea es parte de la vinculacion del login form provider y Provider.
      key: loginForm.loginFormKey,

      // el key puede ser util para identfcar si todos los componentes pasaron
      // ls verificaciones necesarias. el validator de los textField se evalua con cada tecla que se
      // oprime, pero no se ejecuta cuando se oprima el aceptar.
      // esta opcion permite que se capturen las validadaciones
      // para Mantener el estado global del formulario  hay varias formas, una es BLOc, Gestores de estado(Provider ,GetX)
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.auth_InputDecoration(
                hintText: 'jonh doe@gmail.com',
                labelText: 'Correo Electronico',
                prefixIcon: Icons.alternate_email),
            validator: (value) {
              // esta funcion devuelve un String y es lo que se pondra debajo del
              //de coponente cuando no pase la validacion

              // este campo recibe una funcion la cual evalua el lo estrito.
              // en esta line si pones el (value.length >= 6) fallaria en el caso que fuse null
              (value != null && value.length >= 6)
                  ? null
                  : 'La contrasena debe tener mas de 6 caracteres ';

              //(?:(?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$;
              // The password must have a Uppercase, lowercase letter and a number
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              // la cadena de Pareon leva r'pattern';  la r es obligatoria
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(
                      value ?? '') // si el valor es nulo reemplazalo por vacio
                  ? null // si el correo es valido no haga nada
                  : 'No es un formato valido de @';
            },
            onChanged: (value) => loginForm.email = value,
          ),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            decoration: InputDecorations.auth_InputDecoration(
              hintText: '*********',
              labelText: 'Constrasena',
              prefixIcon: Icons.lock_outline,
            ),
            validator: (value) {
              String pattern =
                  r'(?:(?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(
                      value ?? '') // si el valor es nulo reemplazalo por vacio
                  ? null // si el correo es valido no haga nada
                  : 'The password must have a Uppercase, lowercase letter and a number';
            },
            onChanged: ((value) => loginForm.password = value),
          ),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
            onPressed: (loginForm.isFormValidated()
                ? null
                : () async {
                    if (!loginForm.isFormValidated()) {
                      return;
                    } else {
                      // regresa al home pero sin posibidad de regresar  al login, que
                      // esta line elimina la ruta del arbol de widget.
                      Navigator.pushReplacementNamed(context, 'home');
                      // esta line ame sirve para cambiar el texto que a ESPERE
                      loginForm.isLoading = true;

                      // esta linea me sive para quitar el teclado cuando se presione el boton de acepatr.
                      FocusScope.of(context).unfocus();
                      await Future.delayed(
                        // esta linea simula un backend,
                        const Duration(seconds: 3),
                      );

                      loginForm.isLoading = false;

                      Navigator.popAndPushNamed(context, 'home');
                    }
                  }),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.deepPurple,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(
                loginForm.isLoading ? 'Espere..' : 'Ingresar',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
