import 'package:expense_manager/app/core/app_colors.dart';
import 'package:expense_manager/app/core/assets_path.dart';
import 'package:expense_manager/app/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultTextField extends StatefulWidget {
  final bool isPasswd;
  final bool showPasswd;
  final TextEditingController controller;
  final String label;
  final double width;
  final double height;
  const DefaultTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.isPasswd = false,
    this.showPasswd = false,
    this.width = 325,
    this.height = 50,
  }) : super(key: key);

  @override
  _DefaultTextFieldState createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextFormField(
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              widget.label,
              style: TextStyles.body2.copyWith(
                  fontWeight: FontWeight.normal, color: AppColors.primaryColor),
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: widget.isPasswd
                ? SvgPicture.asset(
                    widget.showPasswd
                        ? AssetsPath.closedEye
                        : AssetsPath.openEye,
                  )
                : SvgPicture.asset(AssetsPath.check),
          ),
        ),
        obscureText: widget.isPasswd,
      ),
    );
  }
}
