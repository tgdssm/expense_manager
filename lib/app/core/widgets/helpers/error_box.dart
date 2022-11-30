import 'package:expense_manager/app/core/app_colors.dart';
import 'package:expense_manager/app/core/text_styles.dart';
import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  final String error;
  const ErrorBox({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.lightRed.withOpacity(.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(child: Text(error, style: TextStyles.body1.copyWith(color: AppColors.lightRed))),
    );
  }
}
