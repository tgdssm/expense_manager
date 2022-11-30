import 'package:email_validator/email_validator.dart';

class CreateAccountCredential {
  final String name;
  final String email;
  final String passwd;
  final String confirmPasswd;

  CreateAccountCredential({required this.name, required this.email, required this.passwd, required this.confirmPasswd});

  bool validateEmailFormat() => EmailValidator.validate(email);

  bool validateIfEmailIsEmpty() => email.isEmpty;

  bool validateConfirmPasswd() => passwd == confirmPasswd;

  bool validateIfPasswdIsEmpty() => passwd.isEmpty;

  bool validateIfConfirmPasswdIsEmpty() => confirmPasswd.isEmpty;

}
