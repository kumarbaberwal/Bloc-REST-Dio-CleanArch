// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignupReqParams {
  final String username;
  final String email;
  final String password;
  SignupReqParams({
    required this.username,
    required this.email,
    required this.password,
  });

  factory SignupReqParams.fromJson(String source) =>
      SignupReqParams.fromMap(json.decode(source) as Map<String, dynamic>);

  factory SignupReqParams.fromMap(Map<String, dynamic> map) {
    return SignupReqParams(
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
