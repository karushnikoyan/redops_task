import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  String? _accessToken;
  // bool? _isFirstOpen;

  String? get accessToken => _accessToken;



  bool get isAuthenticated {
    return _accessToken != null;
  }


  void loadToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = await sharedPreferences.getString("accessToken");
    if (accessToken != null) {
      _accessToken = accessToken;
    }
  }

  void saveToken(String accessToken) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    _accessToken = accessToken;
    sharedPreferences.setString("accessToken", accessToken);
  }


  // Future<void> logout() async {
  //   _accessToken = null;
  //   _sharedPreferences.remove("accessToken");
  // }
  //
  // Future<void> delete() async {
  //   _accessToken = null;
  //   _sharedPreferences.remove("accessToken");
  // }
}