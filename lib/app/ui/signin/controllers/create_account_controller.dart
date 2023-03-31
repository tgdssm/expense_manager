import 'package:email_validator/email_validator.dart';
import 'package:expense_manager/app/domain/entities/account_entity.dart';
import 'package:expense_manager/app/domain/usecases/create_account.dart';
import 'package:expense_manager/core/core_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:result/result.dart';

import '../../../../design_system/design_system_export.dart';
import '../../../domain/usecases/verify_email.dart';

abstract class CreateAccountController {
  abstract GlobalKey<FormState> formKey;
  abstract TextEditingController nameController;
  abstract TextEditingController emailController;
  abstract TextEditingController passwdController;
  abstract TextEditingController confirmPasswdController;
  abstract bool emailExists;
  abstract ValueNotifier<String> errorMessage;
  abstract ValueNotifier<bool> loadingButton;
  AccountEntity get account;

  Future<void> callFunctionsToCreateAccount();
  Future<void> createAccount();
  Future<void> fEmailExists();
  void resetControllers();
  bool validateIfNameIsEmpty();
  bool validateNameFormat();
  bool validateNameLength();
  bool validateEmailFormat();
  bool validateIfEmailIsEmpty();
  bool validateConfirmPasswd();
  bool validateIfPasswdIsEmpty();
  bool validateIfConfirmPasswdIsEmpty();
}

class CreateAccountControllerImpl implements CreateAccountController {
  final ICreateAccountUseCase createAccountUseCase;
  final IVerifyEmailUseCase verifyEmailUseCase;

  CreateAccountControllerImpl(
    this.createAccountUseCase,
    this.verifyEmailUseCase,
  );

  @override
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  TextEditingController confirmPasswdController = TextEditingController();

  @override
  TextEditingController emailController = TextEditingController();

  @override
  TextEditingController nameController = TextEditingController();

  @override
  TextEditingController passwdController = TextEditingController();

  @override
  bool emailExists = false;

  @override
  ValueNotifier<String> errorMessage = ValueNotifier("");

  @override
  ValueNotifier<bool> loadingButton = ValueNotifier(false);

  @override
  AccountEntity get account => AccountEntity(
        nameController.text,
        emailController.text.trim(),
        passwdController.text,
        confirmPasswdController.text,
      );

  @override
  Future<void> callFunctionsToCreateAccount() async {
    if (formKey.currentState!.validate()) {
      loadingButton.value = true;
      emailExists = false;
      await fEmailExists();
      if (!emailExists) {
        createAccount();
      } else {
        errorMessage.value = Strings.emailIsAlreadyBeingUsed.i18n();
      }
      loadingButton.value = false;
    }
  }

  @override
  Future<void> createAccount() async {
    try {
      final result = await createAccountUseCase(account: account);
      if (result.isSuccess) {
        Modular.to.pushReplacementNamed(
          Routes.income.name,
          arguments: result.successData,
        );
        resetControllers();
      } else {
        errorMessage.value = result.errorData.message;
      }
    } on BaseError catch (e) {
      errorMessage.value = e.message;
    }
  }

  @override
  Future<void> fEmailExists() async {
    try {
      final result = await verifyEmailUseCase(email: account.email);
      if (result.isSuccess) {
        errorMessage.value = "";
        emailExists = result.successData;
      } else {
        errorMessage.value = result.errorData.message;
      }
    } on BaseError catch (e) {
      errorMessage.value = e.message;
    }
  }

  @override
  void resetControllers() {
    nameController.clear();
    emailController.clear();
    passwdController.clear();
    confirmPasswdController.clear();
    errorMessage.value = '';
    loadingButton.value = false;
  }

  @override
  bool validateIfNameIsEmpty() => account.name.isEmpty;
  @override
  bool validateEmailFormat() => EmailValidator.validate(account.email);
  @override
  bool validateIfEmailIsEmpty() => account.email.isEmpty;
  @override
  bool validateConfirmPasswd() => !(account.passwd == account.confirmPasswd);
  @override
  bool validateIfPasswdIsEmpty() => account.passwd.isEmpty;
  @override
  bool validateIfConfirmPasswdIsEmpty() => account.confirmPasswd.isEmpty;
  @override
  bool validateNameFormat() =>
      account.name.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  @override
  bool validateNameLength() => account.name.length < 3;
}
