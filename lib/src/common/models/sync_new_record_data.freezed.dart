// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_new_record_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SyncNewRecordData _$SyncNewRecordDataFromJson(Map<String, dynamic> json) {
  return _SyncNewRecordData.fromJson(json);
}

/// @nodoc
mixin _$SyncNewRecordData {
  List<Customer> get customers => throw _privateConstructorUsedError;
  List<ScreeningRegistration> get registrations =>
      throw _privateConstructorUsedError;
  List<Order> get orders => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_items')
  List<OrderItem> get orderItems => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_extras')
  List<OrderExtra> get orderExtras => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_payments')
  List<OrderPayment> get orderPayments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncNewRecordDataCopyWith<SyncNewRecordData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncNewRecordDataCopyWith<$Res> {
  factory $SyncNewRecordDataCopyWith(
          SyncNewRecordData value, $Res Function(SyncNewRecordData) then) =
      _$SyncNewRecordDataCopyWithImpl<$Res, SyncNewRecordData>;
  @useResult
  $Res call(
      {List<Customer> customers,
      List<ScreeningRegistration> registrations,
      List<Order> orders,
      @JsonKey(name: 'order_items') List<OrderItem> orderItems,
      @JsonKey(name: 'order_extras') List<OrderExtra> orderExtras,
      @JsonKey(name: 'order_payments') List<OrderPayment> orderPayments});
}

/// @nodoc
class _$SyncNewRecordDataCopyWithImpl<$Res, $Val extends SyncNewRecordData>
    implements $SyncNewRecordDataCopyWith<$Res> {
  _$SyncNewRecordDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customers = null,
    Object? registrations = null,
    Object? orders = null,
    Object? orderItems = null,
    Object? orderExtras = null,
    Object? orderPayments = null,
  }) {
    return _then(_value.copyWith(
      customers: null == customers
          ? _value.customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
      registrations: null == registrations
          ? _value.registrations
          : registrations // ignore: cast_nullable_to_non_nullable
              as List<ScreeningRegistration>,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      orderItems: null == orderItems
          ? _value.orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      orderExtras: null == orderExtras
          ? _value.orderExtras
          : orderExtras // ignore: cast_nullable_to_non_nullable
              as List<OrderExtra>,
      orderPayments: null == orderPayments
          ? _value.orderPayments
          : orderPayments // ignore: cast_nullable_to_non_nullable
              as List<OrderPayment>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncNewRecordDataImplCopyWith<$Res>
    implements $SyncNewRecordDataCopyWith<$Res> {
  factory _$$SyncNewRecordDataImplCopyWith(_$SyncNewRecordDataImpl value,
          $Res Function(_$SyncNewRecordDataImpl) then) =
      __$$SyncNewRecordDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Customer> customers,
      List<ScreeningRegistration> registrations,
      List<Order> orders,
      @JsonKey(name: 'order_items') List<OrderItem> orderItems,
      @JsonKey(name: 'order_extras') List<OrderExtra> orderExtras,
      @JsonKey(name: 'order_payments') List<OrderPayment> orderPayments});
}

/// @nodoc
class __$$SyncNewRecordDataImplCopyWithImpl<$Res>
    extends _$SyncNewRecordDataCopyWithImpl<$Res, _$SyncNewRecordDataImpl>
    implements _$$SyncNewRecordDataImplCopyWith<$Res> {
  __$$SyncNewRecordDataImplCopyWithImpl(_$SyncNewRecordDataImpl _value,
      $Res Function(_$SyncNewRecordDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customers = null,
    Object? registrations = null,
    Object? orders = null,
    Object? orderItems = null,
    Object? orderExtras = null,
    Object? orderPayments = null,
  }) {
    return _then(_$SyncNewRecordDataImpl(
      customers: null == customers
          ? _value._customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
      registrations: null == registrations
          ? _value._registrations
          : registrations // ignore: cast_nullable_to_non_nullable
              as List<ScreeningRegistration>,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      orderItems: null == orderItems
          ? _value._orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      orderExtras: null == orderExtras
          ? _value._orderExtras
          : orderExtras // ignore: cast_nullable_to_non_nullable
              as List<OrderExtra>,
      orderPayments: null == orderPayments
          ? _value._orderPayments
          : orderPayments // ignore: cast_nullable_to_non_nullable
              as List<OrderPayment>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncNewRecordDataImpl implements _SyncNewRecordData {
  const _$SyncNewRecordDataImpl(
      {required final List<Customer> customers,
      required final List<ScreeningRegistration> registrations,
      required final List<Order> orders,
      @JsonKey(name: 'order_items') required final List<OrderItem> orderItems,
      @JsonKey(name: 'order_extras')
      required final List<OrderExtra> orderExtras,
      @JsonKey(name: 'order_payments')
      required final List<OrderPayment> orderPayments})
      : _customers = customers,
        _registrations = registrations,
        _orders = orders,
        _orderItems = orderItems,
        _orderExtras = orderExtras,
        _orderPayments = orderPayments;

  factory _$SyncNewRecordDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncNewRecordDataImplFromJson(json);

  final List<Customer> _customers;
  @override
  List<Customer> get customers {
    if (_customers is EqualUnmodifiableListView) return _customers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customers);
  }

  final List<ScreeningRegistration> _registrations;
  @override
  List<ScreeningRegistration> get registrations {
    if (_registrations is EqualUnmodifiableListView) return _registrations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_registrations);
  }

  final List<Order> _orders;
  @override
  List<Order> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  final List<OrderItem> _orderItems;
  @override
  @JsonKey(name: 'order_items')
  List<OrderItem> get orderItems {
    if (_orderItems is EqualUnmodifiableListView) return _orderItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderItems);
  }

  final List<OrderExtra> _orderExtras;
  @override
  @JsonKey(name: 'order_extras')
  List<OrderExtra> get orderExtras {
    if (_orderExtras is EqualUnmodifiableListView) return _orderExtras;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderExtras);
  }

  final List<OrderPayment> _orderPayments;
  @override
  @JsonKey(name: 'order_payments')
  List<OrderPayment> get orderPayments {
    if (_orderPayments is EqualUnmodifiableListView) return _orderPayments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderPayments);
  }

  @override
  String toString() {
    return 'SyncNewRecordData(customers: $customers, registrations: $registrations, orders: $orders, orderItems: $orderItems, orderExtras: $orderExtras, orderPayments: $orderPayments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncNewRecordDataImpl &&
            const DeepCollectionEquality()
                .equals(other._customers, _customers) &&
            const DeepCollectionEquality()
                .equals(other._registrations, _registrations) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            const DeepCollectionEquality()
                .equals(other._orderItems, _orderItems) &&
            const DeepCollectionEquality()
                .equals(other._orderExtras, _orderExtras) &&
            const DeepCollectionEquality()
                .equals(other._orderPayments, _orderPayments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_customers),
      const DeepCollectionEquality().hash(_registrations),
      const DeepCollectionEquality().hash(_orders),
      const DeepCollectionEquality().hash(_orderItems),
      const DeepCollectionEquality().hash(_orderExtras),
      const DeepCollectionEquality().hash(_orderPayments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncNewRecordDataImplCopyWith<_$SyncNewRecordDataImpl> get copyWith =>
      __$$SyncNewRecordDataImplCopyWithImpl<_$SyncNewRecordDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncNewRecordDataImplToJson(
      this,
    );
  }
}

abstract class _SyncNewRecordData implements SyncNewRecordData {
  const factory _SyncNewRecordData(
      {required final List<Customer> customers,
      required final List<ScreeningRegistration> registrations,
      required final List<Order> orders,
      @JsonKey(name: 'order_items') required final List<OrderItem> orderItems,
      @JsonKey(name: 'order_extras')
      required final List<OrderExtra> orderExtras,
      @JsonKey(name: 'order_payments')
      required final List<OrderPayment>
          orderPayments}) = _$SyncNewRecordDataImpl;

  factory _SyncNewRecordData.fromJson(Map<String, dynamic> json) =
      _$SyncNewRecordDataImpl.fromJson;

  @override
  List<Customer> get customers;
  @override
  List<ScreeningRegistration> get registrations;
  @override
  List<Order> get orders;
  @override
  @JsonKey(name: 'order_items')
  List<OrderItem> get orderItems;
  @override
  @JsonKey(name: 'order_extras')
  List<OrderExtra> get orderExtras;
  @override
  @JsonKey(name: 'order_payments')
  List<OrderPayment> get orderPayments;
  @override
  @JsonKey(ignore: true)
  _$$SyncNewRecordDataImplCopyWith<_$SyncNewRecordDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
