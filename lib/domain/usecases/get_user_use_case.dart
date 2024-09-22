import 'package:blocrestdiocleanarch/core/usecase/usecase.dart';
import 'package:blocrestdiocleanarch/domain/repository/auth_repository.dart';
import 'package:blocrestdiocleanarch/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetUserUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({param}) async {
    return await sl<AuthRepository>().getUser();
  }
}
