import 'package:expense_manager/app/domain/entities/account_entity.dart';

class AccountModel extends AccountEntity {
  AccountModel(
    super.name,
    super.email,
    super.passwd,
    super.confirmPasswd,
  );
}
