// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderItemForm _$OrderItemFormFromJson(Map<String, dynamic> json) {
  return _OrderItemForm.fromJson(json);
}

/// @nodoc
mixin _$OrderItemForm {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get sku => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_type')
  DiscountType? get discountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_custom')
  bool get isCustom => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_is_new')
  bool? get orderIsNew => throw _privateConstructorUsedError;
  @JsonKey(name: 'cart_id')
  int? get cartId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  int? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_new')
  bool? get isNew => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemFormCopyWith<OrderItemForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemFormCopyWith<$Res> {
  factory $OrderItemFormCopyWith(
          OrderItemForm value, $Res Function(OrderItemForm) then) =
      _$OrderItemFormCopyWithImpl<$Res, OrderItemForm>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? sku,
      double? price,
      String? description,
      double? discount,
      @JsonKey(name: 'discount_type') DiscountType? discountType,
      @JsonKey(name: 'is_custom') bool isCustom,
      @JsonKey(name: 'order_is_new') bool? orderIsNew,
      @JsonKey(name: 'cart_id') int? cartId,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'is_new') bool? isNew});
}

/// @nodoc
class _$OrderItemFormCopyWithImpl<$Res, $Val extends OrderItemForm>
    implements $OrderItemFormCopyWith<$Res> {
  _$OrderItemFormCopyWithImpl(this._value, this._then);

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
    Object? description = freezed,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? isCustom = null,
    Object? orderIsNew = freezed,
    Object? cartId = freezed,
    Object? productId = freezed,
    Object? orderId = freezed,
    Object? isNew = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as DiscountType?,
      isCustom: null == isCustom
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as bool,
      orderIsNew: freezed == orderIsNew
          ? _value.orderIsNew
          : orderIsNew // ignore: cast_nullable_to_non_nullable
              as bool?,
      cartId: freezed == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      isNew: freezed == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemFormImplCopyWith<$Res>
    implements $OrderItemFormCopyWith<$Res> {
  factory _$$OrderItemFormImplCopyWith(
          _$OrderItemFormImpl value, $Res Function(_$OrderItemFormImpl) then) =
      __$$OrderItemFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? sku,
      double? price,
      String? description,
      double? discount,
      @JsonKey(name: 'discount_type') DiscountType? discountType,
      @JsonKey(name: 'is_custom') bool isCustom,
      @JsonKey(name: 'order_is_new') bool? orderIsNew,
      @JsonKey(name: 'cart_id') int? cartId,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'is_new') bool? isNew});
}

/// @nodoc
class __$$OrderItemFormImplCopyWithImpl<$Res>
    extends _$OrderItemFormCopyWithImpl<$Res, _$OrderItemFormImpl>
    implements _$$OrderItemFormImplCopyWith<$Res> {
  __$$OrderItemFormImplCopyWithImpl(
      _$OrderItemFormImpl _value, $Res Function(_$OrderItemFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? sku = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? isCustom = null,
    Object? orderIsNew = freezed,
    Object? cartId = freezed,
    Object? productId = freezed,
    Object? orderId = freezed,
    Object? isNew = freezed,
  }) {
    return _then(_$OrderItemFormImpl(
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as DiscountType?,
      isCustom: null == isCustom
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as bool,
      orderIsNew: freezed == orderIsNew
          ? _value.orderIsNew
          : orderIsNew // ignore: cast_nullable_to_non_nullable
              as bool?,
      cartId: freezed == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      isNew: freezed == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemFormImpl extends _OrderItemForm {
  const _$OrderItemFormImpl(
      {this.id,
      this.name,
      this.sku,
      this.price,
      this.description,
      this.discount,
      @JsonKey(name: 'discount_type')
      this.discountType = DiscountType.percentage,
      @JsonKey(name: 'is_custom') this.isCustom = false,
      @JsonKey(name: 'order_is_new') this.orderIsNew = false,
      @JsonKey(name: 'cart_id') this.cartId,
      @JsonKey(name: 'product_id') this.productId,
      @JsonKey(name: 'order_id') this.orderId,
      @JsonKey(name: 'is_new') this.isNew = false})
      : super._();

  factory _$OrderItemFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemFormImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? sku;
  @override
  final double? price;
  @override
  final String? description;
  @override
  final double? discount;
  @override
  @JsonKey(name: 'discount_type')
  final DiscountType? discountType;
  @override
  @JsonKey(name: 'is_custom')
  final bool isCustom;
  @override
  @JsonKey(name: 'order_is_new')
  final bool? orderIsNew;
  @override
  @JsonKey(name: 'cart_id')
  final int? cartId;
  @override
  @JsonKey(name: 'product_id')
  final int? productId;
  @override
  @JsonKey(name: 'order_id')
  final int? orderId;
  @override
  @JsonKey(name: 'is_new')
  final bool? isNew;

  @override
  String toString() {
    return 'OrderItemForm(id: $id, name: $name, sku: $sku, price: $price, description: $description, discount: $discount, discountType: $discountType, isCustom: $isCustom, orderIsNew: $orderIsNew, cartId: $cartId, productId: $productId, orderId: $orderId, isNew: $isNew)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemFormImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.isCustom, isCustom) ||
                other.isCustom == isCustom) &&
            (identical(other.orderIsNew, orderIsNew) ||
                other.orderIsNew == orderIsNew) &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.isNew, isNew) || other.isNew == isNew));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      sku,
      price,
      description,
      discount,
      discountType,
      isCustom,
      orderIsNew,
      cartId,
      productId,
      orderId,
      isNew);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemFormImplCopyWith<_$OrderItemFormImpl> get copyWith =>
      __$$OrderItemFormImplCopyWithImpl<_$OrderItemFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemFormImplToJson(
      this,
    );
  }
}

abstract class _OrderItemForm extends OrderItemForm {
  const factory _OrderItemForm(
      {final int? id,
      final String? name,
      final String? sku,
      final double? price,
      final String? description,
      final double? discount,
      @JsonKey(name: 'discount_type') final DiscountType? discountType,
      @JsonKey(name: 'is_custom') final bool isCustom,
      @JsonKey(name: 'order_is_new') final bool? orderIsNew,
      @JsonKey(name: 'cart_id') final int? cartId,
      @JsonKey(name: 'product_id') final int? productId,
      @JsonKey(name: 'order_id') final int? orderId,
      @JsonKey(name: 'is_new') final bool? isNew}) = _$OrderItemFormImpl;
  const _OrderItemForm._() : super._();

  factory _OrderItemForm.fromJson(Map<String, dynamic> json) =
      _$OrderItemFormImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get sku;
  @override
  double? get price;
  @override
  String? get description;
  @override
  double? get discount;
  @override
  @JsonKey(name: 'discount_type')
  DiscountType? get discountType;
  @override
  @JsonKey(name: 'is_custom')
  bool get isCustom;
  @override
  @JsonKey(name: 'order_is_new')
  bool? get orderIsNew;
  @override
  @JsonKey(name: 'cart_id')
  int? get cartId;
  @override
  @JsonKey(name: 'product_id')
  int? get productId;
  @override
  @JsonKey(name: 'order_id')
  int? get orderId;
  @override
  @JsonKey(name: 'is_new')
  bool? get isNew;
  @override
  @JsonKey(ignore: true)
  _$$OrderItemFormImplCopyWith<_$OrderItemFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
