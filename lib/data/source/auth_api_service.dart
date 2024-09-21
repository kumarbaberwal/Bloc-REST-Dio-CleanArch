import 'package:blocrestdiocleanarch/core/constants/api_urls.dart';
import 'package:blocrestdiocleanarch/core/network/dio_client.dart';
import 'package:blocrestdiocleanarch/data/models/signup_req_params.dart';
import 'package:blocrestdiocleanarch/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AuthApiService {
  Future<Either> signup(SignupReqParams signupReqParams);
}

class AuthApiServiceImpl extends AuthApiService {
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
}
