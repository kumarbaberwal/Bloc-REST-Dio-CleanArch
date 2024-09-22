import 'package:blocrestdiocleanarch/common/bloc/button/button_state.dart';
import 'package:blocrestdiocleanarch/common/bloc/button/button_state_cubit.dart';
import 'package:blocrestdiocleanarch/common/widgets/button/basic_app_button.dart';
import 'package:blocrestdiocleanarch/domain/entities/user_entity.dart';
import 'package:blocrestdiocleanarch/domain/usecases/logout_use_case.dart';
import 'package:blocrestdiocleanarch/presentation/auth/pages/signup_page.dart';
import 'package:blocrestdiocleanarch/presentation/home/bloc/user_display_cubit.dart';
import 'package:blocrestdiocleanarch/presentation/home/bloc/user_display_state.dart';
import 'package:blocrestdiocleanarch/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => UserDisplayCubit()..displayUser()),
          BlocProvider(
            create: (context) => ButtonStateCubit(),
          )
        ],
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonSuccessState) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupPage(),
                  ));
            }
          },
          child: Center(
            child: BlocBuilder<UserDisplayCubit, UserDisplayState>(
              builder: (context, state) {
                if (state is UserLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is UserLoaded) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _username(state.userEntity),
                      const SizedBox(
                        height: 10,
                      ),
                      _email(state.userEntity),
                      const SizedBox(
                        height: 10,
                      ),
                      _logout(context),
                    ],
                  );
                } else if (state is UserFailure) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _email(UserEntity userEntity) {
    return Text(
      userEntity.email,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 19,
      ),
    );
  }

  Widget _logout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: BasicAppButton(
        onPressed: () {
          context.read<ButtonStateCubit>().excute(usecase: sl<LogoutUseCase>());
        },
        title: 'Logout',
      ),
    );
  }

  Widget _username(UserEntity userEntity) {
    return Text(
      userEntity.username,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 19,
      ),
    );
  }
}
