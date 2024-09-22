// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blocrestdiocleanarch/domain/entities/user_entity.dart';

abstract class UserDisplayState {}

class UserFailure extends UserDisplayState {
  final String errorMessage;
  UserFailure({
    required this.errorMessage,
  });
}

class UserLoaded extends UserDisplayState {
  final UserEntity userEntity;
  UserLoaded({
    required this.userEntity,
  });
}

class UserLoading extends UserDisplayState {}
