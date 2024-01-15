// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screening_timeslot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningTimeslot _$ScreeningTimeslotFromJson(Map<String, dynamic> json) {
  return _ScreeningTimeslot.fromJson(json);
}

/// @nodoc
mixin _$ScreeningTimeslot {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_time')
  DateTime get dateAndTime => throw _privateConstructorUsedError;
  int get slots => throw _privateConstructorUsedError;
  @JsonKey(name: 'specimen_collection_date')
  DateTime? get specimenCollectionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'specimen_collection_time')
  String? get specimenCollectionTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'specimen_collection_venue')
  String? get specimenCollectionVenue => throw _privateConstructorUsedError;
  @JsonKey(name: 'screening_id')
  int get screeningId => throw _privateConstructorUsedError;
  @JsonKey(name: 'venue_id')
  int get venueId => throw _privateConstructorUsedError;
  int? get customersCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningTimeslotCopyWith<ScreeningTimeslot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningTimeslotCopyWith<$Res> {
  factory $ScreeningTimeslotCopyWith(
          ScreeningTimeslot value, $Res Function(ScreeningTimeslot) then) =
      _$ScreeningTimeslotCopyWithImpl<$Res, ScreeningTimeslot>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'date_time') DateTime dateAndTime,
      int slots,
      @JsonKey(name: 'specimen_collection_date')
      DateTime? specimenCollectionDate,
      @JsonKey(name: 'specimen_collection_time') String? specimenCollectionTime,
      @JsonKey(name: 'specimen_collection_venue')
      String? specimenCollectionVenue,
      @JsonKey(name: 'screening_id') int screeningId,
      @JsonKey(name: 'venue_id') int venueId,
      int? customersCount});
}

/// @nodoc
class _$ScreeningTimeslotCopyWithImpl<$Res, $Val extends ScreeningTimeslot>
    implements $ScreeningTimeslotCopyWith<$Res> {
  _$ScreeningTimeslotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateAndTime = null,
    Object? slots = null,
    Object? specimenCollectionDate = freezed,
    Object? specimenCollectionTime = freezed,
    Object? specimenCollectionVenue = freezed,
    Object? screeningId = null,
    Object? venueId = null,
    Object? customersCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateAndTime: null == dateAndTime
          ? _value.dateAndTime
          : dateAndTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      slots: null == slots
          ? _value.slots
          : slots // ignore: cast_nullable_to_non_nullable
              as int,
      specimenCollectionDate: freezed == specimenCollectionDate
          ? _value.specimenCollectionDate
          : specimenCollectionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      specimenCollectionTime: freezed == specimenCollectionTime
          ? _value.specimenCollectionTime
          : specimenCollectionTime // ignore: cast_nullable_to_non_nullable
              as String?,
      specimenCollectionVenue: freezed == specimenCollectionVenue
          ? _value.specimenCollectionVenue
          : specimenCollectionVenue // ignore: cast_nullable_to_non_nullable
              as String?,
      screeningId: null == screeningId
          ? _value.screeningId
          : screeningId // ignore: cast_nullable_to_non_nullable
              as int,
      venueId: null == venueId
          ? _value.venueId
          : venueId // ignore: cast_nullable_to_non_nullable
              as int,
      customersCount: freezed == customersCount
          ? _value.customersCount
          : customersCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScreeningTimeslotImplCopyWith<$Res>
    implements $ScreeningTimeslotCopyWith<$Res> {
  factory _$$ScreeningTimeslotImplCopyWith(_$ScreeningTimeslotImpl value,
          $Res Function(_$ScreeningTimeslotImpl) then) =
      __$$ScreeningTimeslotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'date_time') DateTime dateAndTime,
      int slots,
      @JsonKey(name: 'specimen_collection_date')
      DateTime? specimenCollectionDate,
      @JsonKey(name: 'specimen_collection_time') String? specimenCollectionTime,
      @JsonKey(name: 'specimen_collection_venue')
      String? specimenCollectionVenue,
      @JsonKey(name: 'screening_id') int screeningId,
      @JsonKey(name: 'venue_id') int venueId,
      int? customersCount});
}

/// @nodoc
class __$$ScreeningTimeslotImplCopyWithImpl<$Res>
    extends _$ScreeningTimeslotCopyWithImpl<$Res, _$ScreeningTimeslotImpl>
    implements _$$ScreeningTimeslotImplCopyWith<$Res> {
  __$$ScreeningTimeslotImplCopyWithImpl(_$ScreeningTimeslotImpl _value,
      $Res Function(_$ScreeningTimeslotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateAndTime = null,
    Object? slots = null,
    Object? specimenCollectionDate = freezed,
    Object? specimenCollectionTime = freezed,
    Object? specimenCollectionVenue = freezed,
    Object? screeningId = null,
    Object? venueId = null,
    Object? customersCount = freezed,
  }) {
    return _then(_$ScreeningTimeslotImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateAndTime: null == dateAndTime
          ? _value.dateAndTime
          : dateAndTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      slots: null == slots
          ? _value.slots
          : slots // ignore: cast_nullable_to_non_nullable
              as int,
      specimenCollectionDate: freezed == specimenCollectionDate
          ? _value.specimenCollectionDate
          : specimenCollectionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      specimenCollectionTime: freezed == specimenCollectionTime
          ? _value.specimenCollectionTime
          : specimenCollectionTime // ignore: cast_nullable_to_non_nullable
              as String?,
      specimenCollectionVenue: freezed == specimenCollectionVenue
          ? _value.specimenCollectionVenue
          : specimenCollectionVenue // ignore: cast_nullable_to_non_nullable
              as String?,
      screeningId: null == screeningId
          ? _value.screeningId
          : screeningId // ignore: cast_nullable_to_non_nullable
              as int,
      venueId: null == venueId
          ? _value.venueId
          : venueId // ignore: cast_nullable_to_non_nullable
              as int,
      customersCount: freezed == customersCount
          ? _value.customersCount
          : customersCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScreeningTimeslotImpl implements _ScreeningTimeslot {
  const _$ScreeningTimeslotImpl(
      {required this.id,
      @JsonKey(name: 'date_time') required this.dateAndTime,
      required this.slots,
      @JsonKey(name: 'specimen_collection_date') this.specimenCollectionDate,
      @JsonKey(name: 'specimen_collection_time') this.specimenCollectionTime,
      @JsonKey(name: 'specimen_collection_venue') this.specimenCollectionVenue,
      @JsonKey(name: 'screening_id') required this.screeningId,
      @JsonKey(name: 'venue_id') required this.venueId,
      this.customersCount});

  factory _$ScreeningTimeslotImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScreeningTimeslotImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'date_time')
  final DateTime dateAndTime;
  @override
  final int slots;
  @override
  @JsonKey(name: 'specimen_collection_date')
  final DateTime? specimenCollectionDate;
  @override
  @JsonKey(name: 'specimen_collection_time')
  final String? specimenCollectionTime;
  @override
  @JsonKey(name: 'specimen_collection_venue')
  final String? specimenCollectionVenue;
  @override
  @JsonKey(name: 'screening_id')
  final int screeningId;
  @override
  @JsonKey(name: 'venue_id')
  final int venueId;
  @override
  final int? customersCount;

  @override
  String toString() {
    return 'ScreeningTimeslot(id: $id, dateAndTime: $dateAndTime, slots: $slots, specimenCollectionDate: $specimenCollectionDate, specimenCollectionTime: $specimenCollectionTime, specimenCollectionVenue: $specimenCollectionVenue, screeningId: $screeningId, venueId: $venueId, customersCount: $customersCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreeningTimeslotImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateAndTime, dateAndTime) ||
                other.dateAndTime == dateAndTime) &&
            (identical(other.slots, slots) || other.slots == slots) &&
            (identical(other.specimenCollectionDate, specimenCollectionDate) ||
                other.specimenCollectionDate == specimenCollectionDate) &&
            (identical(other.specimenCollectionTime, specimenCollectionTime) ||
                other.specimenCollectionTime == specimenCollectionTime) &&
            (identical(
                    other.specimenCollectionVenue, specimenCollectionVenue) ||
                other.specimenCollectionVenue == specimenCollectionVenue) &&
            (identical(other.screeningId, screeningId) ||
                other.screeningId == screeningId) &&
            (identical(other.venueId, venueId) || other.venueId == venueId) &&
            (identical(other.customersCount, customersCount) ||
                other.customersCount == customersCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      dateAndTime,
      slots,
      specimenCollectionDate,
      specimenCollectionTime,
      specimenCollectionVenue,
      screeningId,
      venueId,
      customersCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreeningTimeslotImplCopyWith<_$ScreeningTimeslotImpl> get copyWith =>
      __$$ScreeningTimeslotImplCopyWithImpl<_$ScreeningTimeslotImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScreeningTimeslotImplToJson(
      this,
    );
  }
}

abstract class _ScreeningTimeslot implements ScreeningTimeslot {
  const factory _ScreeningTimeslot(
      {required final int id,
      @JsonKey(name: 'date_time') required final DateTime dateAndTime,
      required final int slots,
      @JsonKey(name: 'specimen_collection_date')
      final DateTime? specimenCollectionDate,
      @JsonKey(name: 'specimen_collection_time')
      final String? specimenCollectionTime,
      @JsonKey(name: 'specimen_collection_venue')
      final String? specimenCollectionVenue,
      @JsonKey(name: 'screening_id') required final int screeningId,
      @JsonKey(name: 'venue_id') required final int venueId,
      final int? customersCount}) = _$ScreeningTimeslotImpl;

  factory _ScreeningTimeslot.fromJson(Map<String, dynamic> json) =
      _$ScreeningTimeslotImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'date_time')
  DateTime get dateAndTime;
  @override
  int get slots;
  @override
  @JsonKey(name: 'specimen_collection_date')
  DateTime? get specimenCollectionDate;
  @override
  @JsonKey(name: 'specimen_collection_time')
  String? get specimenCollectionTime;
  @override
  @JsonKey(name: 'specimen_collection_venue')
  String? get specimenCollectionVenue;
  @override
  @JsonKey(name: 'screening_id')
  int get screeningId;
  @override
  @JsonKey(name: 'venue_id')
  int get venueId;
  @override
  int? get customersCount;
  @override
  @JsonKey(ignore: true)
  _$$ScreeningTimeslotImplCopyWith<_$ScreeningTimeslotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
