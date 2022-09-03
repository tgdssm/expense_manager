import 'package:expense_manager/app/core/app_colors.dart';
import 'package:expense_manager/app/core/text_styles.dart';
import 'package:flutter/material.dart';

class OutlineButton extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onTap;
  const OutlineButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.width = 152,
    this.height = 52,
  }) : super(key: key);

  @override
  State<OutlineButton> createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<OutlineButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: MaterialButton(
        onPressed: widget.onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27),
          side: const BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
        color: AppColors.white,
        child: Text(
          widget.text,
          style: TextStyles.body3.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
