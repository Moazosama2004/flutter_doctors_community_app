import 'package:flutter/material.dart';
import 'package:flutter_doctors_community_app/core/theming/styles.dart';
import 'package:flutter_doctors_community_app/features/onboarding/widgets/doctor_images_and_text.dart';
import 'package:flutter_doctors_community_app/features/onboarding/widgets/get_started_button.dart';
import 'package:flutter_doctors_community_app/features/onboarding/widgets/onboarding_custom_app_bar.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreenBody extends StatelessWidget {
  const OnBoardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Column(
            children: [
              const OnBoardingCustomAppBar(),
              SizedBox(
                height: 15.h,
              ),
              const DoctorImageAndText(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Text(
                      'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                      style: TextStyles.font13GrayRegular,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    const GetStartedButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
