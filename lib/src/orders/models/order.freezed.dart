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

/// @nodoc
mixin _$Order {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_stf')
  bool get isStf => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_utf')
  bool get isUtf => throw _privateConstructorUsedError;
  @JsonKey(name: 'sales_note')
  String? get salesNote => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_no')
  String get invoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_prefix')
  String get invoicePrefix => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_type')
  String? get discountType => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'extras_total')
  double get extrasTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'net_total')
  double get netTotal => throw _privateConstructorUsedError;
  double? get rounding => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_id')
  int get licenseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'screening_id')
  int? get screeningId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  int get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'is_stf') bool isStf,
      @JsonKey(name: 'is_utf') bool isUtf,
      @JsonKey(name: 'sales_note') String? salesNote,
      @JsonKey(name: 'invoice_no') String invoiceNo,
      @JsonKey(name: 'invoice_prefix') String invoicePrefix,
      double? discount,
      @JsonKey(name: 'discount_type') String? discountType,
      double subtotal,
      @JsonKey(name: 'extras_total') double extrasTotal,
      @JsonKey(name: 'net_total') double netTotal,
      double? rounding,
      @JsonKey(name: 'license_id') int licenseId,
      @JsonKey(name: 'screening_id') int? screeningId,
      @JsonKey(name: 'customer_id') int customerId,
      @JsonKey(name: 'created_at') DateTime createdAt});
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
    Object? id = null,
    Object? isStf = null,
    Object? isUtf = null,
    Object? salesNote = freezed,
    Object? invoiceNo = null,
    Object? invoicePrefix = null,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? subtotal = null,
    Object? extrasTotal = null,
    Object? netTotal = null,
    Object? rounding = freezed,
    Object? licenseId = null,
    Object? screeningId = freezed,
    Object? customerId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isStf: null == isStf
          ? _value.isStf
          : isStf // ignore: cast_nullable_to_non_nullable
              as bool,
      isUtf: null == isUtf
          ? _value.isUtf
          : isUtf // ignore: cast_nullable_to_non_nullable
              as bool,
      salesNote: freezed == salesNote
          ? _value.salesNote
          : salesNote // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceNo: null == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      invoicePrefix: null == invoicePrefix
          ? _value.invoicePrefix
          : invoicePrefix // ignore: cast_nullable_to_non_nullable
              as String,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      extrasTotal: null == extrasTotal
          ? _value.extrasTotal
          : extrasTotal // ignore: cast_nullable_to_non_nullable
              as double,
      netTotal: null == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as double,
      rounding: freezed == rounding
          ? _value.rounding
          : rounding // ignore: cast_nullable_to_non_nullable
              as double?,
      licenseId: null == licenseId
          ? _value.licenseId
          : licenseId // ignore: cast_nullable_to_non_nullable
              as int,
      screeningId: freezed == screeningId
          ? _value.screeningId
          : screeningId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      {int id,
      @JsonKey(name: 'is_stf') bool isStf,
      @JsonKey(name: 'is_utf') bool isUtf,
      @JsonKey(name: 'sales_note') String? salesNote,
      @JsonKey(name: 'invoice_no') String invoiceNo,
      @JsonKey(name: 'invoice_prefix') String invoicePrefix,
      double? discount,
      @JsonKey(name: 'discount_type') String? discountType,
      double subtotal,
      @JsonKey(name: 'extras_total') double extrasTotal,
      @JsonKey(name: 'net_total') double netTotal,
      double? rounding,
      @JsonKey(name: 'license_id') int licenseId,
      @JsonKey(name: 'screening_id') int? screeningId,
      @JsonKey(name: 'customer_id') int customerId,
      @JsonKey(name: 'created_at') DateTime createdAt});
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
    Object? id = null,
    Object? isStf = null,
    Object? isUtf = null,
    Object? salesNote = freezed,
    Object? invoiceNo = null,
    Object? invoicePrefix = null,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? subtotal = null,
    Object? extrasTotal = null,
    Object? netTotal = null,
    Object? rounding = freezed,
    Object? licenseId = null,
    Object? screeningId = freezed,
    Object? customerId = null,
    Object? createdAt = null,
  }) {
    return _then(_$OrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isStf: null == isStf
          ? _value.isStf
          : isStf // ignore: cast_nullable_to_non_nullable
              as bool,
      isUtf: null == isUtf
          ? _value.isUtf
          : isUtf // ignore: cast_nullable_to_non_nullable
              as bool,
      salesNote: freezed == salesNote
          ? _value.salesNote
          : salesNote // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceNo: null == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      invoicePrefix: null == invoicePrefix
          ? _value.invoicePrefix
          : invoicePrefix // ignore: cast_nullable_to_non_nullable
              as String,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      extrasTotal: null == extrasTotal
          ? _value.extrasTotal
          : extrasTotal // ignore: cast_nullable_to_non_nullable
              as double,
      netTotal: null == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as double,
      rounding: freezed == rounding
          ? _value.rounding
          : rounding // ignore: cast_nullable_to_non_nullable
              as double?,
      licenseId: null == licenseId
          ? _value.licenseId
          : licenseId // ignore: cast_nullable_to_non_nullable
              as int,
      screeningId: freezed == screeningId
          ? _value.screeningId
          : screeningId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {required this.id,
      @JsonKey(name: 'is_stf') required this.isStf,
      @JsonKey(name: 'is_utf') required this.isUtf,
      @JsonKey(name: 'sales_note') this.salesNote,
      @JsonKey(name: 'invoice_no') required this.invoiceNo,
      @JsonKey(name: 'invoice_prefix') required this.invoicePrefix,
      this.discount,
      @JsonKey(name: 'discount_type') this.discountType,
      required this.subtotal,
      @JsonKey(name: 'extras_total') required this.extrasTotal,
      @JsonKey(name: 'net_total') required this.netTotal,
      this.rounding,
      @JsonKey(name: 'license_id') required this.licenseId,
      @JsonKey(name: 'screening_id') this.screeningId,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'created_at') required this.createdAt});

  @override
  final int id;
  @override
  @JsonKey(name: 'is_stf')
  final bool isStf;
  @override
  @JsonKey(name: 'is_utf')
  final bool isUtf;
  @override
  @JsonKey(name: 'sales_note')
  final String? salesNote;
  @override
  @JsonKey(name: 'invoice_no')
  final String invoiceNo;
  @override
  @JsonKey(name: 'invoice_prefix')
  final String invoicePrefix;
  @override
  final double? discount;
  @override
  @JsonKey(name: 'discount_type')
  final String? discountType;
  @override
  final double subtotal;
  @override
  @JsonKey(name: 'extras_total')
  final double extrasTotal;
  @override
  @JsonKey(name: 'net_total')
  final double netTotal;
  @override
  final double? rounding;
  @override
  @JsonKey(name: 'license_id')
  final int licenseId;
  @override
  @JsonKey(name: 'screening_id')
  final int? screeningId;
  @override
  @JsonKey(name: 'customer_id')
  final int customerId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'Order(id: $id, isStf: $isStf, isUtf: $isUtf, salesNote: $salesNote, invoiceNo: $invoiceNo, invoicePrefix: $invoicePrefix, discount: $discount, discountType: $discountType, subtotal: $subtotal, extrasTotal: $extrasTotal, netTotal: $netTotal, rounding: $rounding, licenseId: $licenseId, screeningId: $screeningId, customerId: $customerId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isStf, isStf) || other.isStf == isStf) &&
            (identical(other.isUtf, isUtf) || other.isUtf == isUtf) &&
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
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isStf,
      isUtf,
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
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);
}

abstract class _Order implements Order {
  const factory _Order(
          {required final int id,
          @JsonKey(name: 'is_stf') required final bool isStf,
          @JsonKey(name: 'is_utf') required final bool isUtf,
          @JsonKey(name: 'sales_note') final String? salesNote,
          @JsonKey(name: 'invoice_no') required final String invoiceNo,
          @JsonKey(name: 'invoice_prefix') required final String invoicePrefix,
          final double? discount,
          @JsonKey(name: 'discount_type') final String? discountType,
          required final double subtotal,
          @JsonKey(name: 'extras_total') required final double extrasTotal,
          @JsonKey(name: 'net_total') required final double netTotal,
          final double? rounding,
          @JsonKey(name: 'license_id') required final int licenseId,
          @JsonKey(name: 'screening_id') final int? screeningId,
          @JsonKey(name: 'customer_id') required final int customerId,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$OrderImpl;

  @override
  int get id;
  @override
  @JsonKey(name: 'is_stf')
  bool get isStf;
  @override
  @JsonKey(name: 'is_utf')
  bool get isUtf;
  @override
  @JsonKey(name: 'sales_note')
  String? get salesNote;
  @override
  @JsonKey(name: 'invoice_no')
  String get invoiceNo;
  @override
  @JsonKey(name: 'invoice_prefix')
  String get invoicePrefix;
  @override
  double? get discount;
  @override
  @JsonKey(name: 'discount_type')
  String? get discountType;
  @override
  double get subtotal;
  @override
  @JsonKey(name: 'extras_total')
  double get extrasTotal;
  @override
  @JsonKey(name: 'net_total')
  double get netTotal;
  @override
  double? get rounding;
  @override
  @JsonKey(name: 'license_id')
  int get licenseId;
  @override
  @JsonKey(name: 'screening_id')
  int? get screeningId;
  @override
  @JsonKey(name: 'customer_id')
  int get customerId;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}