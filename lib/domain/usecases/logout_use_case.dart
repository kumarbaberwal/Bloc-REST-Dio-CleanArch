import 'package:blocrestdiocleanarch/core/usecase/usecase.dart';
import 'package:blocrestdiocleanarch/domain/repository/auth_repository.dart';
import 'package:blocrestdiocleanarch/service_locator.dart';

class LogoutUseCase extends UseCase<dynamic, dynamic> {
  @override
  Future call({param}) async {
    return await sl<AuthRepository>().logout();
  }
}
