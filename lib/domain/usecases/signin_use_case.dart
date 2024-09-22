import 'package:blocrestdiocleanarch/core/usecase/usecase.dart';
import 'package:blocrestdiocleanarch/data/models/signin_req_params.dart';
import 'package:blocrestdiocleanarch/domain/repository/auth_repository.dart';
import 'package:blocrestdiocleanarch/service_locator.dart';
import 'package:dartz/dartz.dart';

class SigninUseCase extends UseCase<Either, SigninReqParams> {
  @override
  Future<Either> call({SigninReqParams? param}) async {
    return await sl<AuthRepository>().signin(param!);
  }
}
