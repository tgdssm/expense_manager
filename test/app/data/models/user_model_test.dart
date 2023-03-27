import 'package:expense_manager/app/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  final data = {
    'id': '@id',
    'name': 'Thalisson',
    'email': 'thalisson@gmail.com',
  };
  final model = UserModel.fromMap(data);
  group('[DATA] - UserModel', () {
    test('fromMap', () {
      expect(model.id, data['id']);
      expect(model.name, data['name']);
      expect(model.email, data['email']);
    });
    test('toMap', () {
      final toMap = model.toMap();
      expect(toMap, data);
      expect(toMap['id'], data['id']);
      expect(toMap['name'], data['name']);
      expect(toMap['email'], data['email']);
    });
  });
}