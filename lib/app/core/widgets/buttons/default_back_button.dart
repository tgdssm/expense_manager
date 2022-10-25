import 'package:expense_manager/app/core/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pop(),
      child: SvgPicture.asset(AssetsPath.arrowLeft),
    );
  }
}
