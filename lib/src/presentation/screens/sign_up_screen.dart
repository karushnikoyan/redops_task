import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:redops_test/src/presentation/screens/login_screen.dart';
import '../../core/styls.dart';
import '../../data/constants.dart';
import '../provider/redops_provider.dart';
import '../widgets/redops_text_flide.dart';
import '../widgets/top_logo_container.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

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
    "lastName": FormControl(validators: [
      Validators.required,
      Validators.minLength(2),
      Validators.pattern(RegExp(r'^[a-zA-Z ]+$'))
    ]),
    "password": FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8),
      Validators.pattern(
          RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#\$%\^&\*])(?=.{8,})")),
    ]),
    'passwordConfirmation': FormControl<String>(),

    "phoneNumber": FormControl(validators: [
      Validators.required,
      Validators.minLength(8),
      Validators.number,
    ])
  },
      validators: [
    Validators.mustMatch('password', 'passwordConfirmation'),
  ]);

  @override
  Widget build(BuildContext context) {
    final RedopsProvider provider = context.watch<RedopsProvider>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopLogoContainer(),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Registration",
              style: AppTextStyle.headerStyle,
            ),
            ReactiveForm(
              formGroup: form,
              child: Padding(
                padding: const EdgeInsets.all(44.0),
                child: Column(
                  children: [
                    RedopsTextFiled(
                      labelText: "Enter your first name",
                      hintText: "Enter your first name ",
                      formControlName: "name",
                      controller: provider.firstNameController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    RedopsTextFiled(
                      labelText: "Enter your last name",
                      hintText: "Enter your last name ",
                      formControlName: "lastName",
                      controller: provider.lastNameController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    RedopsTextFiled(
                      labelText: "Enter your email",
                      hintText: "Enter your emile ",
                      formControlName: "email",
                      controller: provider.emailController,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Please use a personal email address.",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: RedopsConsts.KDarkColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    RedopsTextFiled(
                      labelText: "Enter your phone number",
                      hintText: "Enter your phone number ",
                      formControlName: "phoneNumber",
                      controller: provider.phoneNumberController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    RedopsTextFiled(
                      labelText: "Enter your password",
                      hintText: "Enter your password ",
                      formControlName: "password",
                      controller: provider.passwordController,
                      obscureText: context.watch<RedopsProvider>().obscureIcon,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          Provider.of<RedopsProvider>(context, listen: false)
                              .changeIcon();
                        },
                        child: context.watch<RedopsProvider>().obscureIcon
                            ? Image.asset("assets/Group 26.png")
                            : Image.asset("assets/Vector.png"),
                      ),
                    ),
                    const Text(
                      "Password must contain at least 8 characters, at least 1 capital, 1 lowercase, 1 special character.",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: RedopsConsts.KDarkColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    RedopsTextFiled(
                      labelText: "Confirm your password",
                      hintText: "Enter your password ",
                      formControlName: "passwordConfirmation",
                      // confirm controller ?
                      obscureText:
                          context.watch<RedopsProvider>().obscureIconConf,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          Provider.of<RedopsProvider>(context, listen: false)
                              .changeIconConf();
                        },
                        child: context.watch<RedopsProvider>().obscureIconConf
                            ? Image.asset("assets/Group 26.png")
                            : Image.asset("assets/Vector.png"),
                      ),
                    ),

                    RichText(
                      text: const TextSpan(
                        text:
                            'By clicking Create Account I  acknowledge that  I have read and accepted the ',
                        style: TextStyle(
                          color: RedopsConsts.KDarkColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Terms and Conditions',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: RedopsConsts.KBlueAccentColor,
                              )),
                          TextSpan(
                            text: '.',
                            style: TextStyle(
                              color: RedopsConsts.KDarkColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ElevatedButton(
                    const SizedBox(
                      height: 26,
                    ),
                    GestureDetector(
                      onTap: () async {
                        // form.markAllAsTouched();
                        if (form.valid) {
                          print("aaa");
                        RedopsProvider provider =
                            context.read<RedopsProvider>();
                        final user = await provider.register();
                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return LoginScreen();
                        // }));
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                              LoginScreen()), (Route<dynamic> route) => false);


                        };
                      },
                      child: Container(
                        width: 250,
                        height: 43,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: RedopsConsts.KBlueAccentColor),
                        child: const Center(
                            child: Text(
                          "Creat Account",
                          style: TextStyle(
                              color: RedopsConsts.KDarkColor,
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
