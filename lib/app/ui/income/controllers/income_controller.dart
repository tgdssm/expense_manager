import 'package:expense_manager/app/domain/usecases/usecases.dart';
import 'package:expense_manager/design_system/design_system_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:localization/localization.dart';
import 'package:result/result.dart';

import '../../../../core/core_export.dart';

abstract class IncomeController {
  abstract ValueNotifier<String> errorMessage;
  abstract ValueNotifier<bool> loadingButton;
  abstract double income;
  Future<void> setIncome();
}

class IncomeControllerImpl implements IncomeController {
  final ISetIncomeUseCase setIncomeUseCase;
  final UserManager userManager;

  IncomeControllerImpl(
    this.setIncomeUseCase,
    this.userManager,
  );

  @override
  ValueNotifier<bool> loadingButton = ValueNotifier<bool>(false);

  @override
  ValueNotifier<String> errorMessage = ValueNotifier<String>('');

  @override
  double income = 0.0;

  @override
  Future<void> setIncome() async {
    loadingButton.value = true;
    try {
      if(income > 0.0) {
        await setIncomeUseCase(userManager.user.id, income);
        userManager.userIncome(income);
      } else {
        errorMessage.value = Strings.incomeGreaterThanZero.i18n();
      }
    } on BaseError catch (e) {
      errorMessage.value = e.message;
    }
    loadingButton.value = false;
  }
}
