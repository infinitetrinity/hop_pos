import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/common/models/api_response.dart';
import 'package:hop_pos/src/pos_licenses/models/pos_license.dart';
import 'package:hop_pos/src/users/models/user.dart';

class LoginResponse extends ApiResponse {
  final ApiResponse res;

  LoginResponse(this.res) : super(res.response);

  String get token {
    return data['access_token'];
  }

  User get user {
    return User.fromJson(data['user']).copyWith(accessToken: token);
  }

  UsersTableCompanion get userData {
    return UsersTableCompanion(
      id: Value(user.id),
      fullName: Value(user.fullName),
      accessToken: Value.ofNullable(user.accessToken),
    );
  }

  PosLicense get license {
    return PosLicense.fromJson(data['pos_license']);
  }

  PosLicensesTableCompanion get licenseData {
    return PosLicensesTableCompanion(
      id: Value(license.id),
      name: Value(license.name),
      invoicePrefix: Value(license.invoicePrefix),
      licenseKey: Value(license.licenseKey),
      password: Value(license.password),
      isActive: Value(license.isActive),
      isActivated: Value(license.isActivated),
    );
  }
}
