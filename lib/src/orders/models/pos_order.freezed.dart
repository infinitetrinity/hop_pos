// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PosOrder _$PosOrderFromJson(Map<String, dynamic> json) {
  return _PosOrder.fromJson(json);
}

/// @nodoc
mixin _$PosOrder {
  Order get order => throw _privateConstructorUsedError;
  bool? get payLater => throw _privateConstructorUsedError;
  List<OrderItem>? get items => throw _privateConstructorUsedError;
  List<OrderExtra>? get extras => throw _privateConstructorUsedError;
  List<OrderPaymentWithMethod>? get payments =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PosOrderCopyWith<PosOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosOrderCopyWith<$Res> {
  factory $PosOrderCopyWith(PosOrder value, $Res Function(PosOrder) then) =
      _$PosOrderCopyWithImpl<$Res, PosOrder>;
  @useResult
  $Res call(
      {Order order,
      bool? payLater,
      List<OrderItem>? items,
      List<OrderExtra>? extras,
      List<OrderPaymentWithMethod>? payments});

  $OrderCopyWith<$Res> get order;
}

/// @nodoc
class _$PosOrderCopyWithImpl<$Res, $Val extends PosOrder>
    implements $PosOrderCopyWith<$Res> {
  _$PosOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? payLater = freezed,
    Object? items = freezed,
    Object? extras = freezed,
    Object? payments = freezed,
  }) {
    return _then(_value.copyWith(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
      payLater: freezed == payLater
          ? _value.payLater
          : payLater // ignore: cast_nullable_to_non_nullable
              as bool?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>?,
      extras: freezed == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as List<OrderExtra>?,
      payments: freezed == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<OrderPaymentWithMethod>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderCopyWith<$Res> get order {
    return $OrderCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PosOrderImplCopyWith<$Res>
    implements $PosOrderCopyWith<$Res> {
  factory _$$PosOrderImplCopyWith(
          _$PosOrderImpl value, $Res Function(_$PosOrderImpl) then) =
      __$$PosOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Order order,
      bool? payLater,
      List<OrderItem>? items,
      List<OrderExtra>? extras,
      List<OrderPaymentWithMethod>? payments});

  @override
  $OrderCopyWith<$Res> get order;
}

/// @nodoc
class __$$PosOrderImplCopyWithImpl<$Res>
    extends _$PosOrderCopyWithImpl<$Res, _$PosOrderImpl>
    implements _$$PosOrderImplCopyWith<$Res> {
  __$$PosOrderImplCopyWithImpl(
      _$PosOrderImpl _value, $Res Function(_$PosOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? payLater = freezed,
    Object? items = freezed,
    Object? extras = freezed,
    Object? payments = freezed,
  }) {
    return _then(_$PosOrderImpl(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
      payLater: freezed == payLater
          ? _value.payLater
          : payLater // ignore: cast_nullable_to_non_nullable
              as bool?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>?,
      extras: freezed == extras
          ? _value._extras
          : extras // ignore: cast_nullable_to_non_nullable
              as List<OrderExtra>?,
      payments: freezed == payments
          ? _value._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<OrderPaymentWithMethod>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PosOrderImpl extends _PosOrder {
  const _$PosOrderImpl(
      {required this.order,
      this.payLater = false,
      final List<OrderItem>? items,
      final List<OrderExtra>? extras,
      final List<OrderPaymentWithMethod>? payments})
      : _items = items,
        _extras = extras,
        _payments = payments,
        super._();

  factory _$PosOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$PosOrderImplFromJson(json);

  @override
  final Order order;
  @override
  @JsonKey()
  final bool? payLater;
  final List<OrderItem>? _items;
  @override
  List<OrderItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<OrderExtra>? _extras;
  @override
  List<OrderExtra>? get extras {
    final value = _extras;
    if (value == null) return null;
    if (_extras is EqualUnmodifiableListView) return _extras;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<OrderPaymentWithMethod>? _payments;
  @override
  List<OrderPaymentWithMethod>? get payments {
    final value = _payments;
    if (value == null) return null;
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PosOrder(order: $order, payLater: $payLater, items: $items, extras: $extras, payments: $payments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosOrderImpl &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.payLater, payLater) ||
                other.payLater == payLater) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other._extras, _extras) &&
            const DeepCollectionEquality().equals(other._payments, _payments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      order,
      payLater,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_extras),
      const DeepCollectionEquality().hash(_payments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PosOrderImplCopyWith<_$PosOrderImpl> get copyWith =>
      __$$PosOrderImplCopyWithImpl<_$PosOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PosOrderImplToJson(
      this,
    );
  }
}

abstract class _PosOrder extends PosOrder {
  const factory _PosOrder(
      {required final Order order,
      final bool? payLater,
      final List<OrderItem>? items,
      final List<OrderExtra>? extras,
      final List<OrderPaymentWithMethod>? payments}) = _$PosOrderImpl;
  const _PosOrder._() : super._();

  factory _PosOrder.fromJson(Map<String, dynamic> json) =
      _$PosOrderImpl.fromJson;

  @override
  Order get order;
  @override
  bool? get payLater;
  @override
  List<OrderItem>? get items;
  @override
  List<OrderExtra>? get extras;
  @override
  List<OrderPaymentWithMethod>? get payments;
  @override
  @JsonKey(ignore: true)
  _$$PosOrderImplCopyWith<_$PosOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
