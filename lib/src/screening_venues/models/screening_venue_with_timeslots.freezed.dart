// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screening_venue_with_timeslots.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningVenueWithTimeslots _$ScreeningVenueWithTimeslotsFromJson(
    Map<String, dynamic> json) {
  return _ScreeningVenueWithTimeslots.fromJson(json);
}

/// @nodoc
mixin _$ScreeningVenueWithTimeslots {
  ScreeningVenue get venue => throw _privateConstructorUsedError;
  List<ScreeningTimeslot> get timeslots => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningVenueWithTimeslotsCopyWith<ScreeningVenueWithTimeslots>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningVenueWithTimeslotsCopyWith<$Res> {
  factory $ScreeningVenueWithTimeslotsCopyWith(
          ScreeningVenueWithTimeslots value,
          $Res Function(ScreeningVenueWithTimeslots) then) =
      _$ScreeningVenueWithTimeslotsCopyWithImpl<$Res,
          ScreeningVenueWithTimeslots>;
  @useResult
  $Res call({ScreeningVenue venue, List<ScreeningTimeslot> timeslots});

  $ScreeningVenueCopyWith<$Res> get venue;
}

/// @nodoc
class _$ScreeningVenueWithTimeslotsCopyWithImpl<$Res,
        $Val extends ScreeningVenueWithTimeslots>
    implements $ScreeningVenueWithTimeslotsCopyWith<$Res> {
  _$ScreeningVenueWithTimeslotsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? venue = null,
    Object? timeslots = null,
  }) {
    return _then(_value.copyWith(
      venue: null == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as ScreeningVenue,
      timeslots: null == timeslots
          ? _value.timeslots
          : timeslots // ignore: cast_nullable_to_non_nullable
              as List<ScreeningTimeslot>,
    ) as $Val);
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
abstract class _$$ScreeningVenueWithTimeslotsImplCopyWith<$Res>
    implements $ScreeningVenueWithTimeslotsCopyWith<$Res> {
  factory _$$ScreeningVenueWithTimeslotsImplCopyWith(
          _$ScreeningVenueWithTimeslotsImpl value,
          $Res Function(_$ScreeningVenueWithTimeslotsImpl) then) =
      __$$ScreeningVenueWithTimeslotsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ScreeningVenue venue, List<ScreeningTimeslot> timeslots});

  @override
  $ScreeningVenueCopyWith<$Res> get venue;
}

/// @nodoc
class __$$ScreeningVenueWithTimeslotsImplCopyWithImpl<$Res>
    extends _$ScreeningVenueWithTimeslotsCopyWithImpl<$Res,
        _$ScreeningVenueWithTimeslotsImpl>
    implements _$$ScreeningVenueWithTimeslotsImplCopyWith<$Res> {
  __$$ScreeningVenueWithTimeslotsImplCopyWithImpl(
      _$ScreeningVenueWithTimeslotsImpl _value,
      $Res Function(_$ScreeningVenueWithTimeslotsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? venue = null,
    Object? timeslots = null,
  }) {
    return _then(_$ScreeningVenueWithTimeslotsImpl(
      venue: null == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as ScreeningVenue,
      timeslots: null == timeslots
          ? _value._timeslots
          : timeslots // ignore: cast_nullable_to_non_nullable
              as List<ScreeningTimeslot>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScreeningVenueWithTimeslotsImpl
    implements _ScreeningVenueWithTimeslots {
  const _$ScreeningVenueWithTimeslotsImpl(
      {required this.venue, required final List<ScreeningTimeslot> timeslots})
      : _timeslots = timeslots;

  factory _$ScreeningVenueWithTimeslotsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ScreeningVenueWithTimeslotsImplFromJson(json);

  @override
  final ScreeningVenue venue;
  final List<ScreeningTimeslot> _timeslots;
  @override
  List<ScreeningTimeslot> get timeslots {
    if (_timeslots is EqualUnmodifiableListView) return _timeslots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeslots);
  }

  @override
  String toString() {
    return 'ScreeningVenueWithTimeslots(venue: $venue, timeslots: $timeslots)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreeningVenueWithTimeslotsImpl &&
            (identical(other.venue, venue) || other.venue == venue) &&
            const DeepCollectionEquality()
                .equals(other._timeslots, _timeslots));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, venue, const DeepCollectionEquality().hash(_timeslots));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreeningVenueWithTimeslotsImplCopyWith<_$ScreeningVenueWithTimeslotsImpl>
      get copyWith => __$$ScreeningVenueWithTimeslotsImplCopyWithImpl<
          _$ScreeningVenueWithTimeslotsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScreeningVenueWithTimeslotsImplToJson(
      this,
    );
  }
}

abstract class _ScreeningVenueWithTimeslots
    implements ScreeningVenueWithTimeslots {
  const factory _ScreeningVenueWithTimeslots(
          {required final ScreeningVenue venue,
          required final List<ScreeningTimeslot> timeslots}) =
      _$ScreeningVenueWithTimeslotsImpl;

  factory _ScreeningVenueWithTimeslots.fromJson(Map<String, dynamic> json) =
      _$ScreeningVenueWithTimeslotsImpl.fromJson;

  @override
  ScreeningVenue get venue;
  @override
  List<ScreeningTimeslot> get timeslots;
  @override
  @JsonKey(ignore: true)
  _$$ScreeningVenueWithTimeslotsImplCopyWith<_$ScreeningVenueWithTimeslotsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
