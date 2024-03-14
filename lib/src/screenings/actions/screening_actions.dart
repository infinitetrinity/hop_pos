import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/orders/models/order_with_customer_and_payment.dart';
import 'package:hop_pos/src/screening_registrations/repositories/new_screening_registration_repository.dart';
import 'package:hop_pos/src/screening_registrations/repositories/screening_registration_repository.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot_with_venue.dart';
import 'package:hop_pos/src/screening_timeslots/repositories/screening_timeslot_repository.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/models/screening_with_sales_data.dart';
import 'package:hop_pos/src/screenings/repositories/screening_repository.dart';
import 'package:quiver/iterables.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screening_actions.g.dart';

@riverpod
ScreeningActions screeningActions(ScreeningActionsRef ref) {
  return ScreeningActions(
    screeningRepo: ref.watch(screeningRepoProvider),
    screeningTimeslotRepoProvider: ref.watch(screeningTimeslotRepoProvider),
    screeningRegistrationRepo: ref.watch(screeningRegistrationRepoProvider),
    newScreeningRegistrationRepo: ref.watch(newScreeningRegistrationRepoProvider),
  );
}

class ScreeningActions {
  final ScreeningRepository screeningRepo;
  final ScreeningTimeslotRepository screeningTimeslotRepoProvider;
  final ScreeningRegistrationRepository screeningRegistrationRepo;
  final NewScreeningRegistrationRepository newScreeningRegistrationRepo;

  ScreeningActions({
    required this.screeningRepo,
    required this.screeningTimeslotRepoProvider,
    required this.screeningRegistrationRepo,
    required this.newScreeningRegistrationRepo,
  });

  Future<dynamic> getUpcomingScreenings({int partitionSize = 0}) async {
    final screenings = await screeningRepo.getUpcoming();
    return partitionSize > 0 ? partition<Screening>(screenings, partitionSize).toList() : screenings;
  }

  List<List<Screening>>? addToScreenings(List<List<Screening>> screenings, Screening screening) {
    bool screeningExists = screenings.any((child) => child.contains(screening));

    if (screeningExists) {
      return null;
    }

    screenings.insert(0, [screening]);
    return partition<Screening>(screenings.expand((child) => child), 20).toList();
  }

  Future<List<ScreeningTimeslotWithVenue>> getTimeslotsWithVenue(Screening screening,
      {int page = 1, int size = 20}) async {
    return await screeningTimeslotRepoProvider.getScreeningTimeslotsWithVenue(screening, page: page, size: size);
  }

  Future<int> getTimeslotsCount(Screening screening) async {
    return await screeningTimeslotRepoProvider.getScreeningTimeslotsCount(screening);
  }

  Future<List<Screening>> search(String search) async {
    return await screeningRepo.search(search);
  }

  FutureOr<List<CustomerWithRegistration>> searchScreeningCustomers(Screening screening, String search) async {
    final registrations = await screeningRegistrationRepo.searchScreeningCustomers(screening, search);
    final newRegistrations = await newScreeningRegistrationRepo.searchScreeningCustomers(screening, search);

    final sorted = [...registrations, ...newRegistrations]..sort((a, b) {
        final intA = int.tryParse(a.registration.index ?? '');
        final intB = int.tryParse(b.registration.index ?? '');

        if (intA == null && intB == null) {
          return (a.registration.index ?? '').compareTo(b.registration.index ?? '');
        }
        if (intA == null) {
          return 1;
        }
        if (intB == null) {
          return -1;
        }

        return intA.compareTo(intB);
      });

    return sorted.take(50).toList();
  }

  Future<ScreeningTimeslot> getScreeningNearestTimeslot(Screening screening) async {
    final timeslots = await screeningTimeslotRepoProvider.getScreeningTimeslots(screening);
    final passed = timeslots.where((timeslot) => timeslot.dateAndTime.isBefore(DateTime.now()));

    return passed.lastOrNull ?? timeslots.first;
  }

  Future<int> getHaveSalesWithinDaysCount({int days = 30, String? search}) async {
    final screenings = await screeningRepo.getWithOrdersWithinDays(days, page: 0, search: search);
    return screenings.length;
  }

  Future<List<ScreeningWithSalesData>> getHaveSalesWithinDays(
      {int days = 30, int page = 1, int size = 20, String? search}) async {
    final screenings = await screeningRepo.getWithOrdersWithinDays(days, page: page, size: size, search: search);
    return await screeningRepo.getScreeningsSalesData(screenings);
  }

  Future<List<OrderWithCustomerAndPayment>> getScreeningOrders(Screening screening,
      {int page = 1, int size = 20, String? search}) async {
    return await screeningRepo.getScreeningOrders(screening, page: page, size: size, search: search);
  }

  Future<int> getScreeningOrdersTotalCount(Screening screening, {String? search}) async {
    return await screeningRepo.getScreeningOrdersTotalCount(screening, search: search);
  }

  Future<Screening?> getScreeningById(int id) async {
    return await screeningRepo.getById(id);
  }
}
