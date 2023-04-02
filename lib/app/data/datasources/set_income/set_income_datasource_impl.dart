import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/app/data/datasources/datasources.dart';
import 'package:result/result.dart';

class SetIncomeDatasourceImpl implements ISetIncomeDatasource {
  final FirebaseFirestore firestore;
  const SetIncomeDatasourceImpl(this.firestore);
  @override
  Future<void> call(
    String userId,
    double income,
  ) async {
    try {
      await firestore
          .collection('Users')
          .doc(userId)
          .update({"income": income});
    } on FirebaseException catch (e) {
      throw BaseError(message: e.message!);
    } catch (e) {
      throw BaseError(message: e.toString());
    }
  }
}
