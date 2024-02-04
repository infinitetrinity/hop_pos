// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductForm _$ProductFormFromJson(Map<String, dynamic> json) {
  return _ProductForm.fromJson(json);
}

/// @nodoc
mixin _$ProductForm {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get sku => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  DiscountType? get discountType => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_new')
  bool get isNew => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductFormCopyWith<ProductForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFormCopyWith<$Res> {
  factory $ProductFormCopyWith(
          ProductForm value, $Res Function(ProductForm) then) =
      _$ProductFormCopyWithImpl<$Res, ProductForm>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? sku,
      double? price,
      double? discount,
      DiscountType? discountType,
      String? description,
      @JsonKey(name: 'is_new') bool isNew});
}

/// @nodoc
class _$ProductFormCopyWithImpl<$Res, $Val extends ProductForm>
    implements $ProductFormCopyWith<$Res> {
  _$ProductFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? sku = freezed,
    Object? price = freezed,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? description = freezed,
    Object? isNew = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as DiscountType?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductFormImplCopyWith<$Res>
    implements $ProductFormCopyWith<$Res> {
  factory _$$ProductFormImplCopyWith(
          _$ProductFormImpl value, $Res Function(_$ProductFormImpl) then) =
      __$$ProductFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? sku,
      double? price,
      double? discount,
      DiscountType? discountType,
      String? description,
      @JsonKey(name: 'is_new') bool isNew});
}

/// @nodoc
class __$$ProductFormImplCopyWithImpl<$Res>
    extends _$ProductFormCopyWithImpl<$Res, _$ProductFormImpl>
    implements _$$ProductFormImplCopyWith<$Res> {
  __$$ProductFormImplCopyWithImpl(
      _$ProductFormImpl _value, $Res Function(_$ProductFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? sku = freezed,
    Object? price = freezed,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? description = freezed,
    Object? isNew = null,
  }) {
    return _then(_$ProductFormImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as DiscountType?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductFormImpl extends _ProductForm {
  const _$ProductFormImpl(
      {this.id,
      this.name,
      this.sku,
      this.price,
      this.discount,
      this.discountType,
      this.description,
      @JsonKey(name: 'is_new') this.isNew = false})
      : super._();

  factory _$ProductFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductFormImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? sku;
  @override
  final double? price;
  @override
  final double? discount;
  @override
  final DiscountType? discountType;
  @override
  final String? description;
  @override
  @JsonKey(name: 'is_new')
  final bool isNew;

  @override
  String toString() {
    return 'ProductForm(id: $id, name: $name, sku: $sku, price: $price, discount: $discount, discountType: $discountType, description: $description, isNew: $isNew)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductFormImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isNew, isNew) || other.isNew == isNew));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, sku, price, discount,
      discountType, description, isNew);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductFormImplCopyWith<_$ProductFormImpl> get copyWith =>
      __$$ProductFormImplCopyWithImpl<_$ProductFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductFormImplToJson(
      this,
    );
  }
}

abstract class _ProductForm extends ProductForm {
  const factory _ProductForm(
      {final int? id,
      final String? name,
      final String? sku,
      final double? price,
      final double? discount,
      final DiscountType? discountType,
      final String? description,
      @JsonKey(name: 'is_new') final bool isNew}) = _$ProductFormImpl;
  const _ProductForm._() : super._();

  factory _ProductForm.fromJson(Map<String, dynamic> json) =
      _$ProductFormImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get sku;
  @override
  double? get price;
  @override
  double? get discount;
  @override
  DiscountType? get discountType;
  @override
  String? get description;
  @override
  @JsonKey(name: 'is_new')
  bool get isNew;
  @override
  @JsonKey(ignore: true)
  _$$ProductFormImplCopyWith<_$ProductFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
