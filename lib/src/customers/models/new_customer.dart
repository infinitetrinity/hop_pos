import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_customer.freezed.dart';
part 'new_customer.g.dart';

@freezed
class NewCustomer with _$NewCustomer {
  const factory NewCustomer({
    required int id,
    @JsonKey(name: 'full_name') required String fullName,
    String? nric,
    DateTime? dob,
    String? gender,
    String? email,
    @JsonKey(name: 'mobile_no') String? mobileNo,
    @JsonKey(name: 'send_account_invitation') required bool sendAccountInvitation,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _NewCustomer;

  factory NewCustomer.fromJson(Map<String, dynamic> json) => _$NewCustomerFromJson(json);
}
