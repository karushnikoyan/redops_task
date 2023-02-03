


import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';



@JsonSerializable()
class User{
String? uuid;
String? firstName;
String? lastName;
String? email;
String? password;
String? token;
String? phoneNumber;

User({ this.firstName, this.lastName, this.email, this.password, this.token, this.phoneNumber, this.uuid});

factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

Map<String, dynamic> toJson() => _$UserToJson(this);

Map<String, dynamic> toJsonExceptuuid() => <String, dynamic>{
  'firstName': firstName,
  'lastName': lastName,
  'email': email,
  'password': password,
  'phoneNumber': phoneNumber,
};

Map<String, dynamic> toLoginJson() => <String, dynamic>{
  'email': email,
  'password': password,
};

}