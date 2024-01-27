// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_order_extra.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewOrderExtra _$NewOrderExtraFromJson(Map<String, dynamic> json) {
  return _NewOrderExtra.fromJson(json);
}

/// @nodoc
mixin _$NewOrderExtra {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @DoubleFromStringConverter()
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_type')
  String get amountType => throw _privateConstructorUsedError;
  @DoubleFromStringConverter()
  @JsonKey(name: 'calculated_amount')
  double? get calculatedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'extra_id')
  int? get extraId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  int get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_is_new')
  bool get orderIsNew => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewOrderExtraCopyWith<NewOrderExtra> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewOrderExtraCopyWith<$Res> {
  factory $NewOrderExtraCopyWith(
          NewOrderExtra value, $Res Function(NewOrderExtra) then) =
      _$NewOrderExtraCopyWithImpl<$Res, NewOrderExtra>;
  @useResult
  $Res call(
      {int id,
      String name,
      String type,
      String? description,
      @DoubleFromStringConverter() double? amount,
      @JsonKey(name: 'amount_type') String amountType,
      @DoubleFromStringConverter()
      @JsonKey(name: 'calculated_amount')
      double? calculatedAmount,
      @JsonKey(name: 'extra_id') int? extraId,
      @JsonKey(name: 'order_id') int orderId,
      @JsonKey(name: 'order_is_new') bool orderIsNew,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$NewOrderExtraCopyWithImpl<$Res, $Val extends NewOrderExtra>
    implements $NewOrderExtraCopyWith<$Res> {
  _$NewOrderExtraCopyWithImpl(this._value, this._then);

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
    Object? amount = freezed,
    Object? amountType = null,
    Object? calculatedAmount = freezed,
    Object? extraId = freezed,
    Object? orderId = null,
    Object? orderIsNew = null,
    Object? createdAt = null,
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
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      amountType: null == amountType
          ? _value.amountType
          : amountType // ignore: cast_nullable_to_non_nullable
              as String,
      calculatedAmount: freezed == calculatedAmount
          ? _value.calculatedAmount
          : calculatedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      extraId: freezed == extraId
          ? _value.extraId
          : extraId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$NewOrderExtraImplCopyWith<$Res>
    implements $NewOrderExtraCopyWith<$Res> {
  factory _$$NewOrderExtraImplCopyWith(
          _$NewOrderExtraImpl value, $Res Function(_$NewOrderExtraImpl) then) =
      __$$NewOrderExtraImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String type,
      String? description,
      @DoubleFromStringConverter() double? amount,
      @JsonKey(name: 'amount_type') String amountType,
      @DoubleFromStringConverter()
      @JsonKey(name: 'calculated_amount')
      double? calculatedAmount,
      @JsonKey(name: 'extra_id') int? extraId,
      @JsonKey(name: 'order_id') int orderId,
      @JsonKey(name: 'order_is_new') bool orderIsNew,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$NewOrderExtraImplCopyWithImpl<$Res>
    extends _$NewOrderExtraCopyWithImpl<$Res, _$NewOrderExtraImpl>
    implements _$$NewOrderExtraImplCopyWith<$Res> {
  __$$NewOrderExtraImplCopyWithImpl(
      _$NewOrderExtraImpl _value, $Res Function(_$NewOrderExtraImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? description = freezed,
    Object? amount = freezed,
    Object? amountType = null,
    Object? calculatedAmount = freezed,
    Object? extraId = freezed,
    Object? orderId = null,
    Object? orderIsNew = null,
    Object? createdAt = null,
  }) {
    return _then(_$NewOrderExtraImpl(
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
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      amountType: null == amountType
          ? _value.amountType
          : amountType // ignore: cast_nullable_to_non_nullable
              as String,
      calculatedAmount: freezed == calculatedAmount
          ? _value.calculatedAmount
          : calculatedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      extraId: freezed == extraId
          ? _value.extraId
          : extraId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$NewOrderExtraImpl implements _NewOrderExtra {
  const _$NewOrderExtraImpl(
      {required this.id,
      required this.name,
      required this.type,
      this.description,
      @DoubleFromStringConverter() this.amount,
      @JsonKey(name: 'amount_type') required this.amountType,
      @DoubleFromStringConverter()
      @JsonKey(name: 'calculated_amount')
      this.calculatedAmount,
      @JsonKey(name: 'extra_id') this.extraId,
      @JsonKey(name: 'order_id') required this.orderId,
      @JsonKey(name: 'order_is_new') required this.orderIsNew,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$NewOrderExtraImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewOrderExtraImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String? description;
  @override
  @DoubleFromStringConverter()
  final double? amount;
  @override
  @JsonKey(name: 'amount_type')
  final String amountType;
  @override
  @DoubleFromStringConverter()
  @JsonKey(name: 'calculated_amount')
  final double? calculatedAmount;
  @override
  @JsonKey(name: 'extra_id')
  final int? extraId;
  @override
  @JsonKey(name: 'order_id')
  final int orderId;
  @override
  @JsonKey(name: 'order_is_new')
  final bool orderIsNew;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'NewOrderExtra(id: $id, name: $name, type: $type, description: $description, amount: $amount, amountType: $amountType, calculatedAmount: $calculatedAmount, extraId: $extraId, orderId: $orderId, orderIsNew: $orderIsNew, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewOrderExtraImpl &&
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
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderIsNew, orderIsNew) ||
                other.orderIsNew == orderIsNew) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      description,
      amount,
      amountType,
      calculatedAmount,
      extraId,
      orderId,
      orderIsNew,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewOrderExtraImplCopyWith<_$NewOrderExtraImpl> get copyWith =>
      __$$NewOrderExtraImplCopyWithImpl<_$NewOrderExtraImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewOrderExtraImplToJson(
      this,
    );
  }
}

abstract class _NewOrderExtra implements NewOrderExtra {
  const factory _NewOrderExtra(
          {required final int id,
          required final String name,
          required final String type,
          final String? description,
          @DoubleFromStringConverter() final double? amount,
          @JsonKey(name: 'amount_type') required final String amountType,
          @DoubleFromStringConverter()
          @JsonKey(name: 'calculated_amount')
          final double? calculatedAmount,
          @JsonKey(name: 'extra_id') final int? extraId,
          @JsonKey(name: 'order_id') required final int orderId,
          @JsonKey(name: 'order_is_new') required final bool orderIsNew,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$NewOrderExtraImpl;

  factory _NewOrderExtra.fromJson(Map<String, dynamic> json) =
      _$NewOrderExtraImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get type;
  @override
  String? get description;
  @override
  @DoubleFromStringConverter()
  double? get amount;
  @override
  @JsonKey(name: 'amount_type')
  String get amountType;
  @override
  @DoubleFromStringConverter()
  @JsonKey(name: 'calculated_amount')
  double? get calculatedAmount;
  @override
  @JsonKey(name: 'extra_id')
  int? get extraId;
  @override
  @JsonKey(name: 'order_id')
  int get orderId;
  @override
  @JsonKey(name: 'order_is_new')
  bool get orderIsNew;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$NewOrderExtraImplCopyWith<_$NewOrderExtraImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
