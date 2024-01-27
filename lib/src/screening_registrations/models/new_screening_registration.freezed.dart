// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_screening_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewScreeningRegistration _$NewScreeningRegistrationFromJson(
    Map<String, dynamic> json) {
  return _NewScreeningRegistration.fromJson(json);
}

/// @nodoc
mixin _$NewScreeningRegistration {
  int get id => throw _privateConstructorUsedError;
  String? get index => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_nric')
  String? get customerNric => throw _privateConstructorUsedError;
  @JsonKey(name: 'timeslot_id')
  int get timeslotId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewScreeningRegistrationCopyWith<NewScreeningRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewScreeningRegistrationCopyWith<$Res> {
  factory $NewScreeningRegistrationCopyWith(NewScreeningRegistration value,
          $Res Function(NewScreeningRegistration) then) =
      _$NewScreeningRegistrationCopyWithImpl<$Res, NewScreeningRegistration>;
  @useResult
  $Res call(
      {int id,
      String? index,
      @JsonKey(name: 'customer_nric') String? customerNric,
      @JsonKey(name: 'timeslot_id') int timeslotId,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$NewScreeningRegistrationCopyWithImpl<$Res,
        $Val extends NewScreeningRegistration>
    implements $NewScreeningRegistrationCopyWith<$Res> {
  _$NewScreeningRegistrationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = freezed,
    Object? customerNric = freezed,
    Object? timeslotId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as String?,
      customerNric: freezed == customerNric
          ? _value.customerNric
          : customerNric // ignore: cast_nullable_to_non_nullable
              as String?,
      timeslotId: null == timeslotId
          ? _value.timeslotId
          : timeslotId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewScreeningRegistrationImplCopyWith<$Res>
    implements $NewScreeningRegistrationCopyWith<$Res> {
  factory _$$NewScreeningRegistrationImplCopyWith(
          _$NewScreeningRegistrationImpl value,
          $Res Function(_$NewScreeningRegistrationImpl) then) =
      __$$NewScreeningRegistrationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? index,
      @JsonKey(name: 'customer_nric') String? customerNric,
      @JsonKey(name: 'timeslot_id') int timeslotId,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$NewScreeningRegistrationImplCopyWithImpl<$Res>
    extends _$NewScreeningRegistrationCopyWithImpl<$Res,
        _$NewScreeningRegistrationImpl>
    implements _$$NewScreeningRegistrationImplCopyWith<$Res> {
  __$$NewScreeningRegistrationImplCopyWithImpl(
      _$NewScreeningRegistrationImpl _value,
      $Res Function(_$NewScreeningRegistrationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = freezed,
    Object? customerNric = freezed,
    Object? timeslotId = null,
    Object? createdAt = null,
  }) {
    return _then(_$NewScreeningRegistrationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as String?,
      customerNric: freezed == customerNric
          ? _value.customerNric
          : customerNric // ignore: cast_nullable_to_non_nullable
              as String?,
      timeslotId: null == timeslotId
          ? _value.timeslotId
          : timeslotId // ignore: cast_nullable_to_non_nullable
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
class _$NewScreeningRegistrationImpl implements _NewScreeningRegistration {
  const _$NewScreeningRegistrationImpl(
      {required this.id,
      this.index,
      @JsonKey(name: 'customer_nric') this.customerNric,
      @JsonKey(name: 'timeslot_id') required this.timeslotId,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$NewScreeningRegistrationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewScreeningRegistrationImplFromJson(json);

  @override
  final int id;
  @override
  final String? index;
  @override
  @JsonKey(name: 'customer_nric')
  final String? customerNric;
  @override
  @JsonKey(name: 'timeslot_id')
  final int timeslotId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'NewScreeningRegistration(id: $id, index: $index, customerNric: $customerNric, timeslotId: $timeslotId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewScreeningRegistrationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.customerNric, customerNric) ||
                other.customerNric == customerNric) &&
            (identical(other.timeslotId, timeslotId) ||
                other.timeslotId == timeslotId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, index, customerNric, timeslotId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewScreeningRegistrationImplCopyWith<_$NewScreeningRegistrationImpl>
      get copyWith => __$$NewScreeningRegistrationImplCopyWithImpl<
          _$NewScreeningRegistrationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewScreeningRegistrationImplToJson(
      this,
    );
  }
}

abstract class _NewScreeningRegistration implements NewScreeningRegistration {
  const factory _NewScreeningRegistration(
          {required final int id,
          final String? index,
          @JsonKey(name: 'customer_nric') final String? customerNric,
          @JsonKey(name: 'timeslot_id') required final int timeslotId,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$NewScreeningRegistrationImpl;

  factory _NewScreeningRegistration.fromJson(Map<String, dynamic> json) =
      _$NewScreeningRegistrationImpl.fromJson;

  @override
  int get id;
  @override
  String? get index;
  @override
  @JsonKey(name: 'customer_nric')
  String? get customerNric;
  @override
  @JsonKey(name: 'timeslot_id')
  int get timeslotId;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$NewScreeningRegistrationImplCopyWith<_$NewScreeningRegistrationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
