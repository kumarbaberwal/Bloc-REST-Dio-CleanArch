import 'package:blocrestdiocleanarch/data/models/signin_req_params.dart';
import 'package:blocrestdiocleanarch/data/models/signup_req_params.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either> signup(SignupReqParams signupReqParams);
  Future<Either> signin(SigninReqParams signinReqParams);
  Future<bool> isLoggedIn();
  Future<Either> getUser(); 
  Future<Either> logout(); 
}
