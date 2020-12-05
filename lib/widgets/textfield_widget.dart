import 'package:flutter/material.dart';
import 'package:closor/constants.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isobscureText;
  FormFieldValidator<String> validator;

  TextFieldWidget({
    this.controller,
    this.validator,
    @required this.hintText,
    this.isobscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      child: TextFormField(
        autovalidate: false,
        validator: validator,
        controller: controller,
        obscureText: isobscureText,
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            fillColor: KSecondColor,
            contentPadding: EdgeInsets.all(20),
//            errorText: text2,
            filled: true,
            hintText: hintText,
            hintStyle: kTextStyle),
      ),
    );
  }
}
