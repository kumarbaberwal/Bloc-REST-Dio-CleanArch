import 'package:blocrestdiocleanarch/common/bloc/button/button_state.dart';
import 'package:blocrestdiocleanarch/common/bloc/button/button_state_cubit.dart';
import 'package:blocrestdiocleanarch/common/widgets/button/basic_app_button.dart';
import 'package:blocrestdiocleanarch/data/models/signup_req_params.dart';
import 'package:blocrestdiocleanarch/domain/usecases/signup_use_case.dart';
import 'package:blocrestdiocleanarch/presentation/auth/pages/signin_page.dart';
import 'package:blocrestdiocleanarch/presentation/home/pages/home_page.dart';
import 'package:blocrestdiocleanarch/service_locator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController _usernameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonStateCubit(),
      child: Scaffold(
        body: BlocListener<ButtonStateCubit, ButtonState>(
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
              minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _signup(),
                    const SizedBox(
                      height: 50,
                    ),
                    _userNameField(),
                    const SizedBox(
                      height: 20,
                    ),
                    _emailField(),
                    const SizedBox(
                      height: 20,
                    ),
                    _password(),
                    const SizedBox(
                      height: 60,
                    ),
                    _createAccountButton(context),
                    const SizedBox(
                      height: 20,
                    ),
                    _signinText(context)
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget _createAccountButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicAppButton(
          title: 'Create Account',
          onPressed: () {
            context.read<ButtonStateCubit>().excute(
                usecase: sl<SignupUseCase>(),
                params: SignupReqParams(
                  email: _emailCon.text,
                  password: _passwordCon.text,
                  username: _usernameCon.text,
                ));
          });
    });
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade100,
        filled: true,
        hintText: 'Email',
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: InputBorder.none,
      ),
    );
  }

  Widget _password() {
    return TextField(
      controller: _passwordCon,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade100,
        filled: true,
        hintText: 'Password',
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: InputBorder.none,
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        const TextSpan(
            text: 'Do you have account?',
            style: TextStyle(
                color: Color(0xff3B4054), fontWeight: FontWeight.w500)),
        TextSpan(
            text: ' Sign In',
            style: const TextStyle(
                color: Color(0xff3461FD), fontWeight: FontWeight.w500),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SigninPage(),
                    ));
              })
      ]),
    );
  }

  Widget _signup() {
    return const Text(
      'Sign Up',
      style: TextStyle(
          color: Color(0xff2A4ECA), fontWeight: FontWeight.bold, fontSize: 32),
    );
  }

  Widget _userNameField() {
    return TextField(
      controller: _usernameCon,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade100,
        filled: true,
        hintText: 'Username',
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: InputBorder.none,
      ),
    );
  }
}
