import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(height: 444,
            decoration: BoxDecoration(),),
          Container(height: 300,color: Colors.green,),
        ],
      ),

    );
  }
}
