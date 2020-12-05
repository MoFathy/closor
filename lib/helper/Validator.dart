import 'package:flutter/cupertino.dart';

String validatorRequired(value) {
  if (value.isEmpty) {
    return '';
  }
  return null;
}

String validatorEmail(value) {
  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);

  if (value.isEmpty || !emailValid) {
    return 'Wrong Email';
  }

  return null;
}

String validatorRequiredDependOn(String value, TextEditingController controller) {

  if ((value.isEmpty &&
      controller.text.isNotEmpty )||
      (controller.text.isNotEmpty &&
          controller.text !='0.0' &&
      value == '0.0'
      )) {
    return '';
  }
  return null;
}
