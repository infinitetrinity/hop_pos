// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PosCart _$PosCartFromJson(Map<String, dynamic> json) {
  return _PosCart.fromJson(json);
}

/// @nodoc
mixin _$PosCart {
  Screening? get screening => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;
  ScreeningRegistration? get registration => throw _privateConstructorUsedError;
  PosOrder? get order => throw _privateConstructorUsedError;
  double? get checkoutAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PosCartCopyWith<PosCart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosCartCopyWith<$Res> {
  factory $PosCartCopyWith(PosCart value, $Res Function(PosCart) then) =
      _$PosCartCopyWithImpl<$Res, PosCart>;
  @useResult
  $Res call(
      {Screening? screening,
      Customer? customer,
      ScreeningRegistration? registration,
      PosOrder? order,
      double? checkoutAmount});

  $ScreeningCopyWith<$Res>? get screening;
  $CustomerCopyWith<$Res>? get customer;
  $ScreeningRegistrationCopyWith<$Res>? get registration;
  $PosOrderCopyWith<$Res>? get order;
}

/// @nodoc
class _$PosCartCopyWithImpl<$Res, $Val extends PosCart>
    implements $PosCartCopyWith<$Res> {
  _$PosCartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screening = freezed,
    Object? customer = freezed,
    Object? registration = freezed,
    Object? order = freezed,
    Object? checkoutAmount = freezed,
  }) {
    return _then(_value.copyWith(
      screening: freezed == screening
          ? _value.screening
          : screening // ignore: cast_nullable_to_non_nullable
              as Screening?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      registration: freezed == registration
          ? _value.registration
          : registration // ignore: cast_nullable_to_non_nullable
              as ScreeningRegistration?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as PosOrder?,
      checkoutAmount: freezed == checkoutAmount
          ? _value.checkoutAmount
          : checkoutAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScreeningCopyWith<$Res>? get screening {
    if (_value.screening == null) {
      return null;
    }

    return $ScreeningCopyWith<$Res>(_value.screening!, (value) {
      return _then(_value.copyWith(screening: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ScreeningRegistrationCopyWith<$Res>? get registration {
    if (_value.registration == null) {
      return null;
    }

    return $ScreeningRegistrationCopyWith<$Res>(_value.registration!, (value) {
      return _then(_value.copyWith(registration: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PosOrderCopyWith<$Res>? get order {
    if (_value.order == null) {
      return null;
    }

    return $PosOrderCopyWith<$Res>(_value.order!, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PosCartImplCopyWith<$Res> implements $PosCartCopyWith<$Res> {
  factory _$$PosCartImplCopyWith(
          _$PosCartImpl value, $Res Function(_$PosCartImpl) then) =
      __$$PosCartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Screening? screening,
      Customer? customer,
      ScreeningRegistration? registration,
      PosOrder? order,
      double? checkoutAmount});

  @override
  $ScreeningCopyWith<$Res>? get screening;
  @override
  $CustomerCopyWith<$Res>? get customer;
  @override
  $ScreeningRegistrationCopyWith<$Res>? get registration;
  @override
  $PosOrderCopyWith<$Res>? get order;
}

/// @nodoc
class __$$PosCartImplCopyWithImpl<$Res>
    extends _$PosCartCopyWithImpl<$Res, _$PosCartImpl>
    implements _$$PosCartImplCopyWith<$Res> {
  __$$PosCartImplCopyWithImpl(
      _$PosCartImpl _value, $Res Function(_$PosCartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screening = freezed,
    Object? customer = freezed,
    Object? registration = freezed,
    Object? order = freezed,
    Object? checkoutAmount = freezed,
  }) {
    return _then(_$PosCartImpl(
      screening: freezed == screening
          ? _value.screening
          : screening // ignore: cast_nullable_to_non_nullable
              as Screening?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      registration: freezed == registration
          ? _value.registration
          : registration // ignore: cast_nullable_to_non_nullable
              as ScreeningRegistration?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as PosOrder?,
      checkoutAmount: freezed == checkoutAmount
          ? _value.checkoutAmount
          : checkoutAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PosCartImpl extends _PosCart {
  const _$PosCartImpl(
      {this.screening,
      this.customer,
      this.registration,
      this.order,
      this.checkoutAmount})
      : super._();

  factory _$PosCartImpl.fromJson(Map<String, dynamic> json) =>
      _$$PosCartImplFromJson(json);

  @override
  final Screening? screening;
  @override
  final Customer? customer;
  @override
  final ScreeningRegistration? registration;
  @override
  final PosOrder? order;
  @override
  final double? checkoutAmount;

  @override
  String toString() {
    return 'PosCart(screening: $screening, customer: $customer, registration: $registration, order: $order, checkoutAmount: $checkoutAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosCartImpl &&
            (identical(other.screening, screening) ||
                other.screening == screening) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.registration, registration) ||
                other.registration == registration) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.checkoutAmount, checkoutAmount) ||
                other.checkoutAmount == checkoutAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, screening, customer, registration, order, checkoutAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PosCartImplCopyWith<_$PosCartImpl> get copyWith =>
      __$$PosCartImplCopyWithImpl<_$PosCartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PosCartImplToJson(
      this,
    );
  }
}

abstract class _PosCart extends PosCart {
  const factory _PosCart(
      {final Screening? screening,
      final Customer? customer,
      final ScreeningRegistration? registration,
      final PosOrder? order,
      final double? checkoutAmount}) = _$PosCartImpl;
  const _PosCart._() : super._();

  factory _PosCart.fromJson(Map<String, dynamic> json) = _$PosCartImpl.fromJson;

  @override
  Screening? get screening;
  @override
  Customer? get customer;
  @override
  ScreeningRegistration? get registration;
  @override
  PosOrder? get order;
  @override
  double? get checkoutAmount;
  @override
  @JsonKey(ignore: true)
  _$$PosCartImplCopyWith<_$PosCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
