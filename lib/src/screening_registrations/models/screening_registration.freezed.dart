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
  int? get index => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  int get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'timeslot_id')
  int get timeslotId => throw _privateConstructorUsedError;

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
      {int? index,
      @JsonKey(name: 'customer_id') int customerId,
      @JsonKey(name: 'timeslot_id') int timeslotId});
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
    Object? index = freezed,
    Object? customerId = null,
    Object? timeslotId = null,
  }) {
    return _then(_value.copyWith(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      timeslotId: null == timeslotId
          ? _value.timeslotId
          : timeslotId // ignore: cast_nullable_to_non_nullable
              as int,
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
      {int? index,
      @JsonKey(name: 'customer_id') int customerId,
      @JsonKey(name: 'timeslot_id') int timeslotId});
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
    Object? index = freezed,
    Object? customerId = null,
    Object? timeslotId = null,
  }) {
    return _then(_$ScreeningRegistrationImpl(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      timeslotId: null == timeslotId
          ? _value.timeslotId
          : timeslotId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScreeningRegistrationImpl implements _ScreeningRegistration {
  const _$ScreeningRegistrationImpl(
      {this.index,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'timeslot_id') required this.timeslotId});

  factory _$ScreeningRegistrationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScreeningRegistrationImplFromJson(json);

  @override
  final int? index;
  @override
  @JsonKey(name: 'customer_id')
  final int customerId;
  @override
  @JsonKey(name: 'timeslot_id')
  final int timeslotId;

  @override
  String toString() {
    return 'ScreeningRegistration(index: $index, customerId: $customerId, timeslotId: $timeslotId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreeningRegistrationImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.timeslotId, timeslotId) ||
                other.timeslotId == timeslotId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index, customerId, timeslotId);

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
          {final int? index,
          @JsonKey(name: 'customer_id') required final int customerId,
          @JsonKey(name: 'timeslot_id') required final int timeslotId}) =
      _$ScreeningRegistrationImpl;

  factory _ScreeningRegistration.fromJson(Map<String, dynamic> json) =
      _$ScreeningRegistrationImpl.fromJson;

  @override
  int? get index;
  @override
  @JsonKey(name: 'customer_id')
  int get customerId;
  @override
  @JsonKey(name: 'timeslot_id')
  int get timeslotId;
  @override
  @JsonKey(ignore: true)
  _$$ScreeningRegistrationImplCopyWith<_$ScreeningRegistrationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
