import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
class Customer with _$Customer {
  const factory Customer({
    required int id,
    @JsonKey(name: 'full_name') required String fullName,
    String? nric,
    DateTime? dob,
    String? gender,
    String? email,
    @JsonKey(name: 'mobile_no') String? mobileNo,
    @JsonKey(name: 'is_pending') required bool isPending,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  static List<Customer> fromJsonList(dynamic data) {
    return List<Customer>.from(
      data.map((el) => Customer.fromJson(el)),
    );
  }

  static String get table {
    return 'customers';
  }

  static Map<String?, String> get genders {
    return {null: "Gender", "F": "Female", "M": "Male"};
  }
}
