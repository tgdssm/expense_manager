import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../design_system_export.dart';

class DefaultTextField extends StatefulWidget {
  final bool isPasswd;
  final bool showPasswd;
  final TextEditingController controller;
  final String label;
  final double width;
  final double height;
  final String? Function(String?)? validator;
  const DefaultTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.isPasswd = false,
    this.showPasswd = false,
    this.width = 325,
    this.height = 75,
    this.validator,
  }) : super(key: key);

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextFormField(
        controller: widget.controller,
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.lightRed),
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
        validator: widget.validator,
      ),
    );
  }
}
