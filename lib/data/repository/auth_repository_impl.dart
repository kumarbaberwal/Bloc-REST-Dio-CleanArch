import 'package:blocrestdiocleanarch/data/models/signup_req_params.dart';
import 'package:blocrestdiocleanarch/data/models/user_model.dart';
import 'package:blocrestdiocleanarch/data/source/auth_api_service.dart';
import 'package:blocrestdiocleanarch/data/source/auth_local_service.dart';
import 'package:blocrestdiocleanarch/domain/repository/auth_repository.dart';
import 'package:blocrestdiocleanarch/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> getUser() async {
    Either result = await sl<AuthApiService>().getUser();
    return result.fold((error) {
      return Left(error);
    }, (data) {
      Response response = data;
      var model = UserModel.fromMap(response.data);
      var userEntity = model.toEntity();
      return Right(userEntity);
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthLocalService>().isLoggedIn();
  }

  @override
  Future<Either> signup(SignupReqParams signupReqParams) async {
    Either result = await sl<AuthApiService>().signup(signupReqParams);
    return result.fold((error) {
      return Left(error);
    }, (data) async {
      Response response = data;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', response.data['token']);
      return Right(response);
    });
  }

  @override
  Future logout() async {
    return await sl<AuthLocalService>().logout();
  }
}
