import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../data/constants.dart';

class RedopsTextFiled extends StatelessWidget {
   String labelText;
   String hintText;
   String formControlName;
   TextEditingController? controller;

   RedopsTextFiled({
     required this.labelText,
     required this.hintText ,
     required this.formControlName,
   this.controller
   }
   );


  @override
  Widget build(BuildContext context) {
    return  ReactiveTextField(
      decoration:  InputDecoration(
        labelText: "$labelText",
        labelStyle: TextStyle(color: Konsts.KDarkColor,fontSize: 20,fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
          // borderSide: BorderSide(width: 3 , color: Konsts.KDarkColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
          borderSide: BorderSide(
              width: 1.8, color: Konsts.KDarkColor), //<-- SEE HERE
        ),
        hintText: "$hintText",
      ),
      formControlName: formControlName,
      validationMessages: {
        ValidationMessage.required: (error) =>
        "Please Fill Your $labelText",
        ValidationMessage.pattern: (error) =>
        "Write correct $labelText",
        ValidationMessage.minLength: (error) =>
        "Length is invalid",
      },
      // controller: provider.nameController ,
    );
  }

}
