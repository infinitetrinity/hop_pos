// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderPayment _$OrderPaymentFromJson(Map<String, dynamic> json) {
  return _OrderPayment.fromJson(json);
}

/// @nodoc
mixin _$OrderPayment {
  int get id => throw _privateConstructorUsedError;
  @DoubleFromStringConverter()
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  int get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method_id')
  int? get paymentMethodId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_is_new')
  bool? get orderIsNew => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_new')
  bool? get isNew => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderPaymentCopyWith<OrderPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPaymentCopyWith<$Res> {
  factory $OrderPaymentCopyWith(
          OrderPayment value, $Res Function(OrderPayment) then) =
      _$OrderPaymentCopyWithImpl<$Res, OrderPayment>;
  @useResult
  $Res call(
      {int id,
      @DoubleFromStringConverter() double? amount,
      @JsonKey(name: 'order_id') int orderId,
      @JsonKey(name: 'payment_method_id') int? paymentMethodId,
      @JsonKey(name: 'order_is_new') bool? orderIsNew,
      @JsonKey(name: 'is_new') bool? isNew,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$OrderPaymentCopyWithImpl<$Res, $Val extends OrderPayment>
    implements $OrderPaymentCopyWith<$Res> {
  _$OrderPaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = freezed,
    Object? orderId = null,
    Object? paymentMethodId = freezed,
    Object? orderIsNew = freezed,
    Object? isNew = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderIsNew: freezed == orderIsNew
          ? _value.orderIsNew
          : orderIsNew // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNew: freezed == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderPaymentImplCopyWith<$Res>
    implements $OrderPaymentCopyWith<$Res> {
  factory _$$OrderPaymentImplCopyWith(
          _$OrderPaymentImpl value, $Res Function(_$OrderPaymentImpl) then) =
      __$$OrderPaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @DoubleFromStringConverter() double? amount,
      @JsonKey(name: 'order_id') int orderId,
      @JsonKey(name: 'payment_method_id') int? paymentMethodId,
      @JsonKey(name: 'order_is_new') bool? orderIsNew,
      @JsonKey(name: 'is_new') bool? isNew,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$OrderPaymentImplCopyWithImpl<$Res>
    extends _$OrderPaymentCopyWithImpl<$Res, _$OrderPaymentImpl>
    implements _$$OrderPaymentImplCopyWith<$Res> {
  __$$OrderPaymentImplCopyWithImpl(
      _$OrderPaymentImpl _value, $Res Function(_$OrderPaymentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = freezed,
    Object? orderId = null,
    Object? paymentMethodId = freezed,
    Object? orderIsNew = freezed,
    Object? isNew = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$OrderPaymentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderIsNew: freezed == orderIsNew
          ? _value.orderIsNew
          : orderIsNew // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNew: freezed == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderPaymentImpl implements _OrderPayment {
  const _$OrderPaymentImpl(
      {required this.id,
      @DoubleFromStringConverter() this.amount,
      @JsonKey(name: 'order_id') required this.orderId,
      @JsonKey(name: 'payment_method_id') this.paymentMethodId,
      @JsonKey(name: 'order_is_new') this.orderIsNew = false,
      @JsonKey(name: 'is_new') this.isNew = false,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$OrderPaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderPaymentImplFromJson(json);

  @override
  final int id;
  @override
  @DoubleFromStringConverter()
  final double? amount;
  @override
  @JsonKey(name: 'order_id')
  final int orderId;
  @override
  @JsonKey(name: 'payment_method_id')
  final int? paymentMethodId;
  @override
  @JsonKey(name: 'order_is_new')
  final bool? orderIsNew;
  @override
  @JsonKey(name: 'is_new')
  final bool? isNew;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'OrderPayment(id: $id, amount: $amount, orderId: $orderId, paymentMethodId: $paymentMethodId, orderIsNew: $orderIsNew, isNew: $isNew, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderPaymentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.paymentMethodId, paymentMethodId) ||
                other.paymentMethodId == paymentMethodId) &&
            (identical(other.orderIsNew, orderIsNew) ||
                other.orderIsNew == orderIsNew) &&
            (identical(other.isNew, isNew) || other.isNew == isNew) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount, orderId,
      paymentMethodId, orderIsNew, isNew, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderPaymentImplCopyWith<_$OrderPaymentImpl> get copyWith =>
      __$$OrderPaymentImplCopyWithImpl<_$OrderPaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderPaymentImplToJson(
      this,
    );
  }
}

abstract class _OrderPayment implements OrderPayment {
  const factory _OrderPayment(
          {required final int id,
          @DoubleFromStringConverter() final double? amount,
          @JsonKey(name: 'order_id') required final int orderId,
          @JsonKey(name: 'payment_method_id') final int? paymentMethodId,
          @JsonKey(name: 'order_is_new') final bool? orderIsNew,
          @JsonKey(name: 'is_new') final bool? isNew,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$OrderPaymentImpl;

  factory _OrderPayment.fromJson(Map<String, dynamic> json) =
      _$OrderPaymentImpl.fromJson;

  @override
  int get id;
  @override
  @DoubleFromStringConverter()
  double? get amount;
  @override
  @JsonKey(name: 'order_id')
  int get orderId;
  @override
  @JsonKey(name: 'payment_method_id')
  int? get paymentMethodId;
  @override
  @JsonKey(name: 'order_is_new')
  bool? get orderIsNew;
  @override
  @JsonKey(name: 'is_new')
  bool? get isNew;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderPaymentImplCopyWith<_$OrderPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
