import 'package:dio/dio.dart';
import 'package:redops_test/config.dart';
import '../../presentation/maodel/user_model.dart';

 class MainApi {
  Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<User?> registerUser(User user) async {

    final response = (await dio.post(
      "/api/user",
      options: Options(
        contentType: contentTypeJson,
      ),
      data: user.toJsonExceptuuid(),
    )) ;

    final createdUser = User.fromJson(response.data);

    return createdUser;
  }

  Future<User?> signIn(User user) async {
    final response = (await dio.post(
      "/api/user/login",
      options: Options(
        contentType: contentTypeJson,
      ),
      data: user.toLoginJson(),
    )) ;
    print(response.data);
    final usr = User.fromJson(response.data);

    return usr;
  }

}
