// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
mixin _$OrderItem {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @DoubleFromStringConverter()
  double? get price => throw _privateConstructorUsedError;
  @DoubleFromStringConverter()
  double? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_type')
  String? get discountType => throw _privateConstructorUsedError;
  @DoubleFromStringConverter()
  @JsonKey(name: 'net_price')
  double? get netPrice => throw _privateConstructorUsedError;
  @BoolFromIntConverter()
  @JsonKey(name: 'is_custom')
  bool? get isCustom => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res, OrderItem>;
  @useResult
  $Res call(
      {int? id,
      String name,
      String sku,
      String? description,
      @DoubleFromStringConverter() double? price,
      @DoubleFromStringConverter() double? discount,
      @JsonKey(name: 'discount_type') String? discountType,
      @DoubleFromStringConverter() @JsonKey(name: 'net_price') double? netPrice,
      @BoolFromIntConverter() @JsonKey(name: 'is_custom') bool? isCustom,
      @JsonKey(name: 'order_is_new') bool? orderIsNew,
      @JsonKey(name: 'cart_id') int? cartId,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'is_new') bool? isNew,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res, $Val extends OrderItem>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? sku = null,
    Object? description = freezed,
    Object? price = freezed,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? netPrice = freezed,
    Object? isCustom = freezed,
    Object? orderIsNew = freezed,
    Object? cartId = freezed,
    Object? productId = freezed,
    Object? orderId = freezed,
    Object? isNew = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
              as String?,
      netPrice: freezed == netPrice
          ? _value.netPrice
          : netPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      isCustom: freezed == isCustom
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemImplCopyWith<$Res>
    implements $OrderItemCopyWith<$Res> {
  factory _$$OrderItemImplCopyWith(
          _$OrderItemImpl value, $Res Function(_$OrderItemImpl) then) =
      __$$OrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      String sku,
      String? description,
      @DoubleFromStringConverter() double? price,
      @DoubleFromStringConverter() double? discount,
      @JsonKey(name: 'discount_type') String? discountType,
      @DoubleFromStringConverter() @JsonKey(name: 'net_price') double? netPrice,
      @BoolFromIntConverter() @JsonKey(name: 'is_custom') bool? isCustom,
      @JsonKey(name: 'order_is_new') bool? orderIsNew,
      @JsonKey(name: 'cart_id') int? cartId,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'is_new') bool? isNew,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$OrderItemImplCopyWithImpl<$Res>
    extends _$OrderItemCopyWithImpl<$Res, _$OrderItemImpl>
    implements _$$OrderItemImplCopyWith<$Res> {
  __$$OrderItemImplCopyWithImpl(
      _$OrderItemImpl _value, $Res Function(_$OrderItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? sku = null,
    Object? description = freezed,
    Object? price = freezed,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? netPrice = freezed,
    Object? isCustom = freezed,
    Object? orderIsNew = freezed,
    Object? cartId = freezed,
    Object? productId = freezed,
    Object? orderId = freezed,
    Object? isNew = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$OrderItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
              as String?,
      netPrice: freezed == netPrice
          ? _value.netPrice
          : netPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      isCustom: freezed == isCustom
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemImpl extends _OrderItem {
  const _$OrderItemImpl(
      {this.id,
      required this.name,
      required this.sku,
      this.description,
      @DoubleFromStringConverter() this.price,
      @DoubleFromStringConverter() this.discount,
      @JsonKey(name: 'discount_type') this.discountType,
      @DoubleFromStringConverter() @JsonKey(name: 'net_price') this.netPrice,
      @BoolFromIntConverter() @JsonKey(name: 'is_custom') this.isCustom = false,
      @JsonKey(name: 'order_is_new') this.orderIsNew = false,
      @JsonKey(name: 'cart_id') this.cartId,
      @JsonKey(name: 'product_id') this.productId,
      @JsonKey(name: 'order_id') this.orderId,
      @JsonKey(name: 'is_new') this.isNew = false,
      @JsonKey(name: 'created_at') this.createdAt})
      : super._();

  factory _$OrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final String sku;
  @override
  final String? description;
  @override
  @DoubleFromStringConverter()
  final double? price;
  @override
  @DoubleFromStringConverter()
  final double? discount;
  @override
  @JsonKey(name: 'discount_type')
  final String? discountType;
  @override
  @DoubleFromStringConverter()
  @JsonKey(name: 'net_price')
  final double? netPrice;
  @override
  @BoolFromIntConverter()
  @JsonKey(name: 'is_custom')
  final bool? isCustom;
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
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'OrderItem(id: $id, name: $name, sku: $sku, description: $description, price: $price, discount: $discount, discountType: $discountType, netPrice: $netPrice, isCustom: $isCustom, orderIsNew: $orderIsNew, cartId: $cartId, productId: $productId, orderId: $orderId, isNew: $isNew, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.netPrice, netPrice) ||
                other.netPrice == netPrice) &&
            (identical(other.isCustom, isCustom) ||
                other.isCustom == isCustom) &&
            (identical(other.orderIsNew, orderIsNew) ||
                other.orderIsNew == orderIsNew) &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.isNew, isNew) || other.isNew == isNew) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      sku,
      description,
      price,
      discount,
      discountType,
      netPrice,
      isCustom,
      orderIsNew,
      cartId,
      productId,
      orderId,
      isNew,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      __$$OrderItemImplCopyWithImpl<_$OrderItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemImplToJson(
      this,
    );
  }
}

abstract class _OrderItem extends OrderItem {
  const factory _OrderItem(
      {final int? id,
      required final String name,
      required final String sku,
      final String? description,
      @DoubleFromStringConverter() final double? price,
      @DoubleFromStringConverter() final double? discount,
      @JsonKey(name: 'discount_type') final String? discountType,
      @DoubleFromStringConverter()
      @JsonKey(name: 'net_price')
      final double? netPrice,
      @BoolFromIntConverter() @JsonKey(name: 'is_custom') final bool? isCustom,
      @JsonKey(name: 'order_is_new') final bool? orderIsNew,
      @JsonKey(name: 'cart_id') final int? cartId,
      @JsonKey(name: 'product_id') final int? productId,
      @JsonKey(name: 'order_id') final int? orderId,
      @JsonKey(name: 'is_new') final bool? isNew,
      @JsonKey(name: 'created_at')
      final DateTime? createdAt}) = _$OrderItemImpl;
  const _OrderItem._() : super._();

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$OrderItemImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  String get sku;
  @override
  String? get description;
  @override
  @DoubleFromStringConverter()
  double? get price;
  @override
  @DoubleFromStringConverter()
  double? get discount;
  @override
  @JsonKey(name: 'discount_type')
  String? get discountType;
  @override
  @DoubleFromStringConverter()
  @JsonKey(name: 'net_price')
  double? get netPrice;
  @override
  @BoolFromIntConverter()
  @JsonKey(name: 'is_custom')
  bool? get isCustom;
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
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
