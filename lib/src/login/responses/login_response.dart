import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/common/models/api_response.dart';
import 'package:hop_pos/src/company/models/company.dart';
import 'package:hop_pos/src/pos_extras/models/pos_extra.dart';
import 'package:hop_pos/src/pos_licenses/models/pos_license.dart';
import 'package:hop_pos/src/receipt_settings/models/receipt_setting.dart';
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

  Company get company {
    return Company.fromJson(data['company']);
  }

  CompanyTableCompanion get companyData {
    return CompanyTableCompanion(
      id: Value(company.id),
      name: Value(company.name),
      address: Value(company.address),
      postalCode: Value(company.postalCode),
      email: Value(company.email),
      telephone: Value(company.telephone),
      fax: Value(company.fax),
      website: Value(company.website),
      coRegistrationNo: Value(company.coRegistrationNo),
    );
  }

  ReceiptSetting get receiptSetting {
    return ReceiptSetting.fromJson(data['receipt_settings']);
  }

  ReceiptSettingsTableCompanion get receiptSettingData {
    return ReceiptSettingsTableCompanion(
      id: Value(receiptSetting.id),
      footerText: Value(receiptSetting.footerText),
      outstandingSpecimenTitle: Value(receiptSetting.footerText),
      outstandingSpecimenNoticeTitle:
          Value(receiptSetting.outstandingSpecimenNoticeTitle),
      outstandingSpecimenNotice:
          Value(receiptSetting.outstandingSpecimenNotice),
      utfTitle: Value(receiptSetting.utfTitle),
      utfNotice: Value(receiptSetting.utfNotice),
      stfTitle: Value(receiptSetting.stfTitle),
      stfNotice: Value(receiptSetting.stfNotice),
    );
  }

  List<PosExtra> get posExtras {
    return List<PosExtra>.from(
        data['pos_extras'].map((el) => PosExtra.fromJson(el)));
  }

  List<PosExtrasTableCompanion> get posExtrasData {
    return posExtras
        .map(
          (extra) => PosExtrasTableCompanion(
            id: Value(extra.id),
            name: Value(extra.name),
            description: Value(extra.description),
            type: Value(extra.type),
            amount: Value(extra.amount),
            amountType: Value(extra.amountType),
            isActive: Value(extra.isActive),
          ),
        )
        .toList();
  }
}
