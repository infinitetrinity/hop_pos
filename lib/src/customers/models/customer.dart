import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';
import 'package:intl/intl.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
class Customer with _$Customer {
  const factory Customer({
    int? id,
    @JsonKey(name: 'full_name') required String fullName,
    String? nric,
    DateTime? dob,
    String? gender,
    String? email,
    @JsonKey(name: 'mobile_no') String? mobileNo,
    @JsonKey(name: 'is_pending') @Default(false) bool isPending,
    @JsonKey(name: 'send_account_invitation') @Default(false) bool sendAccountInvitation,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'is_new') @Default(false) bool isNew,
    @JsonKey(name: 'is_walk_in') @Default(false) bool isWalkIn,
  }) = _Customer;

  const Customer._();

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  static List<Customer> fromJsonList(dynamic data) {
    return List<Customer>.from(
      data.map((el) => Customer.fromJson(el)),
    );
  }

  dynamic toData() {
    return isNew
        ? NewCustomersTableCompanion(
            id: drift.Value.ofNullable(id),
            fullName: drift.Value(fullName),
            nric: drift.Value.ofNullable(nric),
            dob: drift.Value(dob),
            gender: drift.Value(gender),
            email: drift.Value(email),
            mobileNo: drift.Value(mobileNo),
            sendAccountInvitation: drift.Value(sendAccountInvitation),
            createdAt: drift.Value(createdAt ?? DateTime.now()),
          )
        : CustomersTableCompanion(
            id: drift.Value.ofNullable(id),
            fullName: drift.Value(fullName),
            nric: drift.Value(nric),
            dob: drift.Value(dob),
            gender: drift.Value(gender),
            email: drift.Value(email),
            mobileNo: drift.Value(mobileNo),
            isPending: drift.Value(isPending),
          );
  }

  ToSyncDataTableCompanion toSyncData(ToSyncActions action) {
    return ToSyncDataTableCompanion(
      model: const drift.Value(ToSyncModels.customers),
      modelId: drift.Value(id!),
      action: drift.Value(action),
      createdAt: drift.Value(DateTime.now()),
      value: drift.Value(toJson()),
    );
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
