import 'package:blocrestdiocleanarch/domain/usecases/get_user_use_case.dart';
import 'package:blocrestdiocleanarch/presentation/home/bloc/user_display_state.dart';
import 'package:blocrestdiocleanarch/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDisplayCubit extends Cubit<UserDisplayState> {
  UserDisplayCubit() : super(UserLoading());

  void displayUser() async {
    var result = await sl<GetUserUseCase>().call();
    result.fold((error) {
      emit(UserFailure(errorMessage: error));
    }, (data) {
      emit(UserLoaded(userEntity: data));
    });
  }
}
