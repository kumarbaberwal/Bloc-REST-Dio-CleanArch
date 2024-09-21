import 'package:blocrestdiocleanarch/data/models/signup_req_params.dart';
import 'package:blocrestdiocleanarch/data/source/auth_api_service.dart';
import 'package:blocrestdiocleanarch/domain/repository/auth_repository.dart';
import 'package:blocrestdiocleanarch/service_locator.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(SignupReqParams signupReqParams) async {
    return await sl<AuthApiService>().signup(signupReqParams);
  }
}
