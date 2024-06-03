// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_with_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductWithCategory {
  Product? get product => throw _privateConstructorUsedError;
  ProductCategory? get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductWithCategoryCopyWith<ProductWithCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductWithCategoryCopyWith<$Res> {
  factory $ProductWithCategoryCopyWith(
          ProductWithCategory value, $Res Function(ProductWithCategory) then) =
      _$ProductWithCategoryCopyWithImpl<$Res, ProductWithCategory>;
  @useResult
  $Res call({Product? product, ProductCategory? category});

  $ProductCopyWith<$Res>? get product;
  $ProductCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$ProductWithCategoryCopyWithImpl<$Res, $Val extends ProductWithCategory>
    implements $ProductWithCategoryCopyWith<$Res> {
  _$ProductWithCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $ProductCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductWithCategoryImplCopyWith<$Res>
    implements $ProductWithCategoryCopyWith<$Res> {
  factory _$$ProductWithCategoryImplCopyWith(_$ProductWithCategoryImpl value,
          $Res Function(_$ProductWithCategoryImpl) then) =
      __$$ProductWithCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Product? product, ProductCategory? category});

  @override
  $ProductCopyWith<$Res>? get product;
  @override
  $ProductCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$ProductWithCategoryImplCopyWithImpl<$Res>
    extends _$ProductWithCategoryCopyWithImpl<$Res, _$ProductWithCategoryImpl>
    implements _$$ProductWithCategoryImplCopyWith<$Res> {
  __$$ProductWithCategoryImplCopyWithImpl(_$ProductWithCategoryImpl _value,
      $Res Function(_$ProductWithCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? category = freezed,
  }) {
    return _then(_$ProductWithCategoryImpl(
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
    ));
  }
}

/// @nodoc

class _$ProductWithCategoryImpl implements _ProductWithCategory {
  const _$ProductWithCategoryImpl(
      {required this.product, required this.category});

  @override
  final Product? product;
  @override
  final ProductCategory? category;

  @override
  String toString() {
    return 'ProductWithCategory(product: $product, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductWithCategoryImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductWithCategoryImplCopyWith<_$ProductWithCategoryImpl> get copyWith =>
      __$$ProductWithCategoryImplCopyWithImpl<_$ProductWithCategoryImpl>(
          this, _$identity);
}

abstract class _ProductWithCategory implements ProductWithCategory {
  const factory _ProductWithCategory(
      {required final Product? product,
      required final ProductCategory? category}) = _$ProductWithCategoryImpl;

  @override
  Product? get product;
  @override
  ProductCategory? get category;
  @override
  @JsonKey(ignore: true)
  _$$ProductWithCategoryImplCopyWith<_$ProductWithCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
