import 'package:flutter/material.dart';
import 'package:flutter_doctors_community_app/features/onboarding/widgets/onboarding_screen_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingScreenBody(),
    );
  }
}