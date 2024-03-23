import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/payment_methods/daos/payment_method_dao.dart';
import 'package:hop_pos/src/payment_methods/models/payment_method.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_method_repository.g.dart';

@riverpod
PaymentMethodRepository paymentMethodRepo(PaymentMethodRepoRef ref) {
  return PaymentMethodRepository(
    paymentMethodDao: ref.watch(appDbProvider.select((prov) => prov.paymentMethodDao)),
  );
}

class PaymentMethodRepository {
  final PaymentMethodDao paymentMethodDao;

  PaymentMethodRepository({
    required this.paymentMethodDao,
  });

  Future<PaymentMethod> insert(PaymentMethodsTableCompanion method) async {
    return await paymentMethodDao.insertMethod(method);
  }

  Future<List<PaymentMethod>> insertMany(List<PaymentMethodsTableCompanion> methods) async {
    return await paymentMethodDao.insertMethods(methods);
  }

  Future<PaymentMethod> getById(int id) async {
    return await paymentMethodDao.getById(id);
  }

  Future<List<PaymentMethod>> getAll() async {
    return await paymentMethodDao.getAll();
  }

  Future<bool> deleteById(int id) async {
    return paymentMethodDao.deleteById(id);
  }
}
