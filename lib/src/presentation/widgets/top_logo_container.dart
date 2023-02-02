import 'package:flutter/cupertino.dart';

class TopLogoContainer extends StatelessWidget {
  const TopLogoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(
                50,
                60,
                72,
                1,
              ),
              Color.fromRGBO(50, 60, 72, 0.9),
            ],
          )),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/smallIcon.png"),
                const SizedBox(
                  width: 10.0,
                ),
                Image.asset("assets/Group.png"),
              ],
            ),
            const SizedBox(
              height: 42.0,
            ),
            Image.asset("assets/Logo.png"),
          ],
        ),

      ),
    );
  }
}
