// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_with_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerWithRegistration _$CustomerWithRegistrationFromJson(
    Map<String, dynamic> json) {
  return _CustomerWithRegistration.fromJson(json);
}

/// @nodoc
mixin _$CustomerWithRegistration {
  Customer get customer => throw _privateConstructorUsedError;
  ScreeningRegistration get registration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerWithRegistrationCopyWith<CustomerWithRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerWithRegistrationCopyWith<$Res> {
  factory $CustomerWithRegistrationCopyWith(CustomerWithRegistration value,
          $Res Function(CustomerWithRegistration) then) =
      _$CustomerWithRegistrationCopyWithImpl<$Res, CustomerWithRegistration>;
  @useResult
  $Res call({Customer customer, ScreeningRegistration registration});

  $CustomerCopyWith<$Res> get customer;
  $ScreeningRegistrationCopyWith<$Res> get registration;
}

/// @nodoc
class _$CustomerWithRegistrationCopyWithImpl<$Res,
        $Val extends CustomerWithRegistration>
    implements $CustomerWithRegistrationCopyWith<$Res> {
  _$CustomerWithRegistrationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? registration = null,
  }) {
    return _then(_value.copyWith(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      registration: null == registration
          ? _value.registration
          : registration // ignore: cast_nullable_to_non_nullable
              as ScreeningRegistration,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get customer {
    return $CustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ScreeningRegistrationCopyWith<$Res> get registration {
    return $ScreeningRegistrationCopyWith<$Res>(_value.registration, (value) {
      return _then(_value.copyWith(registration: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerWithRegistrationImplCopyWith<$Res>
    implements $CustomerWithRegistrationCopyWith<$Res> {
  factory _$$CustomerWithRegistrationImplCopyWith(
          _$CustomerWithRegistrationImpl value,
          $Res Function(_$CustomerWithRegistrationImpl) then) =
      __$$CustomerWithRegistrationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Customer customer, ScreeningRegistration registration});

  @override
  $CustomerCopyWith<$Res> get customer;
  @override
  $ScreeningRegistrationCopyWith<$Res> get registration;
}

/// @nodoc
class __$$CustomerWithRegistrationImplCopyWithImpl<$Res>
    extends _$CustomerWithRegistrationCopyWithImpl<$Res,
        _$CustomerWithRegistrationImpl>
    implements _$$CustomerWithRegistrationImplCopyWith<$Res> {
  __$$CustomerWithRegistrationImplCopyWithImpl(
      _$CustomerWithRegistrationImpl _value,
      $Res Function(_$CustomerWithRegistrationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? registration = null,
  }) {
    return _then(_$CustomerWithRegistrationImpl(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      registration: null == registration
          ? _value.registration
          : registration // ignore: cast_nullable_to_non_nullable
              as ScreeningRegistration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerWithRegistrationImpl implements _CustomerWithRegistration {
  const _$CustomerWithRegistrationImpl(
      {required this.customer, required this.registration});

  factory _$CustomerWithRegistrationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerWithRegistrationImplFromJson(json);

  @override
  final Customer customer;
  @override
  final ScreeningRegistration registration;

  @override
  String toString() {
    return 'CustomerWithRegistration(customer: $customer, registration: $registration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerWithRegistrationImpl &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.registration, registration) ||
                other.registration == registration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, customer, registration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerWithRegistrationImplCopyWith<_$CustomerWithRegistrationImpl>
      get copyWith => __$$CustomerWithRegistrationImplCopyWithImpl<
          _$CustomerWithRegistrationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerWithRegistrationImplToJson(
      this,
    );
  }
}

abstract class _CustomerWithRegistration implements CustomerWithRegistration {
  const factory _CustomerWithRegistration(
          {required final Customer customer,
          required final ScreeningRegistration registration}) =
      _$CustomerWithRegistrationImpl;

  factory _CustomerWithRegistration.fromJson(Map<String, dynamic> json) =
      _$CustomerWithRegistrationImpl.fromJson;

  @override
  Customer get customer;
  @override
  ScreeningRegistration get registration;
  @override
  @JsonKey(ignore: true)
  _$$CustomerWithRegistrationImplCopyWith<_$CustomerWithRegistrationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
