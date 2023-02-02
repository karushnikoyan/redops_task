import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:redops_test/src/core/styls.dart';
import 'package:redops_test/src/data/constants.dart';
import 'package:redops_test/src/presentation/screens/sign_up_screen.dart';
import 'package:redops_test/src/presentation/widgets/redops_text_flide.dart';

import '../widgets/top_logo_container.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

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
              "Welcome back!",
              style: AppTextStyle.headerStyle,
            ),
            ReactiveForm(
              formGroup: form,
              child: Padding(
                padding: EdgeInsets.only(left: 44,right: 44,top: 26),
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
                      labelText: "Enter your email",
                      hintText: "Enter Your Emile ",
                      formControlName: "email",
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RedopsTextFiled(
                      labelText: "Enter your password",
                      hintText: "Enter Your Password ",
                      formControlName: "password",
                    ),

                    Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text("Forgot Password",
                              style: TextStyle(
                                color: Konsts.KDarkColor,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold
                              )),
                        )),
                    // ElevatedButton(
                    SizedBox(height: 26,),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        width: 250,
                        height: 43,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Konsts.KBlueAccentColor),
                        child: Center(
                            child: Text(
                          "Login",
                          style: TextStyle(
                              color: Konsts.KDarkColor,
                              fontWeight: FontWeight.bold
                          ),
                        )),
                      ),
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",
                        style: TextStyle(
                          color: Konsts.KDarkColor,
                          fontWeight: FontWeight.bold
                        ),),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpScreen()),
                            );



                          },
                          child: Text("Create an account.",
                              style: TextStyle(
                                color: Konsts.KBlueAccentColor,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold
                              )),
                        )

                      ],
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
