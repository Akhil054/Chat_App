import 'package:flutter/material.dart';

import '../utils/textfield_Styles.dart';

class LoginTextfield extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool hasAstricks;

  const LoginTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.hasAstricks  = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hasAstricks,
      ///validator properties that has callback value i.e takes the value & checks for given condition
      validator: (value) {
        if(validator != null)
          return validator!(value);
      },

      /// coming from parent class
      controller: controller,   //refer the object of TextEditingController
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: ThemeTextStyle.loginTextField,
          border: OutlineInputBorder()
      ),
    );
  }
}
