import 'package:flutter/cupertino.dart';
import 'package:redops_test/src/core/api/api.dart';
import 'package:redops_test/src/core/local_storage.dart';
import '../maodel/user_model.dart';

class RedopsProvider with ChangeNotifier{

  final LocalStorage _storage = LocalStorage() ;
  MainApi mainApi = MainApi();
  User? user;
  bool obscureIcon = true;
  bool obscureIconConf = true;
  void changeIcon(){
    obscureIcon = !obscureIcon;
    notifyListeners();
  }

  void changeIconConf(){
    obscureIconConf = !obscureIconConf;
    notifyListeners();
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController logInEmailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController logInPasswordController = TextEditingController();



    Future<User?> login() async{
    print(logInEmailController.text);///sig tamam kuda
    print("))))))))))))))))))))))))))++++++");
    user = User(
      email: logInEmailController.text,
      password: logInPasswordController.text
    );

    user = await mainApi.signIn(user!);

    if(user?.token != null){
      _storage.saveToken(user!.token!);
    }
    return user;

  }

  Future<User?> register() async {
    user = User(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      phoneNumber: phoneNumberController.text.trim(),
    );
    print("###################################################################__");
    print(user?.firstName);
    print(user?.lastName);
    user = await mainApi.registerUser(user!);
    if(user?.token != null){
      _storage.saveToken(user!.token!);
    }

    return user;
  }




}