import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/company/models/company.dart';
import 'package:hop_pos/src/payment_methods/models/payment_method.dart';
import 'package:hop_pos/src/pos_extras/models/pos_extra.dart';
import 'package:hop_pos/src/pos_licenses/models/pos_license.dart';
import 'package:hop_pos/src/product_categories/models/product_category.dart';
import 'package:hop_pos/src/products/models/product.dart';
import 'package:hop_pos/src/receipt_settings/models/receipt_setting.dart';
import 'package:hop_pos/src/users/models/user.dart';

part 'login_response.freezed.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const LoginResponse._();

  const factory LoginResponse({
    required String accessToken,
    required User user,
    required PosLicense posLicense,
    required Company company,
    required ReceiptSetting receiptSetting,
    required List<PosExtra> posExtras,
    required List<PaymentMethod> paymentMethods,
    required List<ProductCategory> productCategories,
    required List<Product> products,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['access_token'],
      user: User.fromJson(json['user']),
      posLicense: PosLicense.fromJson(json['pos_license']),
      company: Company.fromJson(json['company']),
      receiptSetting: ReceiptSetting.fromJson(json['receipt_settings']),
      posExtras: PosExtra.fromJsonList(json['pos_extras']),
      paymentMethods: PaymentMethod.fromJsonList(json['payment_methods']),
      productCategories: ProductCategory.fromJsonList(json['product_categories']),
      products: Product.fromJsonList(json['products']),
    );
  }

  UsersTableCompanion getUserData() {
    return user.toData();
  }

  PosLicensesTableCompanion getPosLicenseData() {
    return posLicense.toData();
  }

  CompanyTableCompanion getCompanyData() {
    return company.toData();
  }

  ReceiptSettingsTableCompanion getReceiptSettingData() {
    return receiptSetting.toData();
  }

  List<PosExtrasTableCompanion> getPosExtrasData() {
    return posExtras.map((extra) => extra.toData()).toList();
  }

  List<PaymentMethodsTableCompanion> getPaymentMethodsData() {
    return paymentMethods.map((method) => method.toData()).toList();
  }

  List<ProductCategoriesTableCompanion> getProductCategoriesData() {
    return productCategories.map((category) => category.toData()).toList();
  }

  List<ProductsTableCompanion> getProductsData() {
    return products.map((product) => product.toData()).toList();
  }
}
