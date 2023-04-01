import 'package:expense_manager/app/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import '../../../../design_system/design_system_export.dart';

class IncomePage extends StatefulWidget {
  final UserEntity currentUser;
  const IncomePage({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Form(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: DefaultAppBar(
                    title: Strings.whatIsYourIncome.i18n(),
                    showBackButton: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    Strings.expensesAreAboveYourIncome.i18n(),
                    style: TextStyles.body4.copyWith(
                      color: AppColors.lightGrey,
                    ),
                  ),
                ),
                const VerticalSpace(height: 40),
                const DefaultKeyboard(),
                const VerticalSpace(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: DefaultButton(text: Strings.proceed.i18n(), onTap: () {}),
                ),
                // ValueListenableBuilder(
                //     valueListenable: _controller.loadingButton,
                //     builder: (context, value, child) {
                //       return DefaultButton(
                //         loading: _controller.loadingButton.value,
                //         text: Strings.login.i18n(),
                //         onTap: _controller.signInWithEmailAndPasswd,
                //         width: 325,
                //       );
                //     }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
