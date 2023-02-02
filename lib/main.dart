import 'package:flutter/material.dart';
import 'package:redops_test/src/data/constants.dart';
import 'package:redops_test/src/presentation/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
      ),
      home: LoginScreen(),
    );
  }
}
