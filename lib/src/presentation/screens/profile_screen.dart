import 'package:flutter/material.dart';
import 'package:redops_test/src/data/constants.dart';
import '../maodel/user_model.dart';

class ProfileScreen extends StatelessWidget {
  User? user;

  ProfileScreen({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: RedopsConsts.KWiteColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children:  [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Profile",
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: RedopsConsts.KDarkColor),
              ),
              const SizedBox(height: 10,),
              Text(
                user?.uuid ?? "OfferFirst ID #32dd23j",
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: RedopsConsts.KDarkColor),
              ),
              const SizedBox(height: 10,),
              const CircleAvatar(radius: 50,backgroundColor: RedopsConsts.KDarkColor,),
              const SizedBox(height: 10,),
              Text(
               "${user?.firstName ?? "Holley"} ${user?.lastName ?? "Nelson"}",
                style: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: RedopsConsts.KDarkColor),
              ),
              const SizedBox(height: 10,),

              Text(
               user?.email ??  "Hnelson@gmal.com",
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: RedopsConsts.KDarkColor),
              ),
              const SizedBox(height: 10,),
              Text(
               user?.phoneNumber ?? "929-222-344",
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: RedopsConsts.KDarkColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
