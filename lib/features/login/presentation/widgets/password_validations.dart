import 'package:flutter/material.dart';
import 'package:flutter_doctors_community_app/core/helpers/spacing.dart';
import 'package:flutter_doctors_community_app/core/theming/colors.dart';
import 'package:flutter_doctors_community_app/core/theming/styles.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class PasswirdValidations extends StatelessWidget {
  const PasswirdValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialChar,
    required this.hasNumber,
    required this.hasMinLength,
  });
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialChar;
  final bool hasNumber;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(
          text: 'At least 1 lowercase letter',
          hasValidated: hasLowerCase,
        ),
        verticalSpacing(height: 2),
        buildValidationRow(
          text: 'At least 1 uppercase letter',
          hasValidated: hasUpperCase,
        ),
        verticalSpacing(height: 2),
        buildValidationRow(
          text: 'At least 1 special character',
          hasValidated: hasSpecialChar,
        ),
        verticalSpacing(height: 2),
        buildValidationRow(
          text: 'At least 1 number',
          hasValidated: hasNumber,
        ),
        verticalSpacing(height: 2),
        buildValidationRow(
          text: 'At least 8 characters long',
          hasValidated: hasMinLength,
        ),
      ],
    );
  }

  buildValidationRow({required String text, required bool hasValidated}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorManager.maingray,
        ),
        horizontalSpacing(width: 6),
        Text(text,
            style: TextStyles.font13GrayRegular.copyWith(
                decoration: hasValidated ? TextDecoration.lineThrough : null,
                decorationColor: Colors.green,
                decorationThickness: 2,
                color: hasValidated
                    ? ColorManager.maingray
                    : ColorManager.mainBlue)),
      ],
    );
  }
}
