import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/customers/models/customer.dart';

part 'customer_form.freezed.dart';
part 'customer_form.g.dart';

@freezed
class CustomerForm with _$CustomerForm {
  const CustomerForm._();

  const factory CustomerForm({
    int? id,
    @JsonKey(name: 'full_name') String? fullName,
    String? nric,
    DateTime? dob,
    String? gender,
    String? email,
    @JsonKey(name: 'mobile_no') String? mobileNo,
    @JsonKey(name: 'send_account_invitation') @Default(true) bool sendAccountInvitation,
    @JsonKey(name: 'is_new') @Default(false) bool isNew,
  }) = _CustomerForm;

  factory CustomerForm.fromJson(Map<String, dynamic> json) => _$CustomerFormFromJson(json);

  static CustomerForm fromModel(Customer customer) {
    return CustomerForm.fromJson(customer.toJson());
  }

  String? validateFullName() {
    if (fullName.isNullOrEmpty) {
      return "Full name is required";
    }

    return fullName!.length < 3 ? "Full name must be at least 3 characters long." : null;
  }

  String? validateNric({
    int? minLength,
    String label = "NRIC/FIN/Passport No.",
  }) {
    if (nric.isNullOrEmpty) {
      return "$label is required";
    }

    if (!nric!.isAlphaNumeric) {
      return "$label must only contain alphanumeric characters";
    }

    if (minLength != null && nric!.length < minLength) {
      return "$label must be at least $minLength characters long";
    }

    return null;
  }

  String? validateMobileNo() {
    if (mobileNo.isNullOrEmpty) {
      return null;
    }

    if (!mobileNo!.isNumeric) {
      return "Mobile No. must be numeric";
    }

    if (mobileNo!.length != 8) {
      return "Mobile No. has to be an 8 digits number";
    }

    if (!mobileNo!.startsWith('8') && !mobileNo!.startsWith('9')) {
      return "Mobile No. has to start with 8 or 9";
    }

    return null;
  }

  String? validateEmail() {
    if (email.isNullOrEmpty) {
      return null;
    }

    if (!email!.isEmail) {
      return "Email must be a valid email";
    }

    return null;
  }

  String? validateDob() {
    if (dob == null) {
      return "Date of birth is required";
    }
    return null;
  }
}
