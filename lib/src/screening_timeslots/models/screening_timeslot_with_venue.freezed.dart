// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screening_timeslot_with_venue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningTimeslotWithVenue _$ScreeningTimeslotWithVenueFromJson(
    Map<String, dynamic> json) {
  return _ScreeningTimeslotWithVenue.fromJson(json);
}

/// @nodoc
mixin _$ScreeningTimeslotWithVenue {
  ScreeningTimeslot get timeslot => throw _privateConstructorUsedError;
  ScreeningVenue get venue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningTimeslotWithVenueCopyWith<ScreeningTimeslotWithVenue>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningTimeslotWithVenueCopyWith<$Res> {
  factory $ScreeningTimeslotWithVenueCopyWith(ScreeningTimeslotWithVenue value,
          $Res Function(ScreeningTimeslotWithVenue) then) =
      _$ScreeningTimeslotWithVenueCopyWithImpl<$Res,
          ScreeningTimeslotWithVenue>;
  @useResult
  $Res call({ScreeningTimeslot timeslot, ScreeningVenue venue});

  $ScreeningTimeslotCopyWith<$Res> get timeslot;
  $ScreeningVenueCopyWith<$Res> get venue;
}

/// @nodoc
class _$ScreeningTimeslotWithVenueCopyWithImpl<$Res,
        $Val extends ScreeningTimeslotWithVenue>
    implements $ScreeningTimeslotWithVenueCopyWith<$Res> {
  _$ScreeningTimeslotWithVenueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeslot = null,
    Object? venue = null,
  }) {
    return _then(_value.copyWith(
      timeslot: null == timeslot
          ? _value.timeslot
          : timeslot // ignore: cast_nullable_to_non_nullable
              as ScreeningTimeslot,
      venue: null == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as ScreeningVenue,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScreeningTimeslotCopyWith<$Res> get timeslot {
    return $ScreeningTimeslotCopyWith<$Res>(_value.timeslot, (value) {
      return _then(_value.copyWith(timeslot: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ScreeningVenueCopyWith<$Res> get venue {
    return $ScreeningVenueCopyWith<$Res>(_value.venue, (value) {
      return _then(_value.copyWith(venue: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScreeningTimeslotWithVenueImplCopyWith<$Res>
    implements $ScreeningTimeslotWithVenueCopyWith<$Res> {
  factory _$$ScreeningTimeslotWithVenueImplCopyWith(
          _$ScreeningTimeslotWithVenueImpl value,
          $Res Function(_$ScreeningTimeslotWithVenueImpl) then) =
      __$$ScreeningTimeslotWithVenueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ScreeningTimeslot timeslot, ScreeningVenue venue});

  @override
  $ScreeningTimeslotCopyWith<$Res> get timeslot;
  @override
  $ScreeningVenueCopyWith<$Res> get venue;
}

/// @nodoc
class __$$ScreeningTimeslotWithVenueImplCopyWithImpl<$Res>
    extends _$ScreeningTimeslotWithVenueCopyWithImpl<$Res,
        _$ScreeningTimeslotWithVenueImpl>
    implements _$$ScreeningTimeslotWithVenueImplCopyWith<$Res> {
  __$$ScreeningTimeslotWithVenueImplCopyWithImpl(
      _$ScreeningTimeslotWithVenueImpl _value,
      $Res Function(_$ScreeningTimeslotWithVenueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeslot = null,
    Object? venue = null,
  }) {
    return _then(_$ScreeningTimeslotWithVenueImpl(
      timeslot: null == timeslot
          ? _value.timeslot
          : timeslot // ignore: cast_nullable_to_non_nullable
              as ScreeningTimeslot,
      venue: null == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as ScreeningVenue,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScreeningTimeslotWithVenueImpl extends _ScreeningTimeslotWithVenue {
  const _$ScreeningTimeslotWithVenueImpl(
      {required this.timeslot, required this.venue})
      : super._();

  factory _$ScreeningTimeslotWithVenueImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ScreeningTimeslotWithVenueImplFromJson(json);

  @override
  final ScreeningTimeslot timeslot;
  @override
  final ScreeningVenue venue;

  @override
  String toString() {
    return 'ScreeningTimeslotWithVenue(timeslot: $timeslot, venue: $venue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreeningTimeslotWithVenueImpl &&
            (identical(other.timeslot, timeslot) ||
                other.timeslot == timeslot) &&
            (identical(other.venue, venue) || other.venue == venue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, timeslot, venue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreeningTimeslotWithVenueImplCopyWith<_$ScreeningTimeslotWithVenueImpl>
      get copyWith => __$$ScreeningTimeslotWithVenueImplCopyWithImpl<
          _$ScreeningTimeslotWithVenueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScreeningTimeslotWithVenueImplToJson(
      this,
    );
  }
}

abstract class _ScreeningTimeslotWithVenue extends ScreeningTimeslotWithVenue {
  const factory _ScreeningTimeslotWithVenue(
      {required final ScreeningTimeslot timeslot,
      required final ScreeningVenue venue}) = _$ScreeningTimeslotWithVenueImpl;
  const _ScreeningTimeslotWithVenue._() : super._();

  factory _ScreeningTimeslotWithVenue.fromJson(Map<String, dynamic> json) =
      _$ScreeningTimeslotWithVenueImpl.fromJson;

  @override
  ScreeningTimeslot get timeslot;
  @override
  ScreeningVenue get venue;
  @override
  @JsonKey(ignore: true)
  _$$ScreeningTimeslotWithVenueImplCopyWith<_$ScreeningTimeslotWithVenueImpl>
      get copyWith => throw _privateConstructorUsedError;
}
