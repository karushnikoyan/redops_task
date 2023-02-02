import 'package:flutter/material.dart';
import 'package:redops_test/src/data/constants.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Konsts.KWiteColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [
              SizedBox(
                height: 100,
              ),
              Text(
                "Profile",
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Konsts.KDarkColor),
              ),
              SizedBox(height: 10,),
              Text(
                "OfferFirst ID #32dd23j",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Konsts.KDarkColor),
              ),
              SizedBox(height: 10,),
              CircleAvatar(radius: 50,backgroundColor: Konsts.KDarkColor,),
              SizedBox(height: 10,),
              Text(
                "Holley Nelson",
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Konsts.KDarkColor),
              ),
              SizedBox(height: 10,),

              Text(
                "Hnelson@gmal.com",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Konsts.KDarkColor),
              ),
              SizedBox(height: 10,),
              Text(
                "929-222-344",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Konsts.KDarkColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
