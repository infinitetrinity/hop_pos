// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_stf')
  bool? get isStf => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_utf')
  bool? get isUtf => throw _privateConstructorUsedError;
  @JsonKey(name: 'e_receipt')
  bool? get eReceipt => throw _privateConstructorUsedError;
  @JsonKey(name: 'sales_note')
  String? get salesNote => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_no')
  String? get invoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_prefix')
  String? get invoicePrefix => throw _privateConstructorUsedError;
  @DoubleFromStringConverter()
  double? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_type')
  DiscountType? get discountType => throw _privateConstructorUsedError;
  @DoubleFromStringConverter()
  double? get subtotal => throw _privateConstructorUsedError;
  @DoubleFromStringConverter()
  @JsonKey(name: 'extras_total')
  double? get extrasTotal => throw _privateConstructorUsedError;
  @DoubleFromStringConverter()
  @JsonKey(name: 'net_total')
  double? get netTotal => throw _privateConstructorUsedError;
  @DoubleFromStringConverter()
  double? get rounding => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_id')
  int? get licenseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'screening_id')
  int? get screeningId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_nric')
  String? get customerNric => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_new')
  bool get isNew => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'is_stf') bool? isStf,
      @JsonKey(name: 'is_utf') bool? isUtf,
      @JsonKey(name: 'e_receipt') bool? eReceipt,
      @JsonKey(name: 'sales_note') String? salesNote,
      @JsonKey(name: 'invoice_no') String? invoiceNo,
      @JsonKey(name: 'invoice_prefix') String? invoicePrefix,
      @DoubleFromStringConverter() double? discount,
      @JsonKey(name: 'discount_type') DiscountType? discountType,
      @DoubleFromStringConverter() double? subtotal,
      @DoubleFromStringConverter()
      @JsonKey(name: 'extras_total')
      double? extrasTotal,
      @DoubleFromStringConverter() @JsonKey(name: 'net_total') double? netTotal,
      @DoubleFromStringConverter() double? rounding,
      @JsonKey(name: 'license_id') int? licenseId,
      @JsonKey(name: 'screening_id') int? screeningId,
      @JsonKey(name: 'customer_id') int? customerId,
      @JsonKey(name: 'customer_nric') String? customerNric,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'is_new') bool isNew});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? isStf = freezed,
    Object? isUtf = freezed,
    Object? eReceipt = freezed,
    Object? salesNote = freezed,
    Object? invoiceNo = freezed,
    Object? invoicePrefix = freezed,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? subtotal = freezed,
    Object? extrasTotal = freezed,
    Object? netTotal = freezed,
    Object? rounding = freezed,
    Object? licenseId = freezed,
    Object? screeningId = freezed,
    Object? customerId = freezed,
    Object? customerNric = freezed,
    Object? createdAt = freezed,
    Object? isNew = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isStf: freezed == isStf
          ? _value.isStf
          : isStf // ignore: cast_nullable_to_non_nullable
              as bool?,
      isUtf: freezed == isUtf
          ? _value.isUtf
          : isUtf // ignore: cast_nullable_to_non_nullable
              as bool?,
      eReceipt: freezed == eReceipt
          ? _value.eReceipt
          : eReceipt // ignore: cast_nullable_to_non_nullable
              as bool?,
      salesNote: freezed == salesNote
          ? _value.salesNote
          : salesNote // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceNo: freezed == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      invoicePrefix: freezed == invoicePrefix
          ? _value.invoicePrefix
          : invoicePrefix // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as DiscountType?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      extrasTotal: freezed == extrasTotal
          ? _value.extrasTotal
          : extrasTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      netTotal: freezed == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      rounding: freezed == rounding
          ? _value.rounding
          : rounding // ignore: cast_nullable_to_non_nullable
              as double?,
      licenseId: freezed == licenseId
          ? _value.licenseId
          : licenseId // ignore: cast_nullable_to_non_nullable
              as int?,
      screeningId: freezed == screeningId
          ? _value.screeningId
          : screeningId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerNric: freezed == customerNric
          ? _value.customerNric
          : customerNric // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'is_stf') bool? isStf,
      @JsonKey(name: 'is_utf') bool? isUtf,
      @JsonKey(name: 'e_receipt') bool? eReceipt,
      @JsonKey(name: 'sales_note') String? salesNote,
      @JsonKey(name: 'invoice_no') String? invoiceNo,
      @JsonKey(name: 'invoice_prefix') String? invoicePrefix,
      @DoubleFromStringConverter() double? discount,
      @JsonKey(name: 'discount_type') DiscountType? discountType,
      @DoubleFromStringConverter() double? subtotal,
      @DoubleFromStringConverter()
      @JsonKey(name: 'extras_total')
      double? extrasTotal,
      @DoubleFromStringConverter() @JsonKey(name: 'net_total') double? netTotal,
      @DoubleFromStringConverter() double? rounding,
      @JsonKey(name: 'license_id') int? licenseId,
      @JsonKey(name: 'screening_id') int? screeningId,
      @JsonKey(name: 'customer_id') int? customerId,
      @JsonKey(name: 'customer_nric') String? customerNric,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'is_new') bool isNew});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? isStf = freezed,
    Object? isUtf = freezed,
    Object? eReceipt = freezed,
    Object? salesNote = freezed,
    Object? invoiceNo = freezed,
    Object? invoicePrefix = freezed,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? subtotal = freezed,
    Object? extrasTotal = freezed,
    Object? netTotal = freezed,
    Object? rounding = freezed,
    Object? licenseId = freezed,
    Object? screeningId = freezed,
    Object? customerId = freezed,
    Object? customerNric = freezed,
    Object? createdAt = freezed,
    Object? isNew = null,
  }) {
    return _then(_$OrderImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isStf: freezed == isStf
          ? _value.isStf
          : isStf // ignore: cast_nullable_to_non_nullable
              as bool?,
      isUtf: freezed == isUtf
          ? _value.isUtf
          : isUtf // ignore: cast_nullable_to_non_nullable
              as bool?,
      eReceipt: freezed == eReceipt
          ? _value.eReceipt
          : eReceipt // ignore: cast_nullable_to_non_nullable
              as bool?,
      salesNote: freezed == salesNote
          ? _value.salesNote
          : salesNote // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceNo: freezed == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      invoicePrefix: freezed == invoicePrefix
          ? _value.invoicePrefix
          : invoicePrefix // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as DiscountType?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      extrasTotal: freezed == extrasTotal
          ? _value.extrasTotal
          : extrasTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      netTotal: freezed == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      rounding: freezed == rounding
          ? _value.rounding
          : rounding // ignore: cast_nullable_to_non_nullable
              as double?,
      licenseId: freezed == licenseId
          ? _value.licenseId
          : licenseId // ignore: cast_nullable_to_non_nullable
              as int?,
      screeningId: freezed == screeningId
          ? _value.screeningId
          : screeningId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerNric: freezed == customerNric
          ? _value.customerNric
          : customerNric // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl extends _Order {
  const _$OrderImpl(
      {this.id,
      @JsonKey(name: 'is_stf') this.isStf = false,
      @JsonKey(name: 'is_utf') this.isUtf = false,
      @JsonKey(name: 'e_receipt') this.eReceipt,
      @JsonKey(name: 'sales_note') this.salesNote,
      @JsonKey(name: 'invoice_no') this.invoiceNo,
      @JsonKey(name: 'invoice_prefix') this.invoicePrefix,
      @DoubleFromStringConverter() this.discount,
      @JsonKey(name: 'discount_type') this.discountType,
      @DoubleFromStringConverter() this.subtotal,
      @DoubleFromStringConverter()
      @JsonKey(name: 'extras_total')
      this.extrasTotal,
      @DoubleFromStringConverter() @JsonKey(name: 'net_total') this.netTotal,
      @DoubleFromStringConverter() this.rounding,
      @JsonKey(name: 'license_id') this.licenseId,
      @JsonKey(name: 'screening_id') this.screeningId,
      @JsonKey(name: 'customer_id') this.customerId,
      @JsonKey(name: 'customer_nric') this.customerNric,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'is_new') this.isNew = false})
      : super._();

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'is_stf')
  final bool? isStf;
  @override
  @JsonKey(name: 'is_utf')
  final bool? isUtf;
  @override
  @JsonKey(name: 'e_receipt')
  final bool? eReceipt;
  @override
  @JsonKey(name: 'sales_note')
  final String? salesNote;
  @override
  @JsonKey(name: 'invoice_no')
  final String? invoiceNo;
  @override
  @JsonKey(name: 'invoice_prefix')
  final String? invoicePrefix;
  @override
  @DoubleFromStringConverter()
  final double? discount;
  @override
  @JsonKey(name: 'discount_type')
  final DiscountType? discountType;
  @override
  @DoubleFromStringConverter()
  final double? subtotal;
  @override
  @DoubleFromStringConverter()
  @JsonKey(name: 'extras_total')
  final double? extrasTotal;
  @override
  @DoubleFromStringConverter()
  @JsonKey(name: 'net_total')
  final double? netTotal;
  @override
  @DoubleFromStringConverter()
  final double? rounding;
  @override
  @JsonKey(name: 'license_id')
  final int? licenseId;
  @override
  @JsonKey(name: 'screening_id')
  final int? screeningId;
  @override
  @JsonKey(name: 'customer_id')
  final int? customerId;
  @override
  @JsonKey(name: 'customer_nric')
  final String? customerNric;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'is_new')
  final bool isNew;

  @override
  String toString() {
    return 'Order(id: $id, isStf: $isStf, isUtf: $isUtf, eReceipt: $eReceipt, salesNote: $salesNote, invoiceNo: $invoiceNo, invoicePrefix: $invoicePrefix, discount: $discount, discountType: $discountType, subtotal: $subtotal, extrasTotal: $extrasTotal, netTotal: $netTotal, rounding: $rounding, licenseId: $licenseId, screeningId: $screeningId, customerId: $customerId, customerNric: $customerNric, createdAt: $createdAt, isNew: $isNew)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isStf, isStf) || other.isStf == isStf) &&
            (identical(other.isUtf, isUtf) || other.isUtf == isUtf) &&
            (identical(other.eReceipt, eReceipt) ||
                other.eReceipt == eReceipt) &&
            (identical(other.salesNote, salesNote) ||
                other.salesNote == salesNote) &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo) &&
            (identical(other.invoicePrefix, invoicePrefix) ||
                other.invoicePrefix == invoicePrefix) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.extrasTotal, extrasTotal) ||
                other.extrasTotal == extrasTotal) &&
            (identical(other.netTotal, netTotal) ||
                other.netTotal == netTotal) &&
            (identical(other.rounding, rounding) ||
                other.rounding == rounding) &&
            (identical(other.licenseId, licenseId) ||
                other.licenseId == licenseId) &&
            (identical(other.screeningId, screeningId) ||
                other.screeningId == screeningId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerNric, customerNric) ||
                other.customerNric == customerNric) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isNew, isNew) || other.isNew == isNew));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        isStf,
        isUtf,
        eReceipt,
        salesNote,
        invoiceNo,
        invoicePrefix,
        discount,
        discountType,
        subtotal,
        extrasTotal,
        netTotal,
        rounding,
        licenseId,
        screeningId,
        customerId,
        customerNric,
        createdAt,
        isNew
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order extends Order {
  const factory _Order(
      {final int? id,
      @JsonKey(name: 'is_stf') final bool? isStf,
      @JsonKey(name: 'is_utf') final bool? isUtf,
      @JsonKey(name: 'e_receipt') final bool? eReceipt,
      @JsonKey(name: 'sales_note') final String? salesNote,
      @JsonKey(name: 'invoice_no') final String? invoiceNo,
      @JsonKey(name: 'invoice_prefix') final String? invoicePrefix,
      @DoubleFromStringConverter() final double? discount,
      @JsonKey(name: 'discount_type') final DiscountType? discountType,
      @DoubleFromStringConverter() final double? subtotal,
      @DoubleFromStringConverter()
      @JsonKey(name: 'extras_total')
      final double? extrasTotal,
      @DoubleFromStringConverter()
      @JsonKey(name: 'net_total')
      final double? netTotal,
      @DoubleFromStringConverter() final double? rounding,
      @JsonKey(name: 'license_id') final int? licenseId,
      @JsonKey(name: 'screening_id') final int? screeningId,
      @JsonKey(name: 'customer_id') final int? customerId,
      @JsonKey(name: 'customer_nric') final String? customerNric,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'is_new') final bool isNew}) = _$OrderImpl;
  const _Order._() : super._();

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'is_stf')
  bool? get isStf;
  @override
  @JsonKey(name: 'is_utf')
  bool? get isUtf;
  @override
  @JsonKey(name: 'e_receipt')
  bool? get eReceipt;
  @override
  @JsonKey(name: 'sales_note')
  String? get salesNote;
  @override
  @JsonKey(name: 'invoice_no')
  String? get invoiceNo;
  @override
  @JsonKey(name: 'invoice_prefix')
  String? get invoicePrefix;
  @override
  @DoubleFromStringConverter()
  double? get discount;
  @override
  @JsonKey(name: 'discount_type')
  DiscountType? get discountType;
  @override
  @DoubleFromStringConverter()
  double? get subtotal;
  @override
  @DoubleFromStringConverter()
  @JsonKey(name: 'extras_total')
  double? get extrasTotal;
  @override
  @DoubleFromStringConverter()
  @JsonKey(name: 'net_total')
  double? get netTotal;
  @override
  @DoubleFromStringConverter()
  double? get rounding;
  @override
  @JsonKey(name: 'license_id')
  int? get licenseId;
  @override
  @JsonKey(name: 'screening_id')
  int? get screeningId;
  @override
  @JsonKey(name: 'customer_id')
  int? get customerId;
  @override
  @JsonKey(name: 'customer_nric')
  String? get customerNric;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'is_new')
  bool get isNew;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
