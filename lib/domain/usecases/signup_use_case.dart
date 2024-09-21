import 'package:blocrestdiocleanarch/core/usecase/usecase.dart';
import 'package:blocrestdiocleanarch/data/models/signup_req_params.dart';
import 'package:blocrestdiocleanarch/domain/repository/auth_repository.dart';
import 'package:blocrestdiocleanarch/service_locator.dart';
import 'package:dartz/dartz.dart';

class SignupUseCase extends UseCase<Either, SignupReqParams> {
  @override
  Future<Either> call({SignupReqParams? param}) async {
    return await sl<AuthRepository>().signup(param!);
  }
}
