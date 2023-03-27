import 'package:expense_manager/app/domain/entities/account_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final entity = AccountEntity(
    'Thalisson',
    'thalisson@gmail.com',
    '12345',
    '12345',
  );
  group('[DOMAIN] - AccountEntity', () {
    test('Attr', () {
      expect(entity.name, 'Thalisson');
      expect(entity.email, 'thalisson@gmail.com');
      expect(entity.passwd, '12345');
      expect(entity.confirmPasswd, '12345');
    });
  });
}
