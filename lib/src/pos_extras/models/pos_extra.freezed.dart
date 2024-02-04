// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_extra.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PosExtra _$PosExtraFromJson(Map<String, dynamic> json) {
  return _PosExtra.fromJson(json);
}

/// @nodoc
mixin _$PosExtra {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  ExtraType get type => throw _privateConstructorUsedError;
  @DoubleFromStringConverter()
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_type')
  ExtraAmountType get amountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PosExtraCopyWith<PosExtra> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosExtraCopyWith<$Res> {
  factory $PosExtraCopyWith(PosExtra value, $Res Function(PosExtra) then) =
      _$PosExtraCopyWithImpl<$Res, PosExtra>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      ExtraType type,
      @DoubleFromStringConverter() double? amount,
      @JsonKey(name: 'amount_type') ExtraAmountType amountType,
      @JsonKey(name: 'is_active') bool isActive});
}

/// @nodoc
class _$PosExtraCopyWithImpl<$Res, $Val extends PosExtra>
    implements $PosExtraCopyWith<$Res> {
  _$PosExtraCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? type = null,
    Object? amount = freezed,
    Object? amountType = null,
    Object? isActive = null,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ExtraType,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      amountType: null == amountType
          ? _value.amountType
          : amountType // ignore: cast_nullable_to_non_nullable
              as ExtraAmountType,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PosExtraImplCopyWith<$Res>
    implements $PosExtraCopyWith<$Res> {
  factory _$$PosExtraImplCopyWith(
          _$PosExtraImpl value, $Res Function(_$PosExtraImpl) then) =
      __$$PosExtraImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      ExtraType type,
      @DoubleFromStringConverter() double? amount,
      @JsonKey(name: 'amount_type') ExtraAmountType amountType,
      @JsonKey(name: 'is_active') bool isActive});
}

/// @nodoc
class __$$PosExtraImplCopyWithImpl<$Res>
    extends _$PosExtraCopyWithImpl<$Res, _$PosExtraImpl>
    implements _$$PosExtraImplCopyWith<$Res> {
  __$$PosExtraImplCopyWithImpl(
      _$PosExtraImpl _value, $Res Function(_$PosExtraImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? type = null,
    Object? amount = freezed,
    Object? amountType = null,
    Object? isActive = null,
  }) {
    return _then(_$PosExtraImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ExtraType,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      amountType: null == amountType
          ? _value.amountType
          : amountType // ignore: cast_nullable_to_non_nullable
              as ExtraAmountType,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PosExtraImpl extends _PosExtra {
  const _$PosExtraImpl(
      {required this.id,
      required this.name,
      this.description,
      required this.type,
      @DoubleFromStringConverter() this.amount,
      @JsonKey(name: 'amount_type') required this.amountType,
      @JsonKey(name: 'is_active') required this.isActive})
      : super._();

  factory _$PosExtraImpl.fromJson(Map<String, dynamic> json) =>
      _$$PosExtraImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final ExtraType type;
  @override
  @DoubleFromStringConverter()
  final double? amount;
  @override
  @JsonKey(name: 'amount_type')
  final ExtraAmountType amountType;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;

  @override
  String toString() {
    return 'PosExtra(id: $id, name: $name, description: $description, type: $type, amount: $amount, amountType: $amountType, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosExtraImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.amountType, amountType) ||
                other.amountType == amountType) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, type, amount, amountType, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PosExtraImplCopyWith<_$PosExtraImpl> get copyWith =>
      __$$PosExtraImplCopyWithImpl<_$PosExtraImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PosExtraImplToJson(
      this,
    );
  }
}

abstract class _PosExtra extends PosExtra {
  const factory _PosExtra(
      {required final int id,
      required final String name,
      final String? description,
      required final ExtraType type,
      @DoubleFromStringConverter() final double? amount,
      @JsonKey(name: 'amount_type') required final ExtraAmountType amountType,
      @JsonKey(name: 'is_active')
      required final bool isActive}) = _$PosExtraImpl;
  const _PosExtra._() : super._();

  factory _PosExtra.fromJson(Map<String, dynamic> json) =
      _$PosExtraImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  ExtraType get type;
  @override
  @DoubleFromStringConverter()
  double? get amount;
  @override
  @JsonKey(name: 'amount_type')
  ExtraAmountType get amountType;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$PosExtraImplCopyWith<_$PosExtraImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
