import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/payment_methods/models/payment_method.dart';
import 'package:hop_pos/src/payment_methods/models/payment_methods_table.dart';

part 'payment_method_dao.g.dart';

@DriftAccessor(tables: [PaymentMethodsTable])
class PaymentMethodDao extends DatabaseAccessor<AppDb>
    with _$PaymentMethodDaoMixin {
  PaymentMethodDao(AppDb db) : super(db);

  Future<PaymentMethod> insertMethod(
      PaymentMethodsTableCompanion method) async {
    return await into(paymentMethodsTable).insertReturning(method);
  }

  Future<List<PaymentMethod>> insertMethods(
      List<PaymentMethodsTableCompanion> methods) async {
    return await transaction(() async {
      List<Future<PaymentMethod>> insertFutures = [];

      for (PaymentMethodsTableCompanion method in methods) {
        insertFutures.add(insertMethod(method));
      }

      List<PaymentMethod> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<bool> updateMethod(
      PaymentMethodsTableCompanion method, Expression<bool> where) async {
    final count =
        await (update(paymentMethodsTable)..where((_) => where)).write(method);
    return count > 0;
  }
}