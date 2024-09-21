import 'package:blocrestdiocleanarch/common/bloc/auth/auth_state.dart';
import 'package:blocrestdiocleanarch/common/bloc/auth/auth_state_cubit.dart';
import 'package:blocrestdiocleanarch/presentation/auth/pages/signup_page.dart';
import 'package:blocrestdiocleanarch/presentation/home/pages/home_page.dart';
import 'package:blocrestdiocleanarch/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black));
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthStateCubit()..appStarted(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthStateCubit, AuthState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return const HomePage();
            } else if (state is UnAuthenticated) {
              return SignupPage();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
