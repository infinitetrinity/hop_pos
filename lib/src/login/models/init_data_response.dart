import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';

part 'init_data_response.freezed.dart';

@freezed
class InitDataResponse with _$InitDataResponse {
  const InitDataResponse._();

  const factory InitDataResponse({
    required bool hasNextPage,
    required List<Customer> customers,
  }) = _InitDataResponse;

  factory InitDataResponse.fromJson(Map<String, dynamic> json) {
    return InitDataResponse(
      hasNextPage: _checkHasNextPage(json),
      customers: Customer.fromJsonList(json['customers']['data']),
    );
  }

  static bool _checkHasNextPage(Map<String, dynamic> data) {
    return data.values.any(
      (el) => el['meta']['has_more_pages'] ?? false,
    );
  }

  List<CustomersTableCompanion> getCustomersData() {
    return customers
        .map(
          (customer) => CustomersTableCompanion(
            id: drift.Value(customer.id),
            fullName: drift.Value(customer.fullName),
            nric: drift.Value(customer.nric),
            dob: drift.Value(customer.dob),
            gender: drift.Value(customer.gender),
            email: drift.Value(customer.email),
            mobileNo: drift.Value(customer.mobileNo),
            isPending: drift.Value(customer.isPending),
          ),
        )
        .toList();
  }
}
