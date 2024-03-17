// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_with_screenings_and_orders.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerWithScreeningsAndOrders _$CustomerWithScreeningsAndOrdersFromJson(
    Map<String, dynamic> json) {
  return _CustomerWithScreeningsAndOrders.fromJson(json);
}

/// @nodoc
mixin _$CustomerWithScreeningsAndOrders {
  Customer get customer => throw _privateConstructorUsedError;
  List<CustomerWithRegistration>? get screenings =>
      throw _privateConstructorUsedError;
  List<OrderWithCustomerAndPayment>? get orders =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerWithScreeningsAndOrdersCopyWith<CustomerWithScreeningsAndOrders>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerWithScreeningsAndOrdersCopyWith<$Res> {
  factory $CustomerWithScreeningsAndOrdersCopyWith(
          CustomerWithScreeningsAndOrders value,
          $Res Function(CustomerWithScreeningsAndOrders) then) =
      _$CustomerWithScreeningsAndOrdersCopyWithImpl<$Res,
          CustomerWithScreeningsAndOrders>;
  @useResult
  $Res call(
      {Customer customer,
      List<CustomerWithRegistration>? screenings,
      List<OrderWithCustomerAndPayment>? orders});

  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class _$CustomerWithScreeningsAndOrdersCopyWithImpl<$Res,
        $Val extends CustomerWithScreeningsAndOrders>
    implements $CustomerWithScreeningsAndOrdersCopyWith<$Res> {
  _$CustomerWithScreeningsAndOrdersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? screenings = freezed,
    Object? orders = freezed,
  }) {
    return _then(_value.copyWith(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      screenings: freezed == screenings
          ? _value.screenings
          : screenings // ignore: cast_nullable_to_non_nullable
              as List<CustomerWithRegistration>?,
      orders: freezed == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderWithCustomerAndPayment>?,
    ) as $Val);
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
abstract class _$$CustomerWithScreeningsAndOrdersImplCopyWith<$Res>
    implements $CustomerWithScreeningsAndOrdersCopyWith<$Res> {
  factory _$$CustomerWithScreeningsAndOrdersImplCopyWith(
          _$CustomerWithScreeningsAndOrdersImpl value,
          $Res Function(_$CustomerWithScreeningsAndOrdersImpl) then) =
      __$$CustomerWithScreeningsAndOrdersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Customer customer,
      List<CustomerWithRegistration>? screenings,
      List<OrderWithCustomerAndPayment>? orders});

  @override
  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class __$$CustomerWithScreeningsAndOrdersImplCopyWithImpl<$Res>
    extends _$CustomerWithScreeningsAndOrdersCopyWithImpl<$Res,
        _$CustomerWithScreeningsAndOrdersImpl>
    implements _$$CustomerWithScreeningsAndOrdersImplCopyWith<$Res> {
  __$$CustomerWithScreeningsAndOrdersImplCopyWithImpl(
      _$CustomerWithScreeningsAndOrdersImpl _value,
      $Res Function(_$CustomerWithScreeningsAndOrdersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? screenings = freezed,
    Object? orders = freezed,
  }) {
    return _then(_$CustomerWithScreeningsAndOrdersImpl(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      screenings: freezed == screenings
          ? _value._screenings
          : screenings // ignore: cast_nullable_to_non_nullable
              as List<CustomerWithRegistration>?,
      orders: freezed == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderWithCustomerAndPayment>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerWithScreeningsAndOrdersImpl
    extends _CustomerWithScreeningsAndOrders {
  const _$CustomerWithScreeningsAndOrdersImpl(
      {required this.customer,
      final List<CustomerWithRegistration>? screenings,
      final List<OrderWithCustomerAndPayment>? orders})
      : _screenings = screenings,
        _orders = orders,
        super._();

  factory _$CustomerWithScreeningsAndOrdersImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CustomerWithScreeningsAndOrdersImplFromJson(json);

  @override
  final Customer customer;
  final List<CustomerWithRegistration>? _screenings;
  @override
  List<CustomerWithRegistration>? get screenings {
    final value = _screenings;
    if (value == null) return null;
    if (_screenings is EqualUnmodifiableListView) return _screenings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<OrderWithCustomerAndPayment>? _orders;
  @override
  List<OrderWithCustomerAndPayment>? get orders {
    final value = _orders;
    if (value == null) return null;
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CustomerWithScreeningsAndOrders(customer: $customer, screenings: $screenings, orders: $orders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerWithScreeningsAndOrdersImpl &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            const DeepCollectionEquality()
                .equals(other._screenings, _screenings) &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customer,
      const DeepCollectionEquality().hash(_screenings),
      const DeepCollectionEquality().hash(_orders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerWithScreeningsAndOrdersImplCopyWith<
          _$CustomerWithScreeningsAndOrdersImpl>
      get copyWith => __$$CustomerWithScreeningsAndOrdersImplCopyWithImpl<
          _$CustomerWithScreeningsAndOrdersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerWithScreeningsAndOrdersImplToJson(
      this,
    );
  }
}

abstract class _CustomerWithScreeningsAndOrders
    extends CustomerWithScreeningsAndOrders {
  const factory _CustomerWithScreeningsAndOrders(
          {required final Customer customer,
          final List<CustomerWithRegistration>? screenings,
          final List<OrderWithCustomerAndPayment>? orders}) =
      _$CustomerWithScreeningsAndOrdersImpl;
  const _CustomerWithScreeningsAndOrders._() : super._();

  factory _CustomerWithScreeningsAndOrders.fromJson(Map<String, dynamic> json) =
      _$CustomerWithScreeningsAndOrdersImpl.fromJson;

  @override
  Customer get customer;
  @override
  List<CustomerWithRegistration>? get screenings;
  @override
  List<OrderWithCustomerAndPayment>? get orders;
  @override
  @JsonKey(ignore: true)
  _$$CustomerWithScreeningsAndOrdersImplCopyWith<
          _$CustomerWithScreeningsAndOrdersImpl>
      get copyWith => throw _privateConstructorUsedError;
}
