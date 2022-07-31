import 'package:expense_manager/app/core/assets_path.dart';
import 'package:expense_manager/app/core/buttons/default_button.dart';
import 'package:expense_manager/app/core/buttons/outline_button.dart';
import 'package:expense_manager/app/core/helpers/horizontal_space.dart';
import 'package:expense_manager/app/core/helpers/vertical_space.dart';
import 'package:expense_manager/app/core/strings.dart';
import 'package:expense_manager/app/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildPage(),
            VerticalSpace(height: 120),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultButton(
                  text: Strings.createAccount.i18n(),
                  onTap: () {},
                ),
                HorizontalSpace(width: 21),
                OutlineButton(
                  text: Strings.login.i18n(),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildPage() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          VerticalSpace(height: 60),
          SizedBox(
            height: 247,
            child: Image.asset(AssetsPath.standing),
          ),
          VerticalSpace(height: 73),
          Text(
            Strings.welcome.i18n(),
            style: TextStyles.heading4,
          ),
          VerticalSpace(height: 17),
          SizedBox(
            height: 50,
            width: 264,
            child: Text(
              Strings.inThisApp.i18n(),
              style: TextStyles.body4,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
