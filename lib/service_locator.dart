import 'package:blocrestdiocleanarch/core/network/dio_client.dart';
import 'package:blocrestdiocleanarch/data/repository/auth_repository_impl.dart';
import 'package:blocrestdiocleanarch/data/source/auth_api_service.dart';
import 'package:blocrestdiocleanarch/domain/repository/auth_repository.dart';
import 'package:blocrestdiocleanarch/domain/usecases/signup_use_case.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Service
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // UseCase

  sl.registerSingleton<SignupUseCase>(SignupUseCase());
}
