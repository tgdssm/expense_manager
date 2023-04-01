import 'package:expense_manager/app/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final entity = UserEntity(
    '@id',
    'Thalisson',
    'thalisson@gmail.com',
    0.0,
  );
  group('[DOMAIN] - AccountEntity', () {
    test('Attr', () {
      expect(entity.id, '@id');
      expect(entity.name, 'Thalisson');
      expect(entity.email, 'thalisson@gmail.com');
    });
  });
}
