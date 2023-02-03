import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../data/constants.dart';

class RedopsTextFiled extends StatelessWidget {
  String labelText;
  String hintText;
  String formControlName;
  Widget? suffixIcon;
  bool obscureText ;
  TextEditingController? controller;

  RedopsTextFiled(
      {required this.labelText,
      required this.hintText,
      required this.formControlName,
      this.controller,
      this.suffixIcon,
        this.obscureText = false,
      });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(

        suffixIcon: suffixIcon,
        labelText: "$labelText",
        labelStyle: TextStyle(
            color: RedopsConsts.KDarkColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
          borderSide: BorderSide(width: 1.8, color: RedopsConsts.KDarkColor),
        ),
        hintText: "$hintText",
      ),
      formControlName: formControlName,
      validationMessages: {
        ValidationMessage.required: (error) => "Please fill your $labelText",
        ValidationMessage.pattern: (error) => "Write correct $labelText",
        ValidationMessage.minLength: (error) => "Length is invalid",
        ValidationMessage.mustMatch: (error) =>
            "Password and confirm password must match",
      },
      // controller: provider.nameController ,
    );
  }
}
