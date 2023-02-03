import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:redops_test/src/core/styls.dart';
import 'package:redops_test/src/data/constants.dart';
import 'package:redops_test/src/presentation/provider/redops_provider.dart';
import 'package:redops_test/src/presentation/screens/profile_screen.dart';
import 'package:redops_test/src/presentation/screens/sign_up_screen.dart';
import 'package:redops_test/src/presentation/widgets/redops_text_flide.dart';

import '../widgets/top_logo_container.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final form = FormGroup({
    "loginEmail": FormControl(
      validators: [
        Validators.required,
        Validators.pattern(RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")),
        Validators.minLength(2)
      ],
    ),

    "loginPassword": FormControl(validators: [
      Validators.required,
      Validators.minLength(8),
      Validators.pattern(
          RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#\$%\^&\*])(?=.{8,})")),
    ])
  });

  @override
  Widget build(BuildContext context) {
    RedopsProvider provider = context.watch<RedopsProvider>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopLogoContainer(),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Welcome back!",
              style: AppTextStyle.headerStyle,
            ),
            ReactiveForm(
              formGroup: form,
              child: Padding(
                padding: const EdgeInsets.only(left: 44, right: 44, top: 26),
                child: Column(
                  children: [
                    RedopsTextFiled(
                      labelText: "Enter your email",
                      hintText: "Enter Your Emile ",
                      formControlName: "loginEmail",
                      controller: provider.logInEmailController,
                      // controller: ,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    RedopsTextFiled(
                      labelText: "Enter your password",
                      hintText: "Enter Your Password ",
                      formControlName: "loginPassword",
                      controller: provider.logInPasswordController,
                      obscureText: context.watch<RedopsProvider>().obscureIcon,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          provider.changeIcon();
                        },
                        child: context.watch<RedopsProvider>().obscureIcon
                            ? Image.asset("assets/Group 26.png")
                            : Image.asset("assets/Vector.png"),
                      ),
                    ),

                    Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text("Forgot Password",
                              style: TextStyle(
                                  color: RedopsConsts.KDarkColor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold)),
                        )),
                    // ElevatedButton(
                    const SizedBox(
                      height: 26,
                    ),
                    GestureDetector(
                      onTap: () async {
                        RedopsProvider provider =
                        context.read<RedopsProvider>();
                          final user = await provider.login();
                          print("________________________________");
                          print(user!.email);
                        if(form.valid) {
                          print("auuuuuuuuu!!!!!!!!!!!!!!!!!!!!!!!!!!");

                          // print(user?.toJson());

                          if (user != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProfileScreen(
                                      user: user,
                                    ),
                              ),
                            );
                          }
                        }

                      },
                      child: Container(
                        width: 250,
                        height: 43,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: RedopsConsts.KBlueAccentColor),
                        child: const Center(
                            child: Text(
                          "Login",
                          style: TextStyle(
                              color: RedopsConsts.KDarkColor,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                              color: RedopsConsts.KDarkColor,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                          child: const Text("Create an account.",
                              style: TextStyle(
                                  color: RedopsConsts.KBlueAccentColor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold)),
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
