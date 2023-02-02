import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:redops_test/src/presentation/screens/profile_screen.dart';

import '../../core/styls.dart';
import '../../data/constants.dart';
import '../widgets/redops_text_flide.dart';
import '../widgets/top_logo_container.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final form = FormGroup({
    "email": FormControl(
      validators: [
        Validators.required,
        Validators.pattern(RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")),
        Validators.minLength(2)
      ],
    ),
    "name": FormControl(validators: [
      Validators.required,
      Validators.minLength(2),
      Validators.pattern(RegExp(r'^[a-zA-Z ]+$'))
    ]),
    "password": FormControl(validators: [
      Validators.required,
      Validators.minLength(8),
      Validators.pattern(
          RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#\$%\^&\*])(?=.{8,})")),
    ]),
    "phoneNumber": FormControl(validators: [
      Validators.required,
      Validators.minLength(8),
      Validators.pattern(RegExp(r"^(\+374|0)([0-9]\d{2})(\d{6})$")),
    ])
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopLogoContainer(),
            SizedBox(
              height: 40,
            ),
            Text(
              "Registration",
              style: AppTextStyle.headerStyle,
            ),
            ReactiveForm(
              formGroup: form,
              child: Padding(
                padding: EdgeInsets.all(44.0),
                child: Column(
                  children: [
                    // ReactiveTextField(
                    //   decoration: const InputDecoration(
                    //     labelText: "Enter name",
                    //     labelStyle: TextStyle(
                    //         color: Konsts.KDarkColor,
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.bold),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(14.0)),
                    //       // borderSide: BorderSide(width: 3, color: Konsts.KDarkColor),
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(14.0)),
                    //       borderSide: BorderSide(
                    //           width: 1.8,
                    //           color: Konsts.KDarkColor), //<-- SEE HERE
                    //     ),
                    //     hintText: 'Enter a search term',
                    //   ),
                    //   formControlName: 'name',
                    //   validationMessages: {
                    //     ValidationMessage.required: (error) =>
                    //         "Please Fill Your Name",
                    //     ValidationMessage.pattern: (error) =>
                    //         "Write correct name",
                    //     ValidationMessage.minLength: (error) =>
                    //         "Minimum length is 2",
                    //   },
                    //   // controller: provider.nameController ,
                    // ),
                    RedopsTextFiled(
                      labelText: "Enter your first name",
                      hintText: "Enter your first name ",
                      formControlName: "name",
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RedopsTextFiled(
                      labelText: "Enter your last name",
                      hintText: "Enter your last name ",
                      formControlName: "name",
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    RedopsTextFiled(
                      labelText: "Enter your email",
                      hintText: "Enter your emile ",
                      formControlName: "email",
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Please use a personal email address.",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Konsts.KDarkColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RedopsTextFiled(
                      labelText: "Enter your phone number",
                      hintText: "Enter your phone number ",
                      formControlName: "phoneNumber",
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    RedopsTextFiled(
                      labelText: "Enter your password",
                      hintText: "Enter your password ",
                      formControlName: "password",
                    ),
                    Text(
                      "Password must contain at least 8 characters, at least 1 capital, 1 lowercase, 1 special character.",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Konsts.KDarkColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    RedopsTextFiled(
                      labelText: "Confirm your password",
                      hintText: "Enter your password ",
                      formControlName: "password",
                    ),

                    RichText(
                      text: TextSpan(
                        text:
                            'By clicking Create Account I  acknowledge that  I have read and accepted the ',
                        style: TextStyle(
                          color: Konsts.KDarkColor,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Terms and Conditions',
                              style: TextStyle(
                              decoration: TextDecoration.underline,
                                color: Konsts.KBlueAccentColor,
                              )),
                          TextSpan(
                            text: '.',
                            style: TextStyle(
                              color: Konsts.KDarkColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ElevatedButton(
                    SizedBox(
                      height: 26,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileScreen()),
                        );
                      },
                      child: Container(
                        width: 250,
                        height: 43,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Konsts.KBlueAccentColor),
                        child: const Center(
                            child: Text(
                          "Creat Account",
                          style: TextStyle(
                              color: Konsts.KDarkColor,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
