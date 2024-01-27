// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewOrder _$NewOrderFromJson(Map<String, dynamic> json) {
  return _NewOrder.fromJson(json);
}

/// @nodoc
mixin _$NewOrder {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_stf')
  bool get isStf => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_utf')
  bool get isUtf => throw _privateConstructorUsedError;
  @JsonKey(name: 'e_receipt')
  bool get eReceipt => throw _privateConstructorUsedError;
  @JsonKey(name: 'sales_note')
  String? get salesNote => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_no')
  String get invoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_prefix')
  String get invoicePrefix => throw _privateConstructorUsedError;
  @DoubleFromStringConverter()
  double? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_type')
  String? get discountType => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'screening_id')
  int get screeningId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_nric')
  String get customerNric => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewOrderCopyWith<NewOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewOrderCopyWith<$Res> {
  factory $NewOrderCopyWith(NewOrder value, $Res Function(NewOrder) then) =
      _$NewOrderCopyWithImpl<$Res, NewOrder>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'is_stf') bool isStf,
      @JsonKey(name: 'is_utf') bool isUtf,
      @JsonKey(name: 'e_receipt') bool eReceipt,
      @JsonKey(name: 'sales_note') String? salesNote,
      @JsonKey(name: 'invoice_no') String invoiceNo,
      @JsonKey(name: 'invoice_prefix') String invoicePrefix,
      @DoubleFromStringConverter() double? discount,
      @JsonKey(name: 'discount_type') String? discountType,
      @DoubleFromStringConverter() double? subtotal,
      @DoubleFromStringConverter()
      @JsonKey(name: 'extras_total')
      double? extrasTotal,
      @DoubleFromStringConverter() @JsonKey(name: 'net_total') double? netTotal,
      @DoubleFromStringConverter() double? rounding,
      @JsonKey(name: 'screening_id') int screeningId,
      @JsonKey(name: 'customer_nric') String customerNric,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$NewOrderCopyWithImpl<$Res, $Val extends NewOrder>
    implements $NewOrderCopyWith<$Res> {
  _$NewOrderCopyWithImpl(this._value, this._then);

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
    Object? eReceipt = null,
    Object? salesNote = freezed,
    Object? invoiceNo = null,
    Object? invoicePrefix = null,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? subtotal = freezed,
    Object? extrasTotal = freezed,
    Object? netTotal = freezed,
    Object? rounding = freezed,
    Object? screeningId = null,
    Object? customerNric = null,
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
      eReceipt: null == eReceipt
          ? _value.eReceipt
          : eReceipt // ignore: cast_nullable_to_non_nullable
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
      screeningId: null == screeningId
          ? _value.screeningId
          : screeningId // ignore: cast_nullable_to_non_nullable
              as int,
      customerNric: null == customerNric
          ? _value.customerNric
          : customerNric // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewOrderImplCopyWith<$Res>
    implements $NewOrderCopyWith<$Res> {
  factory _$$NewOrderImplCopyWith(
          _$NewOrderImpl value, $Res Function(_$NewOrderImpl) then) =
      __$$NewOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'is_stf') bool isStf,
      @JsonKey(name: 'is_utf') bool isUtf,
      @JsonKey(name: 'e_receipt') bool eReceipt,
      @JsonKey(name: 'sales_note') String? salesNote,
      @JsonKey(name: 'invoice_no') String invoiceNo,
      @JsonKey(name: 'invoice_prefix') String invoicePrefix,
      @DoubleFromStringConverter() double? discount,
      @JsonKey(name: 'discount_type') String? discountType,
      @DoubleFromStringConverter() double? subtotal,
      @DoubleFromStringConverter()
      @JsonKey(name: 'extras_total')
      double? extrasTotal,
      @DoubleFromStringConverter() @JsonKey(name: 'net_total') double? netTotal,
      @DoubleFromStringConverter() double? rounding,
      @JsonKey(name: 'screening_id') int screeningId,
      @JsonKey(name: 'customer_nric') String customerNric,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$NewOrderImplCopyWithImpl<$Res>
    extends _$NewOrderCopyWithImpl<$Res, _$NewOrderImpl>
    implements _$$NewOrderImplCopyWith<$Res> {
  __$$NewOrderImplCopyWithImpl(
      _$NewOrderImpl _value, $Res Function(_$NewOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isStf = null,
    Object? isUtf = null,
    Object? eReceipt = null,
    Object? salesNote = freezed,
    Object? invoiceNo = null,
    Object? invoicePrefix = null,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? subtotal = freezed,
    Object? extrasTotal = freezed,
    Object? netTotal = freezed,
    Object? rounding = freezed,
    Object? screeningId = null,
    Object? customerNric = null,
    Object? createdAt = null,
  }) {
    return _then(_$NewOrderImpl(
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
      eReceipt: null == eReceipt
          ? _value.eReceipt
          : eReceipt // ignore: cast_nullable_to_non_nullable
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
      screeningId: null == screeningId
          ? _value.screeningId
          : screeningId // ignore: cast_nullable_to_non_nullable
              as int,
      customerNric: null == customerNric
          ? _value.customerNric
          : customerNric // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewOrderImpl implements _NewOrder {
  const _$NewOrderImpl(
      {required this.id,
      @JsonKey(name: 'is_stf') required this.isStf,
      @JsonKey(name: 'is_utf') required this.isUtf,
      @JsonKey(name: 'e_receipt') required this.eReceipt,
      @JsonKey(name: 'sales_note') this.salesNote,
      @JsonKey(name: 'invoice_no') required this.invoiceNo,
      @JsonKey(name: 'invoice_prefix') required this.invoicePrefix,
      @DoubleFromStringConverter() this.discount,
      @JsonKey(name: 'discount_type') this.discountType,
      @DoubleFromStringConverter() this.subtotal,
      @DoubleFromStringConverter()
      @JsonKey(name: 'extras_total')
      this.extrasTotal,
      @DoubleFromStringConverter() @JsonKey(name: 'net_total') this.netTotal,
      @DoubleFromStringConverter() this.rounding,
      @JsonKey(name: 'screening_id') required this.screeningId,
      @JsonKey(name: 'customer_nric') required this.customerNric,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$NewOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewOrderImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'is_stf')
  final bool isStf;
  @override
  @JsonKey(name: 'is_utf')
  final bool isUtf;
  @override
  @JsonKey(name: 'e_receipt')
  final bool eReceipt;
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
  @DoubleFromStringConverter()
  final double? discount;
  @override
  @JsonKey(name: 'discount_type')
  final String? discountType;
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
  @JsonKey(name: 'screening_id')
  final int screeningId;
  @override
  @JsonKey(name: 'customer_nric')
  final String customerNric;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'NewOrder(id: $id, isStf: $isStf, isUtf: $isUtf, eReceipt: $eReceipt, salesNote: $salesNote, invoiceNo: $invoiceNo, invoicePrefix: $invoicePrefix, discount: $discount, discountType: $discountType, subtotal: $subtotal, extrasTotal: $extrasTotal, netTotal: $netTotal, rounding: $rounding, screeningId: $screeningId, customerNric: $customerNric, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewOrderImpl &&
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
            (identical(other.screeningId, screeningId) ||
                other.screeningId == screeningId) &&
            (identical(other.customerNric, customerNric) ||
                other.customerNric == customerNric) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
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
      screeningId,
      customerNric,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewOrderImplCopyWith<_$NewOrderImpl> get copyWith =>
      __$$NewOrderImplCopyWithImpl<_$NewOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewOrderImplToJson(
      this,
    );
  }
}

abstract class _NewOrder implements NewOrder {
  const factory _NewOrder(
          {required final int id,
          @JsonKey(name: 'is_stf') required final bool isStf,
          @JsonKey(name: 'is_utf') required final bool isUtf,
          @JsonKey(name: 'e_receipt') required final bool eReceipt,
          @JsonKey(name: 'sales_note') final String? salesNote,
          @JsonKey(name: 'invoice_no') required final String invoiceNo,
          @JsonKey(name: 'invoice_prefix') required final String invoicePrefix,
          @DoubleFromStringConverter() final double? discount,
          @JsonKey(name: 'discount_type') final String? discountType,
          @DoubleFromStringConverter() final double? subtotal,
          @DoubleFromStringConverter()
          @JsonKey(name: 'extras_total')
          final double? extrasTotal,
          @DoubleFromStringConverter()
          @JsonKey(name: 'net_total')
          final double? netTotal,
          @DoubleFromStringConverter() final double? rounding,
          @JsonKey(name: 'screening_id') required final int screeningId,
          @JsonKey(name: 'customer_nric') required final String customerNric,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$NewOrderImpl;

  factory _NewOrder.fromJson(Map<String, dynamic> json) =
      _$NewOrderImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'is_stf')
  bool get isStf;
  @override
  @JsonKey(name: 'is_utf')
  bool get isUtf;
  @override
  @JsonKey(name: 'e_receipt')
  bool get eReceipt;
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
  @DoubleFromStringConverter()
  double? get discount;
  @override
  @JsonKey(name: 'discount_type')
  String? get discountType;
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
  @JsonKey(name: 'screening_id')
  int get screeningId;
  @override
  @JsonKey(name: 'customer_nric')
  String get customerNric;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$NewOrderImplCopyWith<_$NewOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
