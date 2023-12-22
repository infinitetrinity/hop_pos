// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginResponse {
  String get accessToken => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  PosLicense get posLicense => throw _privateConstructorUsedError;
  Company get company => throw _privateConstructorUsedError;
  ReceiptSetting get receiptSetting => throw _privateConstructorUsedError;
  List<PosExtra> get posExtras => throw _privateConstructorUsedError;
  List<PaymentMethod> get paymentMethods => throw _privateConstructorUsedError;
  List<ProductCategory> get productCategories =>
      throw _privateConstructorUsedError;
  List<Product> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call(
      {String accessToken,
      User user,
      PosLicense posLicense,
      Company company,
      ReceiptSetting receiptSetting,
      List<PosExtra> posExtras,
      List<PaymentMethod> paymentMethods,
      List<ProductCategory> productCategories,
      List<Product> products});

  $UserCopyWith<$Res> get user;
  $PosLicenseCopyWith<$Res> get posLicense;
  $CompanyCopyWith<$Res> get company;
  $ReceiptSettingCopyWith<$Res> get receiptSetting;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? user = null,
    Object? posLicense = null,
    Object? company = null,
    Object? receiptSetting = null,
    Object? posExtras = null,
    Object? paymentMethods = null,
    Object? productCategories = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      posLicense: null == posLicense
          ? _value.posLicense
          : posLicense // ignore: cast_nullable_to_non_nullable
              as PosLicense,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company,
      receiptSetting: null == receiptSetting
          ? _value.receiptSetting
          : receiptSetting // ignore: cast_nullable_to_non_nullable
              as ReceiptSetting,
      posExtras: null == posExtras
          ? _value.posExtras
          : posExtras // ignore: cast_nullable_to_non_nullable
              as List<PosExtra>,
      paymentMethods: null == paymentMethods
          ? _value.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethod>,
      productCategories: null == productCategories
          ? _value.productCategories
          : productCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PosLicenseCopyWith<$Res> get posLicense {
    return $PosLicenseCopyWith<$Res>(_value.posLicense, (value) {
      return _then(_value.copyWith(posLicense: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CompanyCopyWith<$Res> get company {
    return $CompanyCopyWith<$Res>(_value.company, (value) {
      return _then(_value.copyWith(company: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReceiptSettingCopyWith<$Res> get receiptSetting {
    return $ReceiptSettingCopyWith<$Res>(_value.receiptSetting, (value) {
      return _then(_value.copyWith(receiptSetting: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accessToken,
      User user,
      PosLicense posLicense,
      Company company,
      ReceiptSetting receiptSetting,
      List<PosExtra> posExtras,
      List<PaymentMethod> paymentMethods,
      List<ProductCategory> productCategories,
      List<Product> products});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $PosLicenseCopyWith<$Res> get posLicense;
  @override
  $CompanyCopyWith<$Res> get company;
  @override
  $ReceiptSettingCopyWith<$Res> get receiptSetting;
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? user = null,
    Object? posLicense = null,
    Object? company = null,
    Object? receiptSetting = null,
    Object? posExtras = null,
    Object? paymentMethods = null,
    Object? productCategories = null,
    Object? products = null,
  }) {
    return _then(_$LoginResponseImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      posLicense: null == posLicense
          ? _value.posLicense
          : posLicense // ignore: cast_nullable_to_non_nullable
              as PosLicense,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company,
      receiptSetting: null == receiptSetting
          ? _value.receiptSetting
          : receiptSetting // ignore: cast_nullable_to_non_nullable
              as ReceiptSetting,
      posExtras: null == posExtras
          ? _value._posExtras
          : posExtras // ignore: cast_nullable_to_non_nullable
              as List<PosExtra>,
      paymentMethods: null == paymentMethods
          ? _value._paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethod>,
      productCategories: null == productCategories
          ? _value._productCategories
          : productCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$LoginResponseImpl extends _LoginResponse {
  const _$LoginResponseImpl(
      {required this.accessToken,
      required this.user,
      required this.posLicense,
      required this.company,
      required this.receiptSetting,
      required final List<PosExtra> posExtras,
      required final List<PaymentMethod> paymentMethods,
      required final List<ProductCategory> productCategories,
      required final List<Product> products})
      : _posExtras = posExtras,
        _paymentMethods = paymentMethods,
        _productCategories = productCategories,
        _products = products,
        super._();

  @override
  final String accessToken;
  @override
  final User user;
  @override
  final PosLicense posLicense;
  @override
  final Company company;
  @override
  final ReceiptSetting receiptSetting;
  final List<PosExtra> _posExtras;
  @override
  List<PosExtra> get posExtras {
    if (_posExtras is EqualUnmodifiableListView) return _posExtras;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posExtras);
  }

  final List<PaymentMethod> _paymentMethods;
  @override
  List<PaymentMethod> get paymentMethods {
    if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentMethods);
  }

  final List<ProductCategory> _productCategories;
  @override
  List<ProductCategory> get productCategories {
    if (_productCategories is EqualUnmodifiableListView)
      return _productCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productCategories);
  }

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'LoginResponse(accessToken: $accessToken, user: $user, posLicense: $posLicense, company: $company, receiptSetting: $receiptSetting, posExtras: $posExtras, paymentMethods: $paymentMethods, productCategories: $productCategories, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.posLicense, posLicense) ||
                other.posLicense == posLicense) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.receiptSetting, receiptSetting) ||
                other.receiptSetting == receiptSetting) &&
            const DeepCollectionEquality()
                .equals(other._posExtras, _posExtras) &&
            const DeepCollectionEquality()
                .equals(other._paymentMethods, _paymentMethods) &&
            const DeepCollectionEquality()
                .equals(other._productCategories, _productCategories) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      accessToken,
      user,
      posLicense,
      company,
      receiptSetting,
      const DeepCollectionEquality().hash(_posExtras),
      const DeepCollectionEquality().hash(_paymentMethods),
      const DeepCollectionEquality().hash(_productCategories),
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);
}

abstract class _LoginResponse extends LoginResponse {
  const factory _LoginResponse(
      {required final String accessToken,
      required final User user,
      required final PosLicense posLicense,
      required final Company company,
      required final ReceiptSetting receiptSetting,
      required final List<PosExtra> posExtras,
      required final List<PaymentMethod> paymentMethods,
      required final List<ProductCategory> productCategories,
      required final List<Product> products}) = _$LoginResponseImpl;
  const _LoginResponse._() : super._();

  @override
  String get accessToken;
  @override
  User get user;
  @override
  PosLicense get posLicense;
  @override
  Company get company;
  @override
  ReceiptSetting get receiptSetting;
  @override
  List<PosExtra> get posExtras;
  @override
  List<PaymentMethod> get paymentMethods;
  @override
  List<ProductCategory> get productCategories;
  @override
  List<Product> get products;
  @override
  @JsonKey(ignore: true)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
