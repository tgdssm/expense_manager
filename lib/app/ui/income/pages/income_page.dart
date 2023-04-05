import 'package:expense_manager/app/ui/income/controllers/income_controller.dart';
import 'package:expense_manager/core/core_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toast_widget/toast.dart';
import 'package:localization/localization.dart';
import '../../../../design_system/design_system_export.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  final _controller = injection<IncomeController>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: _controller.errorMessage,
            builder: (context, value, child) {
              return SizedBox(
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
                      DefaultKeyboard(
                        value: (value) {
                          _controller.income = value;
                        },
                      ),
                      const VerticalSpace(height: 40),
                      ValueListenableBuilder(
                        valueListenable: _controller.loadingButton,
                        builder: (context, value, child) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: DefaultButton(
                              loading: _controller.loadingButton.value,
                              text: Strings.proceed.i18n(),
                              onTap: () {
                                _controller.setIncome().then((_) {
                                  if (_controller
                                      .errorMessage.value.isNotEmpty) {
                                    ToastWidget.show(
                                      context: context,
                                      message: _controller.errorMessage.value,
                                      style: TextStyles.body4.copyWith(
                                        color: AppColors.lightGrey,
                                      ),
                                    );
                                  }
                                });
                              },
                              width: 325,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
