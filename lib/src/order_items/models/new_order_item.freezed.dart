// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewOrderItem _$NewOrderItemFromJson(Map<String, dynamic> json) {
  return _NewOrderItem.fromJson(json);
}

/// @nodoc
mixin _$NewOrderItem {
  int get id => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'is_custom')
  bool get isCustom => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_is_new')
  bool get orderIsNew => throw _privateConstructorUsedError;
  @JsonKey(name: 'cart_id')
  int? get cartId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  int get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewOrderItemCopyWith<NewOrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewOrderItemCopyWith<$Res> {
  factory $NewOrderItemCopyWith(
          NewOrderItem value, $Res Function(NewOrderItem) then) =
      _$NewOrderItemCopyWithImpl<$Res, NewOrderItem>;
  @useResult
  $Res call(
      {int id,
      String name,
      String sku,
      String? description,
      @DoubleFromStringConverter() double? price,
      @DoubleFromStringConverter() double? discount,
      @JsonKey(name: 'discount_type') String? discountType,
      @DoubleFromStringConverter() @JsonKey(name: 'net_price') double? netPrice,
      @JsonKey(name: 'is_custom') bool isCustom,
      @JsonKey(name: 'order_is_new') bool orderIsNew,
      @JsonKey(name: 'cart_id') int? cartId,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'order_id') int orderId,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$NewOrderItemCopyWithImpl<$Res, $Val extends NewOrderItem>
    implements $NewOrderItemCopyWith<$Res> {
  _$NewOrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sku = null,
    Object? description = freezed,
    Object? price = freezed,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? netPrice = freezed,
    Object? isCustom = null,
    Object? orderIsNew = null,
    Object? cartId = freezed,
    Object? productId = freezed,
    Object? orderId = null,
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
      isCustom: null == isCustom
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as bool,
      orderIsNew: null == orderIsNew
          ? _value.orderIsNew
          : orderIsNew // ignore: cast_nullable_to_non_nullable
              as bool,
      cartId: freezed == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewOrderItemImplCopyWith<$Res>
    implements $NewOrderItemCopyWith<$Res> {
  factory _$$NewOrderItemImplCopyWith(
          _$NewOrderItemImpl value, $Res Function(_$NewOrderItemImpl) then) =
      __$$NewOrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String sku,
      String? description,
      @DoubleFromStringConverter() double? price,
      @DoubleFromStringConverter() double? discount,
      @JsonKey(name: 'discount_type') String? discountType,
      @DoubleFromStringConverter() @JsonKey(name: 'net_price') double? netPrice,
      @JsonKey(name: 'is_custom') bool isCustom,
      @JsonKey(name: 'order_is_new') bool orderIsNew,
      @JsonKey(name: 'cart_id') int? cartId,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'order_id') int orderId,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$NewOrderItemImplCopyWithImpl<$Res>
    extends _$NewOrderItemCopyWithImpl<$Res, _$NewOrderItemImpl>
    implements _$$NewOrderItemImplCopyWith<$Res> {
  __$$NewOrderItemImplCopyWithImpl(
      _$NewOrderItemImpl _value, $Res Function(_$NewOrderItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sku = null,
    Object? description = freezed,
    Object? price = freezed,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? netPrice = freezed,
    Object? isCustom = null,
    Object? orderIsNew = null,
    Object? cartId = freezed,
    Object? productId = freezed,
    Object? orderId = null,
    Object? createdAt = null,
  }) {
    return _then(_$NewOrderItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      isCustom: null == isCustom
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as bool,
      orderIsNew: null == orderIsNew
          ? _value.orderIsNew
          : orderIsNew // ignore: cast_nullable_to_non_nullable
              as bool,
      cartId: freezed == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewOrderItemImpl implements _NewOrderItem {
  const _$NewOrderItemImpl(
      {required this.id,
      required this.name,
      required this.sku,
      this.description,
      @DoubleFromStringConverter() this.price,
      @DoubleFromStringConverter() this.discount,
      @JsonKey(name: 'discount_type') this.discountType,
      @DoubleFromStringConverter() @JsonKey(name: 'net_price') this.netPrice,
      @JsonKey(name: 'is_custom') required this.isCustom,
      @JsonKey(name: 'order_is_new') required this.orderIsNew,
      @JsonKey(name: 'cart_id') this.cartId,
      @JsonKey(name: 'product_id') this.productId,
      @JsonKey(name: 'order_id') required this.orderId,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$NewOrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewOrderItemImplFromJson(json);

  @override
  final int id;
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
  @JsonKey(name: 'is_custom')
  final bool isCustom;
  @override
  @JsonKey(name: 'order_is_new')
  final bool orderIsNew;
  @override
  @JsonKey(name: 'cart_id')
  final int? cartId;
  @override
  @JsonKey(name: 'product_id')
  final int? productId;
  @override
  @JsonKey(name: 'order_id')
  final int orderId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'NewOrderItem(id: $id, name: $name, sku: $sku, description: $description, price: $price, discount: $discount, discountType: $discountType, netPrice: $netPrice, isCustom: $isCustom, orderIsNew: $orderIsNew, cartId: $cartId, productId: $productId, orderId: $orderId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewOrderItemImpl &&
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
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewOrderItemImplCopyWith<_$NewOrderItemImpl> get copyWith =>
      __$$NewOrderItemImplCopyWithImpl<_$NewOrderItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewOrderItemImplToJson(
      this,
    );
  }
}

abstract class _NewOrderItem implements NewOrderItem {
  const factory _NewOrderItem(
          {required final int id,
          required final String name,
          required final String sku,
          final String? description,
          @DoubleFromStringConverter() final double? price,
          @DoubleFromStringConverter() final double? discount,
          @JsonKey(name: 'discount_type') final String? discountType,
          @DoubleFromStringConverter()
          @JsonKey(name: 'net_price')
          final double? netPrice,
          @JsonKey(name: 'is_custom') required final bool isCustom,
          @JsonKey(name: 'order_is_new') required final bool orderIsNew,
          @JsonKey(name: 'cart_id') final int? cartId,
          @JsonKey(name: 'product_id') final int? productId,
          @JsonKey(name: 'order_id') required final int orderId,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$NewOrderItemImpl;

  factory _NewOrderItem.fromJson(Map<String, dynamic> json) =
      _$NewOrderItemImpl.fromJson;

  @override
  int get id;
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
  @JsonKey(name: 'is_custom')
  bool get isCustom;
  @override
  @JsonKey(name: 'order_is_new')
  bool get orderIsNew;
  @override
  @JsonKey(name: 'cart_id')
  int? get cartId;
  @override
  @JsonKey(name: 'product_id')
  int? get productId;
  @override
  @JsonKey(name: 'order_id')
  int get orderId;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$NewOrderItemImplCopyWith<_$NewOrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
