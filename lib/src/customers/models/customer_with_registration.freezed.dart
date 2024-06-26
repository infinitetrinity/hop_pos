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
  Screening get screening => throw _privateConstructorUsedError;
  ScreeningTimeslot? get timeslot => throw _privateConstructorUsedError;
  ScreeningRegistration get registration => throw _privateConstructorUsedError;
  PosOrder? get order => throw _privateConstructorUsedError;

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
  $Res call(
      {Customer customer,
      Screening screening,
      ScreeningTimeslot? timeslot,
      ScreeningRegistration registration,
      PosOrder? order});

  $CustomerCopyWith<$Res> get customer;
  $ScreeningCopyWith<$Res> get screening;
  $ScreeningTimeslotCopyWith<$Res>? get timeslot;
  $ScreeningRegistrationCopyWith<$Res> get registration;
  $PosOrderCopyWith<$Res>? get order;
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
    Object? screening = null,
    Object? timeslot = freezed,
    Object? registration = null,
    Object? order = freezed,
  }) {
    return _then(_value.copyWith(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      screening: null == screening
          ? _value.screening
          : screening // ignore: cast_nullable_to_non_nullable
              as Screening,
      timeslot: freezed == timeslot
          ? _value.timeslot
          : timeslot // ignore: cast_nullable_to_non_nullable
              as ScreeningTimeslot?,
      registration: null == registration
          ? _value.registration
          : registration // ignore: cast_nullable_to_non_nullable
              as ScreeningRegistration,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as PosOrder?,
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
  $ScreeningCopyWith<$Res> get screening {
    return $ScreeningCopyWith<$Res>(_value.screening, (value) {
      return _then(_value.copyWith(screening: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ScreeningTimeslotCopyWith<$Res>? get timeslot {
    if (_value.timeslot == null) {
      return null;
    }

    return $ScreeningTimeslotCopyWith<$Res>(_value.timeslot!, (value) {
      return _then(_value.copyWith(timeslot: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ScreeningRegistrationCopyWith<$Res> get registration {
    return $ScreeningRegistrationCopyWith<$Res>(_value.registration, (value) {
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
abstract class _$$CustomerWithRegistrationImplCopyWith<$Res>
    implements $CustomerWithRegistrationCopyWith<$Res> {
  factory _$$CustomerWithRegistrationImplCopyWith(
          _$CustomerWithRegistrationImpl value,
          $Res Function(_$CustomerWithRegistrationImpl) then) =
      __$$CustomerWithRegistrationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Customer customer,
      Screening screening,
      ScreeningTimeslot? timeslot,
      ScreeningRegistration registration,
      PosOrder? order});

  @override
  $CustomerCopyWith<$Res> get customer;
  @override
  $ScreeningCopyWith<$Res> get screening;
  @override
  $ScreeningTimeslotCopyWith<$Res>? get timeslot;
  @override
  $ScreeningRegistrationCopyWith<$Res> get registration;
  @override
  $PosOrderCopyWith<$Res>? get order;
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
    Object? screening = null,
    Object? timeslot = freezed,
    Object? registration = null,
    Object? order = freezed,
  }) {
    return _then(_$CustomerWithRegistrationImpl(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      screening: null == screening
          ? _value.screening
          : screening // ignore: cast_nullable_to_non_nullable
              as Screening,
      timeslot: freezed == timeslot
          ? _value.timeslot
          : timeslot // ignore: cast_nullable_to_non_nullable
              as ScreeningTimeslot?,
      registration: null == registration
          ? _value.registration
          : registration // ignore: cast_nullable_to_non_nullable
              as ScreeningRegistration,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as PosOrder?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerWithRegistrationImpl extends _CustomerWithRegistration {
  const _$CustomerWithRegistrationImpl(
      {required this.customer,
      required this.screening,
      this.timeslot,
      required this.registration,
      this.order})
      : super._();

  factory _$CustomerWithRegistrationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerWithRegistrationImplFromJson(json);

  @override
  final Customer customer;
  @override
  final Screening screening;
  @override
  final ScreeningTimeslot? timeslot;
  @override
  final ScreeningRegistration registration;
  @override
  final PosOrder? order;

  @override
  String toString() {
    return 'CustomerWithRegistration(customer: $customer, screening: $screening, timeslot: $timeslot, registration: $registration, order: $order)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerWithRegistrationImpl &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.screening, screening) ||
                other.screening == screening) &&
            (identical(other.timeslot, timeslot) ||
                other.timeslot == timeslot) &&
            (identical(other.registration, registration) ||
                other.registration == registration) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, customer, screening, timeslot, registration, order);

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

abstract class _CustomerWithRegistration extends CustomerWithRegistration {
  const factory _CustomerWithRegistration(
      {required final Customer customer,
      required final Screening screening,
      final ScreeningTimeslot? timeslot,
      required final ScreeningRegistration registration,
      final PosOrder? order}) = _$CustomerWithRegistrationImpl;
  const _CustomerWithRegistration._() : super._();

  factory _CustomerWithRegistration.fromJson(Map<String, dynamic> json) =
      _$CustomerWithRegistrationImpl.fromJson;

  @override
  Customer get customer;
  @override
  Screening get screening;
  @override
  ScreeningTimeslot? get timeslot;
  @override
  ScreeningRegistration get registration;
  @override
  PosOrder? get order;
  @override
  @JsonKey(ignore: true)
  _$$CustomerWithRegistrationImplCopyWith<_$CustomerWithRegistrationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
