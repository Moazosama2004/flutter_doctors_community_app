import 'package:flutter/material.dart';
import 'package:flutter_doctors_community_app/features/forgot_password/presentation/widgets/forgot_password_screen_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ForgotPasswordScreenBody(),
    );
  }
}