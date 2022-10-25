import 'package:expense_manager/app/core/failure.dart';

class CreateAccountError implements Failure {
  @override
  String? message;
  CreateAccountError({this.message});
}

class SignInError implements Failure {
  @override
  String? message;
  SignInError({this.message});
}
