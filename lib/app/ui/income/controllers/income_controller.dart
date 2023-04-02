import 'package:expense_manager/app/domain/usecases/usecases.dart';
import 'package:flutter/cupertino.dart';
import 'package:result/result.dart';

import '../../../../core/core_export.dart';

abstract class IncomeController {
  abstract ValueNotifier<String> errorMessage;
  abstract ValueNotifier<bool> loading;
  Future<void> setIncome(double income);
}

class IncomeControllerImpl implements IncomeController {
  final ISetIncomeUseCase setIncomeUseCase;
  final UserManager userManager;

  IncomeControllerImpl(
    this.setIncomeUseCase,
    this.userManager,
  );

  @override
  ValueNotifier<bool> loading = ValueNotifier<bool>(false);

  @override
  ValueNotifier<String> errorMessage = ValueNotifier<String>('');

  @override
  Future<void> setIncome(double income) async {
    loading.value = true;
    try {
      await setIncomeUseCase(userManager.user.id, income);
      userManager.userIncome(income);
    } on BaseError catch (e) {
      errorMessage.value = e.message;
    }
    loading.value = true;
  }
}
