import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SigninReqParams {
  final String email;
  final String password;
  SigninReqParams({
    required this.email,
    required this.password,
  });

  factory SigninReqParams.fromJson(String source) =>
      SigninReqParams.fromMap(json.decode(source) as Map<String, dynamic>);

  factory SigninReqParams.fromMap(Map<String, dynamic> map) {
    return SigninReqParams(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}
