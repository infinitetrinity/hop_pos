// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screening_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningRegistration _$ScreeningRegistrationFromJson(
    Map<String, dynamic> json) {
  return _ScreeningRegistration.fromJson(json);
}

/// @nodoc
mixin _$ScreeningRegistration {
  int? get id => throw _privateConstructorUsedError;
  String? get index => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_nric')
  String? get customerNric => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'timeslot_id')
  int get timeslotId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningRegistrationCopyWith<ScreeningRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningRegistrationCopyWith<$Res> {
  factory $ScreeningRegistrationCopyWith(ScreeningRegistration value,
          $Res Function(ScreeningRegistration) then) =
      _$ScreeningRegistrationCopyWithImpl<$Res, ScreeningRegistration>;
  @useResult
  $Res call(
      {int? id,
      String? index,
      @JsonKey(name: 'customer_nric') String? customerNric,
      @JsonKey(name: 'customer_id') int? customerId,
      @JsonKey(name: 'timeslot_id') int timeslotId,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$ScreeningRegistrationCopyWithImpl<$Res,
        $Val extends ScreeningRegistration>
    implements $ScreeningRegistrationCopyWith<$Res> {
  _$ScreeningRegistrationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? index = freezed,
    Object? customerNric = freezed,
    Object? customerId = freezed,
    Object? timeslotId = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as String?,
      customerNric: freezed == customerNric
          ? _value.customerNric
          : customerNric // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      timeslotId: null == timeslotId
          ? _value.timeslotId
          : timeslotId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScreeningRegistrationImplCopyWith<$Res>
    implements $ScreeningRegistrationCopyWith<$Res> {
  factory _$$ScreeningRegistrationImplCopyWith(
          _$ScreeningRegistrationImpl value,
          $Res Function(_$ScreeningRegistrationImpl) then) =
      __$$ScreeningRegistrationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? index,
      @JsonKey(name: 'customer_nric') String? customerNric,
      @JsonKey(name: 'customer_id') int? customerId,
      @JsonKey(name: 'timeslot_id') int timeslotId,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$ScreeningRegistrationImplCopyWithImpl<$Res>
    extends _$ScreeningRegistrationCopyWithImpl<$Res,
        _$ScreeningRegistrationImpl>
    implements _$$ScreeningRegistrationImplCopyWith<$Res> {
  __$$ScreeningRegistrationImplCopyWithImpl(_$ScreeningRegistrationImpl _value,
      $Res Function(_$ScreeningRegistrationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? index = freezed,
    Object? customerNric = freezed,
    Object? customerId = freezed,
    Object? timeslotId = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$ScreeningRegistrationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as String?,
      customerNric: freezed == customerNric
          ? _value.customerNric
          : customerNric // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      timeslotId: null == timeslotId
          ? _value.timeslotId
          : timeslotId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScreeningRegistrationImpl implements _ScreeningRegistration {
  const _$ScreeningRegistrationImpl(
      {this.id,
      this.index,
      @JsonKey(name: 'customer_nric') this.customerNric,
      @JsonKey(name: 'customer_id') this.customerId,
      @JsonKey(name: 'timeslot_id') required this.timeslotId,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$ScreeningRegistrationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScreeningRegistrationImplFromJson(json);

  @override
  final int? id;
  @override
  final String? index;
  @override
  @JsonKey(name: 'customer_nric')
  final String? customerNric;
  @override
  @JsonKey(name: 'customer_id')
  final int? customerId;
  @override
  @JsonKey(name: 'timeslot_id')
  final int timeslotId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ScreeningRegistration(id: $id, index: $index, customerNric: $customerNric, customerId: $customerId, timeslotId: $timeslotId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreeningRegistrationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.customerNric, customerNric) ||
                other.customerNric == customerNric) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.timeslotId, timeslotId) ||
                other.timeslotId == timeslotId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, index, customerNric, customerId, timeslotId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreeningRegistrationImplCopyWith<_$ScreeningRegistrationImpl>
      get copyWith => __$$ScreeningRegistrationImplCopyWithImpl<
          _$ScreeningRegistrationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScreeningRegistrationImplToJson(
      this,
    );
  }
}

abstract class _ScreeningRegistration implements ScreeningRegistration {
  const factory _ScreeningRegistration(
          {final int? id,
          final String? index,
          @JsonKey(name: 'customer_nric') final String? customerNric,
          @JsonKey(name: 'customer_id') final int? customerId,
          @JsonKey(name: 'timeslot_id') required final int timeslotId,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$ScreeningRegistrationImpl;

  factory _ScreeningRegistration.fromJson(Map<String, dynamic> json) =
      _$ScreeningRegistrationImpl.fromJson;

  @override
  int? get id;
  @override
  String? get index;
  @override
  @JsonKey(name: 'customer_nric')
  String? get customerNric;
  @override
  @JsonKey(name: 'customer_id')
  int? get customerId;
  @override
  @JsonKey(name: 'timeslot_id')
  int get timeslotId;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ScreeningRegistrationImplCopyWith<_$ScreeningRegistrationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
