import 'package:expense_manager/app/core/app_colors.dart';
import 'package:expense_manager/app/core/text_styles.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onTap;
  const DefaultButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.width = 152,
    this.height = 52,
  }) : super(key: key);

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: MaterialButton(
        onPressed: widget.onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27),
        ),
        color: AppColors.primaryColor,
        child: Text(
          widget.text,
          style: TextStyles.body5,
        ),
      ),
    );
  }
}
