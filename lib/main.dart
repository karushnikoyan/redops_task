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
  List<int> listNumbers=[1,2,3,4,556,4,5,67,8,543,235,6745,78,45365,6643,6,8];


  List<int> func(List<int> list ,int target){
    List<int> a =[];
    print("---------------------------------------------------------------------");

    print(list);

    for(int i = 0;i < list.length;i++){

        for(int j = 1;j<list.length;j++){
          if(list[i] + list[j] == target){
            a.add(i);
            a.add(j);
            print("i = $i");
            print("j = $j");
            print("first number is :${list[i]}");
            print("second number is :${list[j]}");
            return  a;

          }
        }
      // }
    }

      print("cant find ---------------------------");

    return a;
  };

  print(func(listNumbers,11));


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
