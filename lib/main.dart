import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redops_test/src/presentation/provider/redops_provider.dart';
import 'package:redops_test/src/presentation/screens/login_screen.dart';

void main() {
  runApp(

  MultiProvider(providers: [
      ChangeNotifierProvider(
      create: (_) => RedopsProvider(),
  )

  ],
  child : RedopsApp()),

  );
}

class RedopsApp extends StatelessWidget {
  const RedopsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: LoginScreen(),
    );
  }
}
