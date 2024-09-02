import 'package:flutter/material.dart';
import 'package:flutter_doctors_community_app/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingCustomAppBar extends StatelessWidget {
  const OnBoardingCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svgs/doc_log.svg'),
        SizedBox(
          width: 10.w,
        ),
        Text(
          'Docdoc',
          style: TextStyles.font24BlueBold,
        ),
      ],
    );
  }
}
