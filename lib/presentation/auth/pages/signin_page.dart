import 'package:blocrestdiocleanarch/common/bloc/button/button_state.dart';
import 'package:blocrestdiocleanarch/common/bloc/button/button_state_cubit.dart';
import 'package:blocrestdiocleanarch/common/widgets/button/basic_app_button.dart';
import 'package:blocrestdiocleanarch/data/models/signin_req_params.dart';
import 'package:blocrestdiocleanarch/domain/usecases/signin_use_case.dart';
import 'package:blocrestdiocleanarch/presentation/auth/pages/signup_page.dart';
import 'package:blocrestdiocleanarch/presentation/home/pages/home_page.dart';
import 'package:blocrestdiocleanarch/service_locator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatelessWidget {
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => ButtonStateCubit(),
      child: BlocListener<ButtonStateCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonSuccessState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
          } else if (state is ButtonFailureState) {
            var snackBar = SnackBar(content: Text(state.errorMessage));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: SafeArea(
            minimum: const EdgeInsets.only(top: 100, left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _signin(),
                const SizedBox(
                  height: 50,
                ),
                _emailField(),
                const SizedBox(
                  height: 20,
                ),
                _password(),
                const SizedBox(
                  height: 20,
                ),
                _createAccountButton(context),
                const SizedBox(
                  height: 20,
                ),
                _signupText(context),
              ],
            )),
      ),
    ));
  }

  Widget _createAccountButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicAppButton(
          title: 'Login',
          onPressed: () {
            context.read<ButtonStateCubit>().excute(
                usecase: sl<SigninUseCase>(),
                params: SigninReqParams(
                    email: _emailCon.text, password: _passwordCon.text));
          });
    });
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(hintText: 'Email'),
    );
  }

  Widget _password() {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signin() {
    return const Text(
      'Sign In',
      style: TextStyle(
          color: Color(0xff2A4ECA), fontWeight: FontWeight.bold, fontSize: 32),
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        const TextSpan(
            text: "Don't you have account?",
            style: TextStyle(
                color: Color(0xff3B4054), fontWeight: FontWeight.w500)),
        TextSpan(
            text: ' Sign Up',
            style: const TextStyle(
                color: Color(0xff3461FD), fontWeight: FontWeight.w500),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage(),
                    ));
              })
      ]),
    );
  }
}
