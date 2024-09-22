import 'package:blocrestdiocleanarch/core/constants/api_urls.dart';
import 'package:blocrestdiocleanarch/core/network/dio_client.dart';
import 'package:blocrestdiocleanarch/data/models/signin_req_params.dart';
import 'package:blocrestdiocleanarch/data/models/signup_req_params.dart';
import 'package:blocrestdiocleanarch/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthApiService {
  Future<Either> getUser();
  Future<Either> signup(SignupReqParams signupReqParams);
  Future<Either> signin(SigninReqParams signinReqParams);
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> getUser() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      var response = await sl<DioClient>().get(ApiUrls.userProfile,
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));

      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signup(SignupReqParams signupReqParams) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrls.register,
        data: signupReqParams.toMap(),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> signin(SigninReqParams signinReqParams) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrls.login,
        data: signinReqParams.toMap(),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
