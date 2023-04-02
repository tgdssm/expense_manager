abstract class ISetIncomeDatasource {
  Future<void> call(
    String userId,
    double income,
  );
}
