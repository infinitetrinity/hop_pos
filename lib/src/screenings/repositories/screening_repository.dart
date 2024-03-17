import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/orders/models/order_with_customer_and_payment.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screenings/daos/screening_dao.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/models/screening_with_sales_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screening_repository.g.dart';

@riverpod
ScreeningRepository screeningRepo(ScreeningRepoRef ref) {
  return ScreeningRepository(
    screeningDao: ref.watch(appDbProvider.select((prov) => prov.screeningDao)),
  );
}

class ScreeningRepository {
  final ScreeningDao screeningDao;

  ScreeningRepository({
    required this.screeningDao,
  });

  Future<List<Screening>> getUpcoming() {
    return screeningDao.getUpcoming();
  }

  Future<List<Screening>> search(String search) {
    return screeningDao.search(search);
  }

  Future<List<Screening>> getWithOrdersWithinDays(int days, {int page = 1, int size = 20, String? search}) async {
    return await screeningDao.getWithOrdersWithinDays(days, page: page, size: size, search: search);
  }

  Future<List<ScreeningWithSalesData>> getScreeningsSalesData(List<Screening> screenings) async {
    return await screeningDao.getScreeningsSalesData(screenings);
  }

  Future<List<OrderWithCustomerAndPayment>> getScreeningOrders(Screening screening,
      {int page = 1, int size = 20, String? search}) async {
    return await screeningDao.getScreeningOrders(screening, page: page, size: size, search: search);
  }

  Future<int> getScreeningOrdersTotalCount(Screening screening, {String? search}) async {
    return await screeningDao.getScreeningOrdersTotalCount(screening, search: search);
  }

  Future<Screening?> getById(int id) async {
    return await screeningDao.getById(id);
  }

  Future<List<CustomerWithRegistration>> searchScreeningCustomers(Screening screening, String search) async {
    return await screeningDao.searchScreeningCustomers(screening, search);
  }

  Future<int?> getCustomersCount(Screening screening) async {
    return await screeningDao.getCustomersCount(screening);
  }

  Future<ScreeningRegistration?> findScreeningCustomerRegistration(Screening screening, Customer customer) async {
    return await screeningDao.findScreeningCustomerRegistration(screening, customer);
  }
}
