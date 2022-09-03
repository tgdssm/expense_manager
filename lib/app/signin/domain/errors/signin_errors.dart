import 'package:expense_manager/app/core/failure.dart';

class CreateAccountError implements Failure {
  @override
  String? message;
  CreateAccountError({this.message});
}

class SigninError implements Failure {
  @override
  String? message;
  SigninError({this.message});
}
