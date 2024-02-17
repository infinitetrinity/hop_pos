// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_payment_with_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderPaymentWithMethod _$OrderPaymentWithMethodFromJson(
    Map<String, dynamic> json) {
  return _OrderPaymentWithMethod.fromJson(json);
}

/// @nodoc
mixin _$OrderPaymentWithMethod {
  OrderPayment get payment => throw _privateConstructorUsedError;
  PaymentMethod? get method => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderPaymentWithMethodCopyWith<OrderPaymentWithMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPaymentWithMethodCopyWith<$Res> {
  factory $OrderPaymentWithMethodCopyWith(OrderPaymentWithMethod value,
          $Res Function(OrderPaymentWithMethod) then) =
      _$OrderPaymentWithMethodCopyWithImpl<$Res, OrderPaymentWithMethod>;
  @useResult
  $Res call({OrderPayment payment, PaymentMethod? method});

  $OrderPaymentCopyWith<$Res> get payment;
  $PaymentMethodCopyWith<$Res>? get method;
}

/// @nodoc
class _$OrderPaymentWithMethodCopyWithImpl<$Res,
        $Val extends OrderPaymentWithMethod>
    implements $OrderPaymentWithMethodCopyWith<$Res> {
  _$OrderPaymentWithMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payment = null,
    Object? method = freezed,
  }) {
    return _then(_value.copyWith(
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as OrderPayment,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as PaymentMethod?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderPaymentCopyWith<$Res> get payment {
    return $OrderPaymentCopyWith<$Res>(_value.payment, (value) {
      return _then(_value.copyWith(payment: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodCopyWith<$Res>? get method {
    if (_value.method == null) {
      return null;
    }

    return $PaymentMethodCopyWith<$Res>(_value.method!, (value) {
      return _then(_value.copyWith(method: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderPaymentWithMethodImplCopyWith<$Res>
    implements $OrderPaymentWithMethodCopyWith<$Res> {
  factory _$$OrderPaymentWithMethodImplCopyWith(
          _$OrderPaymentWithMethodImpl value,
          $Res Function(_$OrderPaymentWithMethodImpl) then) =
      __$$OrderPaymentWithMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OrderPayment payment, PaymentMethod? method});

  @override
  $OrderPaymentCopyWith<$Res> get payment;
  @override
  $PaymentMethodCopyWith<$Res>? get method;
}

/// @nodoc
class __$$OrderPaymentWithMethodImplCopyWithImpl<$Res>
    extends _$OrderPaymentWithMethodCopyWithImpl<$Res,
        _$OrderPaymentWithMethodImpl>
    implements _$$OrderPaymentWithMethodImplCopyWith<$Res> {
  __$$OrderPaymentWithMethodImplCopyWithImpl(
      _$OrderPaymentWithMethodImpl _value,
      $Res Function(_$OrderPaymentWithMethodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payment = null,
    Object? method = freezed,
  }) {
    return _then(_$OrderPaymentWithMethodImpl(
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as OrderPayment,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as PaymentMethod?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderPaymentWithMethodImpl extends _OrderPaymentWithMethod {
  const _$OrderPaymentWithMethodImpl({required this.payment, this.method})
      : super._();

  factory _$OrderPaymentWithMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderPaymentWithMethodImplFromJson(json);

  @override
  final OrderPayment payment;
  @override
  final PaymentMethod? method;

  @override
  String toString() {
    return 'OrderPaymentWithMethod(payment: $payment, method: $method)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderPaymentWithMethodImpl &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.method, method) || other.method == method));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, payment, method);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderPaymentWithMethodImplCopyWith<_$OrderPaymentWithMethodImpl>
      get copyWith => __$$OrderPaymentWithMethodImplCopyWithImpl<
          _$OrderPaymentWithMethodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderPaymentWithMethodImplToJson(
      this,
    );
  }
}

abstract class _OrderPaymentWithMethod extends OrderPaymentWithMethod {
  const factory _OrderPaymentWithMethod(
      {required final OrderPayment payment,
      final PaymentMethod? method}) = _$OrderPaymentWithMethodImpl;
  const _OrderPaymentWithMethod._() : super._();

  factory _OrderPaymentWithMethod.fromJson(Map<String, dynamic> json) =
      _$OrderPaymentWithMethodImpl.fromJson;

  @override
  OrderPayment get payment;
  @override
  PaymentMethod? get method;
  @override
  @JsonKey(ignore: true)
  _$$OrderPaymentWithMethodImplCopyWith<_$OrderPaymentWithMethodImpl>
      get copyWith => throw _privateConstructorUsedError;
}
