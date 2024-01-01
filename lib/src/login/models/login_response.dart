import 'package:drift/drift.dart' as drift;
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
    return PosLicensesTableCompanion(
      id: drift.Value(posLicense.id),
      name: drift.Value(posLicense.name),
      invoicePrefix: drift.Value(posLicense.invoicePrefix),
      licenseKey: drift.Value(posLicense.licenseKey),
      password: drift.Value(posLicense.password),
      isActive: drift.Value(posLicense.isActive),
      isActivated: drift.Value(posLicense.isActivated),
    );
  }

  CompanyTableCompanion getCompanyData() {
    return CompanyTableCompanion(
      id: drift.Value(company.id),
      name: drift.Value(company.name),
      address: drift.Value(company.address),
      postalCode: drift.Value(company.postalCode),
      email: drift.Value(company.email),
      telephone: drift.Value(company.telephone),
      fax: drift.Value(company.fax),
      website: drift.Value(company.website),
      coRegistrationNo: drift.Value(company.coRegistrationNo),
    );
  }

  ReceiptSettingsTableCompanion getReceiptSettingData() {
    return ReceiptSettingsTableCompanion(
      id: drift.Value(receiptSetting.id),
      footerText: drift.Value(receiptSetting.footerText),
      outstandingSpecimenTitle: drift.Value(receiptSetting.footerText),
      outstandingSpecimenNoticeTitle: drift.Value(receiptSetting.outstandingSpecimenNoticeTitle),
      outstandingSpecimenNotice: drift.Value(receiptSetting.outstandingSpecimenNotice),
      utfTitle: drift.Value(receiptSetting.utfTitle),
      utfNotice: drift.Value(receiptSetting.utfNotice),
      stfTitle: drift.Value(receiptSetting.stfTitle),
      stfNotice: drift.Value(receiptSetting.stfNotice),
    );
  }

  List<PosExtrasTableCompanion> getPosExtrasData() {
    return posExtras
        .map(
          (extra) => PosExtrasTableCompanion(
            id: drift.Value(extra.id),
            name: drift.Value(extra.name),
            description: drift.Value(extra.description),
            type: drift.Value(extra.type),
            amount: drift.Value(extra.amount),
            amountType: drift.Value(extra.amountType),
            isActive: drift.Value(extra.isActive),
          ),
        )
        .toList();
  }

  List<PaymentMethodsTableCompanion> getPaymentMethodsData() {
    return paymentMethods
        .map(
          (method) => PaymentMethodsTableCompanion(
            id: drift.Value(method.id),
            name: drift.Value(method.name),
            description: drift.Value(method.description),
          ),
        )
        .toList();
  }

  List<ProductCategoriesTableCompanion> getProductCategoriesData() {
    return productCategories
        .map(
          (category) => ProductCategoriesTableCompanion(
            id: drift.Value(category.id),
            name: drift.Value(category.name),
            description: drift.Value(category.description),
            colorCode: drift.Value(category.colorCode),
          ),
        )
        .toList();
  }

  List<ProductsTableCompanion> getProductsData() {
    return products
        .map(
          (product) => ProductsTableCompanion(
            id: drift.Value(product.id),
            name: drift.Value(product.name),
            sku: drift.Value(product.sku),
            price: drift.Value(product.price),
            description: drift.Value(product.description),
            colorCode: drift.Value(product.colorCode),
            categoryId: drift.Value(product.categoryId),
          ),
        )
        .toList();
  }
}
