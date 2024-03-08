// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_with_customer_and_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderWithCustomerAndPayment _$OrderWithCustomerAndPaymentFromJson(
    Map<String, dynamic> json) {
  return _OrderWithCustomerAndPayment.fromJson(json);
}

/// @nodoc
mixin _$OrderWithCustomerAndPayment {
  Order get order => throw _privateConstructorUsedError;
  Customer get customer => throw _privateConstructorUsedError;
  String? get index => throw _privateConstructorUsedError;
  double? get totalPayment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderWithCustomerAndPaymentCopyWith<OrderWithCustomerAndPayment>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderWithCustomerAndPaymentCopyWith<$Res> {
  factory $OrderWithCustomerAndPaymentCopyWith(
          OrderWithCustomerAndPayment value,
          $Res Function(OrderWithCustomerAndPayment) then) =
      _$OrderWithCustomerAndPaymentCopyWithImpl<$Res,
          OrderWithCustomerAndPayment>;
  @useResult
  $Res call(
      {Order order, Customer customer, String? index, double? totalPayment});

  $OrderCopyWith<$Res> get order;
  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class _$OrderWithCustomerAndPaymentCopyWithImpl<$Res,
        $Val extends OrderWithCustomerAndPayment>
    implements $OrderWithCustomerAndPaymentCopyWith<$Res> {
  _$OrderWithCustomerAndPaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? customer = null,
    Object? index = freezed,
    Object? totalPayment = freezed,
  }) {
    return _then(_value.copyWith(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPayment: freezed == totalPayment
          ? _value.totalPayment
          : totalPayment // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderCopyWith<$Res> get order {
    return $OrderCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get customer {
    return $CustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderWithCustomerAndPaymentImplCopyWith<$Res>
    implements $OrderWithCustomerAndPaymentCopyWith<$Res> {
  factory _$$OrderWithCustomerAndPaymentImplCopyWith(
          _$OrderWithCustomerAndPaymentImpl value,
          $Res Function(_$OrderWithCustomerAndPaymentImpl) then) =
      __$$OrderWithCustomerAndPaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Order order, Customer customer, String? index, double? totalPayment});

  @override
  $OrderCopyWith<$Res> get order;
  @override
  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class __$$OrderWithCustomerAndPaymentImplCopyWithImpl<$Res>
    extends _$OrderWithCustomerAndPaymentCopyWithImpl<$Res,
        _$OrderWithCustomerAndPaymentImpl>
    implements _$$OrderWithCustomerAndPaymentImplCopyWith<$Res> {
  __$$OrderWithCustomerAndPaymentImplCopyWithImpl(
      _$OrderWithCustomerAndPaymentImpl _value,
      $Res Function(_$OrderWithCustomerAndPaymentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? customer = null,
    Object? index = freezed,
    Object? totalPayment = freezed,
  }) {
    return _then(_$OrderWithCustomerAndPaymentImpl(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPayment: freezed == totalPayment
          ? _value.totalPayment
          : totalPayment // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderWithCustomerAndPaymentImpl extends _OrderWithCustomerAndPayment {
  const _$OrderWithCustomerAndPaymentImpl(
      {required this.order,
      required this.customer,
      this.index,
      this.totalPayment})
      : super._();

  factory _$OrderWithCustomerAndPaymentImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$OrderWithCustomerAndPaymentImplFromJson(json);

  @override
  final Order order;
  @override
  final Customer customer;
  @override
  final String? index;
  @override
  final double? totalPayment;

  @override
  String toString() {
    return 'OrderWithCustomerAndPayment(order: $order, customer: $customer, index: $index, totalPayment: $totalPayment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderWithCustomerAndPaymentImpl &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.totalPayment, totalPayment) ||
                other.totalPayment == totalPayment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, order, customer, index, totalPayment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderWithCustomerAndPaymentImplCopyWith<_$OrderWithCustomerAndPaymentImpl>
      get copyWith => __$$OrderWithCustomerAndPaymentImplCopyWithImpl<
          _$OrderWithCustomerAndPaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderWithCustomerAndPaymentImplToJson(
      this,
    );
  }
}

abstract class _OrderWithCustomerAndPayment
    extends OrderWithCustomerAndPayment {
  const factory _OrderWithCustomerAndPayment(
      {required final Order order,
      required final Customer customer,
      final String? index,
      final double? totalPayment}) = _$OrderWithCustomerAndPaymentImpl;
  const _OrderWithCustomerAndPayment._() : super._();

  factory _OrderWithCustomerAndPayment.fromJson(Map<String, dynamic> json) =
      _$OrderWithCustomerAndPaymentImpl.fromJson;

  @override
  Order get order;
  @override
  Customer get customer;
  @override
  String? get index;
  @override
  double? get totalPayment;
  @override
  @JsonKey(ignore: true)
  _$$OrderWithCustomerAndPaymentImplCopyWith<_$OrderWithCustomerAndPaymentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
