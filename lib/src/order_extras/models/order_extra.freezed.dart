// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_extra.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderExtra {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_type')
  String get amountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'calculated_amount')
  double get calculatedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'extra_id')
  int? get extraId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  int get orderId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderExtraCopyWith<OrderExtra> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderExtraCopyWith<$Res> {
  factory $OrderExtraCopyWith(
          OrderExtra value, $Res Function(OrderExtra) then) =
      _$OrderExtraCopyWithImpl<$Res, OrderExtra>;
  @useResult
  $Res call(
      {int id,
      String name,
      String type,
      String? description,
      double amount,
      @JsonKey(name: 'amount_type') String amountType,
      @JsonKey(name: 'calculated_amount') double calculatedAmount,
      @JsonKey(name: 'extra_id') int? extraId,
      @JsonKey(name: 'order_id') int orderId});
}

/// @nodoc
class _$OrderExtraCopyWithImpl<$Res, $Val extends OrderExtra>
    implements $OrderExtraCopyWith<$Res> {
  _$OrderExtraCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? description = freezed,
    Object? amount = null,
    Object? amountType = null,
    Object? calculatedAmount = null,
    Object? extraId = freezed,
    Object? orderId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      amountType: null == amountType
          ? _value.amountType
          : amountType // ignore: cast_nullable_to_non_nullable
              as String,
      calculatedAmount: null == calculatedAmount
          ? _value.calculatedAmount
          : calculatedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      extraId: freezed == extraId
          ? _value.extraId
          : extraId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderExtraImplCopyWith<$Res>
    implements $OrderExtraCopyWith<$Res> {
  factory _$$OrderExtraImplCopyWith(
          _$OrderExtraImpl value, $Res Function(_$OrderExtraImpl) then) =
      __$$OrderExtraImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String type,
      String? description,
      double amount,
      @JsonKey(name: 'amount_type') String amountType,
      @JsonKey(name: 'calculated_amount') double calculatedAmount,
      @JsonKey(name: 'extra_id') int? extraId,
      @JsonKey(name: 'order_id') int orderId});
}

/// @nodoc
class __$$OrderExtraImplCopyWithImpl<$Res>
    extends _$OrderExtraCopyWithImpl<$Res, _$OrderExtraImpl>
    implements _$$OrderExtraImplCopyWith<$Res> {
  __$$OrderExtraImplCopyWithImpl(
      _$OrderExtraImpl _value, $Res Function(_$OrderExtraImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? description = freezed,
    Object? amount = null,
    Object? amountType = null,
    Object? calculatedAmount = null,
    Object? extraId = freezed,
    Object? orderId = null,
  }) {
    return _then(_$OrderExtraImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      amountType: null == amountType
          ? _value.amountType
          : amountType // ignore: cast_nullable_to_non_nullable
              as String,
      calculatedAmount: null == calculatedAmount
          ? _value.calculatedAmount
          : calculatedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      extraId: freezed == extraId
          ? _value.extraId
          : extraId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OrderExtraImpl implements _OrderExtra {
  const _$OrderExtraImpl(
      {required this.id,
      required this.name,
      required this.type,
      this.description,
      required this.amount,
      @JsonKey(name: 'amount_type') required this.amountType,
      @JsonKey(name: 'calculated_amount') required this.calculatedAmount,
      @JsonKey(name: 'extra_id') this.extraId,
      @JsonKey(name: 'order_id') required this.orderId});

  @override
  final int id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String? description;
  @override
  final double amount;
  @override
  @JsonKey(name: 'amount_type')
  final String amountType;
  @override
  @JsonKey(name: 'calculated_amount')
  final double calculatedAmount;
  @override
  @JsonKey(name: 'extra_id')
  final int? extraId;
  @override
  @JsonKey(name: 'order_id')
  final int orderId;

  @override
  String toString() {
    return 'OrderExtra(id: $id, name: $name, type: $type, description: $description, amount: $amount, amountType: $amountType, calculatedAmount: $calculatedAmount, extraId: $extraId, orderId: $orderId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderExtraImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.amountType, amountType) ||
                other.amountType == amountType) &&
            (identical(other.calculatedAmount, calculatedAmount) ||
                other.calculatedAmount == calculatedAmount) &&
            (identical(other.extraId, extraId) || other.extraId == extraId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, description,
      amount, amountType, calculatedAmount, extraId, orderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderExtraImplCopyWith<_$OrderExtraImpl> get copyWith =>
      __$$OrderExtraImplCopyWithImpl<_$OrderExtraImpl>(this, _$identity);
}

abstract class _OrderExtra implements OrderExtra {
  const factory _OrderExtra(
          {required final int id,
          required final String name,
          required final String type,
          final String? description,
          required final double amount,
          @JsonKey(name: 'amount_type') required final String amountType,
          @JsonKey(name: 'calculated_amount')
          required final double calculatedAmount,
          @JsonKey(name: 'extra_id') final int? extraId,
          @JsonKey(name: 'order_id') required final int orderId}) =
      _$OrderExtraImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get type;
  @override
  String? get description;
  @override
  double get amount;
  @override
  @JsonKey(name: 'amount_type')
  String get amountType;
  @override
  @JsonKey(name: 'calculated_amount')
  double get calculatedAmount;
  @override
  @JsonKey(name: 'extra_id')
  int? get extraId;
  @override
  @JsonKey(name: 'order_id')
  int get orderId;
  @override
  @JsonKey(ignore: true)
  _$$OrderExtraImplCopyWith<_$OrderExtraImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
