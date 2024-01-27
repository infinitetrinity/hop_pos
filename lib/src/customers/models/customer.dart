import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

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

  const Customer._();

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

  static Map<String?, String> get identityTypes {
    return {'nric': "NRIC/FIN", "others": "Others"};
  }

  String? get displayDob {
    return dob == null ? null : DateFormat('dd MMM yyyy').format(dob!);
  }

  String? get displayGender {
    return gender == null ? null : genders[gender!.toUpperCase()];
  }

  String? get nricIndex {
    int start = (nric?.length ?? 0) >= 5 ? nric!.length - 5 : 0;
    return nric?.substring(start, nric!.length);
  }
}
