import 'dart:convert';

import 'package:blocrestdiocleanarch/domain/entities/user_entity.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String email;
  final String username;
  UserModel({
    required this.email,
    required this.username,
  });

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      username: map['username'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'username': username,
    };
  }
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      email: email,
      username: username,
    );
  }
}
