import 'package:flutter/material.dart';
import 'package:formulario/widgets/widget.dart';

class LoginScreenPage extends StatelessWidget {
  const LoginScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgrund(
        // aca estamos usabdo un componente que debera permitor hacer escroll
        // si es necesario, tener presente qye se desplegara un teclado para esribir sobre el
        // y para eso tendra que permitir scroll
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              CardContainerwidget(),
            ],
          ),
        ),
      ),
    );
  }
}
