import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctors_community_app/core/di/dependancy_injection.dart';
import 'package:flutter_doctors_community_app/core/routing/routes.dart';
import 'package:flutter_doctors_community_app/features/forgot_password/presentation/forgot_password_screen.dart';
import 'package:flutter_doctors_community_app/features/home/presentation/home_screen.dart';
import 'package:flutter_doctors_community_app/features/login/logic/login_cubit/login_cubit.dart';
import 'package:flutter_doctors_community_app/features/login/presentation/login_screen.dart';
import 'package:flutter_doctors_community_app/features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.forgotScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No Route Defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
