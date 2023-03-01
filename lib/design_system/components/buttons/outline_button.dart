import 'package:flutter/material.dart';

import '../../design_system_export.dart';

class OutlineButton extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onTap;
  final String? iconPath;
  const OutlineButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.width = 152,
    this.height = 52,
    this.iconPath,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.iconPath != null)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(widget.iconPath!),
              ),
            Text(
              widget.text,
              style: TextStyles.body3.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
