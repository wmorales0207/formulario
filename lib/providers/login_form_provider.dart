import 'dart:html';

import 'package:flutter/material.dart';

//// Used to catch the email - pass and check the both fiel restrictions
class LogingFormProvider extends ChangeNotifier {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  bool isFormValidated() {
    return loginFormKey.currentState?.validate() ?? false;
  }
}
