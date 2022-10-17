import 'package:flutter/material.dart';

//// Used to catch the email - pass and check the both fiel restrictions
class LogingFormProvider extends ChangeNotifier {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _isLoading = false;

  bool isFormValidated() {
    return loginFormKey.currentState?.validate() ?? false;
  }

  set isLoading(bool value) {
    _isLoading = value;
    // esta linea garantiza que todo los widget que estan escchando  sean notificados
    notifyListeners();
  }

  bool get isLoading => _isLoading;
}
