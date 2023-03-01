import 'package:flutter/material.dart';

import '../../design_system_export.dart';

class DefaultButton extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onTap;
  final bool loading;
  const DefaultButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.width = 152,
    this.height = 52,
    this.loading = false,
  }) : super(key: key);

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      height: widget.height,
      width: widget.loading ? 52 : widget.width,
      curve: Curves.easeIn,
      child: widget.loading
          ? Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )
          : MaterialButton(
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
