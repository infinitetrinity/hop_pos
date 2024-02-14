// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_discount_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderDiscountForm _$OrderDiscountFormFromJson(Map<String, dynamic> json) {
  return _OrderDiscountForm.fromJson(json);
}

/// @nodoc
mixin _$OrderDiscountForm {
  double? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_type')
  DiscountType? get discountType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDiscountFormCopyWith<OrderDiscountForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDiscountFormCopyWith<$Res> {
  factory $OrderDiscountFormCopyWith(
          OrderDiscountForm value, $Res Function(OrderDiscountForm) then) =
      _$OrderDiscountFormCopyWithImpl<$Res, OrderDiscountForm>;
  @useResult
  $Res call(
      {double? discount,
      @JsonKey(name: 'discount_type') DiscountType? discountType});
}

/// @nodoc
class _$OrderDiscountFormCopyWithImpl<$Res, $Val extends OrderDiscountForm>
    implements $OrderDiscountFormCopyWith<$Res> {
  _$OrderDiscountFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discount = freezed,
    Object? discountType = freezed,
  }) {
    return _then(_value.copyWith(
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as DiscountType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderDiscountFormImplCopyWith<$Res>
    implements $OrderDiscountFormCopyWith<$Res> {
  factory _$$OrderDiscountFormImplCopyWith(_$OrderDiscountFormImpl value,
          $Res Function(_$OrderDiscountFormImpl) then) =
      __$$OrderDiscountFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? discount,
      @JsonKey(name: 'discount_type') DiscountType? discountType});
}

/// @nodoc
class __$$OrderDiscountFormImplCopyWithImpl<$Res>
    extends _$OrderDiscountFormCopyWithImpl<$Res, _$OrderDiscountFormImpl>
    implements _$$OrderDiscountFormImplCopyWith<$Res> {
  __$$OrderDiscountFormImplCopyWithImpl(_$OrderDiscountFormImpl _value,
      $Res Function(_$OrderDiscountFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discount = freezed,
    Object? discountType = freezed,
  }) {
    return _then(_$OrderDiscountFormImpl(
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as DiscountType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDiscountFormImpl extends _OrderDiscountForm {
  const _$OrderDiscountFormImpl(
      {this.discount, @JsonKey(name: 'discount_type') this.discountType})
      : super._();

  factory _$OrderDiscountFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDiscountFormImplFromJson(json);

  @override
  final double? discount;
  @override
  @JsonKey(name: 'discount_type')
  final DiscountType? discountType;

  @override
  String toString() {
    return 'OrderDiscountForm(discount: $discount, discountType: $discountType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDiscountFormImpl &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, discount, discountType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDiscountFormImplCopyWith<_$OrderDiscountFormImpl> get copyWith =>
      __$$OrderDiscountFormImplCopyWithImpl<_$OrderDiscountFormImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDiscountFormImplToJson(
      this,
    );
  }
}

abstract class _OrderDiscountForm extends OrderDiscountForm {
  const factory _OrderDiscountForm(
          {final double? discount,
          @JsonKey(name: 'discount_type') final DiscountType? discountType}) =
      _$OrderDiscountFormImpl;
  const _OrderDiscountForm._() : super._();

  factory _OrderDiscountForm.fromJson(Map<String, dynamic> json) =
      _$OrderDiscountFormImpl.fromJson;

  @override
  double? get discount;
  @override
  @JsonKey(name: 'discount_type')
  DiscountType? get discountType;
  @override
  @JsonKey(ignore: true)
  _$$OrderDiscountFormImplCopyWith<_$OrderDiscountFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
