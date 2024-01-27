// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_order_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewOrderPayment _$NewOrderPaymentFromJson(Map<String, dynamic> json) {
  return _NewOrderPayment.fromJson(json);
}

/// @nodoc
mixin _$NewOrderPayment {
  int get id => throw _privateConstructorUsedError;
  @DoubleFromStringConverter()
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  int get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method_id')
  int? get paymentMethodId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_is_new')
  bool get orderIsNew => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewOrderPaymentCopyWith<NewOrderPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewOrderPaymentCopyWith<$Res> {
  factory $NewOrderPaymentCopyWith(
          NewOrderPayment value, $Res Function(NewOrderPayment) then) =
      _$NewOrderPaymentCopyWithImpl<$Res, NewOrderPayment>;
  @useResult
  $Res call(
      {int id,
      @DoubleFromStringConverter() double? amount,
      @JsonKey(name: 'order_id') int orderId,
      @JsonKey(name: 'payment_method_id') int? paymentMethodId,
      @JsonKey(name: 'order_is_new') bool orderIsNew,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$NewOrderPaymentCopyWithImpl<$Res, $Val extends NewOrderPayment>
    implements $NewOrderPaymentCopyWith<$Res> {
  _$NewOrderPaymentCopyWithImpl(this._value, this._then);

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
    Object? orderIsNew = null,
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
      orderIsNew: null == orderIsNew
          ? _value.orderIsNew
          : orderIsNew // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewOrderPaymentImplCopyWith<$Res>
    implements $NewOrderPaymentCopyWith<$Res> {
  factory _$$NewOrderPaymentImplCopyWith(_$NewOrderPaymentImpl value,
          $Res Function(_$NewOrderPaymentImpl) then) =
      __$$NewOrderPaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @DoubleFromStringConverter() double? amount,
      @JsonKey(name: 'order_id') int orderId,
      @JsonKey(name: 'payment_method_id') int? paymentMethodId,
      @JsonKey(name: 'order_is_new') bool orderIsNew,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$NewOrderPaymentImplCopyWithImpl<$Res>
    extends _$NewOrderPaymentCopyWithImpl<$Res, _$NewOrderPaymentImpl>
    implements _$$NewOrderPaymentImplCopyWith<$Res> {
  __$$NewOrderPaymentImplCopyWithImpl(
      _$NewOrderPaymentImpl _value, $Res Function(_$NewOrderPaymentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = freezed,
    Object? orderId = null,
    Object? paymentMethodId = freezed,
    Object? orderIsNew = null,
    Object? createdAt = null,
  }) {
    return _then(_$NewOrderPaymentImpl(
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
      orderIsNew: null == orderIsNew
          ? _value.orderIsNew
          : orderIsNew // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewOrderPaymentImpl implements _NewOrderPayment {
  const _$NewOrderPaymentImpl(
      {required this.id,
      @DoubleFromStringConverter() this.amount,
      @JsonKey(name: 'order_id') required this.orderId,
      @JsonKey(name: 'payment_method_id') this.paymentMethodId,
      @JsonKey(name: 'order_is_new') required this.orderIsNew,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$NewOrderPaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewOrderPaymentImplFromJson(json);

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
  final bool orderIsNew;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'NewOrderPayment(id: $id, amount: $amount, orderId: $orderId, paymentMethodId: $paymentMethodId, orderIsNew: $orderIsNew, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewOrderPaymentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.paymentMethodId, paymentMethodId) ||
                other.paymentMethodId == paymentMethodId) &&
            (identical(other.orderIsNew, orderIsNew) ||
                other.orderIsNew == orderIsNew) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, amount, orderId, paymentMethodId, orderIsNew, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewOrderPaymentImplCopyWith<_$NewOrderPaymentImpl> get copyWith =>
      __$$NewOrderPaymentImplCopyWithImpl<_$NewOrderPaymentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewOrderPaymentImplToJson(
      this,
    );
  }
}

abstract class _NewOrderPayment implements NewOrderPayment {
  const factory _NewOrderPayment(
          {required final int id,
          @DoubleFromStringConverter() final double? amount,
          @JsonKey(name: 'order_id') required final int orderId,
          @JsonKey(name: 'payment_method_id') final int? paymentMethodId,
          @JsonKey(name: 'order_is_new') required final bool orderIsNew,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$NewOrderPaymentImpl;

  factory _NewOrderPayment.fromJson(Map<String, dynamic> json) =
      _$NewOrderPaymentImpl.fromJson;

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
  bool get orderIsNew;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$NewOrderPaymentImplCopyWith<_$NewOrderPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
