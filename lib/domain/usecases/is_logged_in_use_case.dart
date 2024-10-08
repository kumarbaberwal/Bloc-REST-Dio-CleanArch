import 'package:blocrestdiocleanarch/core/usecase/usecase.dart';
import 'package:blocrestdiocleanarch/domain/repository/auth_repository.dart';
import 'package:blocrestdiocleanarch/service_locator.dart';

class IsLoggedInUseCase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({param}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
