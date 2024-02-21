import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c10_sun3/my_theme.dart';

// typedef MyValidator = String? Function(String?);
class CustomTextFormField extends StatelessWidget {
  String label;

  TextInputType keyboardType;

  TextEditingController controller;

  String? Function(String?) validator;

  bool obscureText;

  CustomTextFormField(
      {required this.label,
      required this.controller,
      required this.validator,
      this.keyboardType = TextInputType.text,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyTheme.primaryColor, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyTheme.primaryColor, width: 2)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyTheme.redColor, width: 2)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyTheme.redColor, width: 2)),
        ),
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        obscureText: obscureText,
      ),
    );
  }
}
