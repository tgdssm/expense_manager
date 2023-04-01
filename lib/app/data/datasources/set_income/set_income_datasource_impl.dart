import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/app/data/datasources/datasources.dart';

class SetIncomeDatasourceImpl implements ISetIncomeDatasource {
  final FirebaseFirestore firestore;
  const SetIncomeDatasourceImpl(this.firestore);
  @override
  Future<void> call(String userId) {
    throw UnimplementedError();
  }

}