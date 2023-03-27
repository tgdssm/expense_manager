import 'package:expense_manager/app/data/models/account_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final model = AccountModel(
    'Thalisson',
    'thalisson@gmail.com',
    '12345',
    '12345',
  );
  group('[DATA] - AccountModel', () {
    test('Attr', () {
      expect(model.name, 'Thalisson');
      expect(model.email, 'thalisson@gmail.com');
      expect(model.passwd, '12345');
      expect(model.confirmPasswd, '12345');
    });
  });
}
