// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screening_with_venues_and_timeslots.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningWithVenuesAndTimeslots _$ScreeningWithVenuesAndTimeslotsFromJson(
    Map<String, dynamic> json) {
  return _ScreeningWithVenuesAndTimeslots.fromJson(json);
}

/// @nodoc
mixin _$ScreeningWithVenuesAndTimeslots {
  Screening get screening => throw _privateConstructorUsedError;
  List<ScreeningVenueWithTimeslots> get venuesWithTimeslots =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningWithVenuesAndTimeslotsCopyWith<ScreeningWithVenuesAndTimeslots>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningWithVenuesAndTimeslotsCopyWith<$Res> {
  factory $ScreeningWithVenuesAndTimeslotsCopyWith(
          ScreeningWithVenuesAndTimeslots value,
          $Res Function(ScreeningWithVenuesAndTimeslots) then) =
      _$ScreeningWithVenuesAndTimeslotsCopyWithImpl<$Res,
          ScreeningWithVenuesAndTimeslots>;
  @useResult
  $Res call(
      {Screening screening,
      List<ScreeningVenueWithTimeslots> venuesWithTimeslots});

  $ScreeningCopyWith<$Res> get screening;
}

/// @nodoc
class _$ScreeningWithVenuesAndTimeslotsCopyWithImpl<$Res,
        $Val extends ScreeningWithVenuesAndTimeslots>
    implements $ScreeningWithVenuesAndTimeslotsCopyWith<$Res> {
  _$ScreeningWithVenuesAndTimeslotsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screening = null,
    Object? venuesWithTimeslots = null,
  }) {
    return _then(_value.copyWith(
      screening: null == screening
          ? _value.screening
          : screening // ignore: cast_nullable_to_non_nullable
              as Screening,
      venuesWithTimeslots: null == venuesWithTimeslots
          ? _value.venuesWithTimeslots
          : venuesWithTimeslots // ignore: cast_nullable_to_non_nullable
              as List<ScreeningVenueWithTimeslots>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScreeningCopyWith<$Res> get screening {
    return $ScreeningCopyWith<$Res>(_value.screening, (value) {
      return _then(_value.copyWith(screening: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScreeningWithVenuesAndTimeslotsImplCopyWith<$Res>
    implements $ScreeningWithVenuesAndTimeslotsCopyWith<$Res> {
  factory _$$ScreeningWithVenuesAndTimeslotsImplCopyWith(
          _$ScreeningWithVenuesAndTimeslotsImpl value,
          $Res Function(_$ScreeningWithVenuesAndTimeslotsImpl) then) =
      __$$ScreeningWithVenuesAndTimeslotsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Screening screening,
      List<ScreeningVenueWithTimeslots> venuesWithTimeslots});

  @override
  $ScreeningCopyWith<$Res> get screening;
}

/// @nodoc
class __$$ScreeningWithVenuesAndTimeslotsImplCopyWithImpl<$Res>
    extends _$ScreeningWithVenuesAndTimeslotsCopyWithImpl<$Res,
        _$ScreeningWithVenuesAndTimeslotsImpl>
    implements _$$ScreeningWithVenuesAndTimeslotsImplCopyWith<$Res> {
  __$$ScreeningWithVenuesAndTimeslotsImplCopyWithImpl(
      _$ScreeningWithVenuesAndTimeslotsImpl _value,
      $Res Function(_$ScreeningWithVenuesAndTimeslotsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screening = null,
    Object? venuesWithTimeslots = null,
  }) {
    return _then(_$ScreeningWithVenuesAndTimeslotsImpl(
      screening: null == screening
          ? _value.screening
          : screening // ignore: cast_nullable_to_non_nullable
              as Screening,
      venuesWithTimeslots: null == venuesWithTimeslots
          ? _value._venuesWithTimeslots
          : venuesWithTimeslots // ignore: cast_nullable_to_non_nullable
              as List<ScreeningVenueWithTimeslots>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScreeningWithVenuesAndTimeslotsImpl
    extends _ScreeningWithVenuesAndTimeslots {
  const _$ScreeningWithVenuesAndTimeslotsImpl(
      {required this.screening,
      required final List<ScreeningVenueWithTimeslots> venuesWithTimeslots})
      : _venuesWithTimeslots = venuesWithTimeslots,
        super._();

  factory _$ScreeningWithVenuesAndTimeslotsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ScreeningWithVenuesAndTimeslotsImplFromJson(json);

  @override
  final Screening screening;
  final List<ScreeningVenueWithTimeslots> _venuesWithTimeslots;
  @override
  List<ScreeningVenueWithTimeslots> get venuesWithTimeslots {
    if (_venuesWithTimeslots is EqualUnmodifiableListView)
      return _venuesWithTimeslots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_venuesWithTimeslots);
  }

  @override
  String toString() {
    return 'ScreeningWithVenuesAndTimeslots(screening: $screening, venuesWithTimeslots: $venuesWithTimeslots)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreeningWithVenuesAndTimeslotsImpl &&
            (identical(other.screening, screening) ||
                other.screening == screening) &&
            const DeepCollectionEquality()
                .equals(other._venuesWithTimeslots, _venuesWithTimeslots));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, screening,
      const DeepCollectionEquality().hash(_venuesWithTimeslots));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreeningWithVenuesAndTimeslotsImplCopyWith<
          _$ScreeningWithVenuesAndTimeslotsImpl>
      get copyWith => __$$ScreeningWithVenuesAndTimeslotsImplCopyWithImpl<
          _$ScreeningWithVenuesAndTimeslotsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScreeningWithVenuesAndTimeslotsImplToJson(
      this,
    );
  }
}

abstract class _ScreeningWithVenuesAndTimeslots
    extends ScreeningWithVenuesAndTimeslots {
  const factory _ScreeningWithVenuesAndTimeslots(
      {required final Screening screening,
      required final List<ScreeningVenueWithTimeslots>
          venuesWithTimeslots}) = _$ScreeningWithVenuesAndTimeslotsImpl;
  const _ScreeningWithVenuesAndTimeslots._() : super._();

  factory _ScreeningWithVenuesAndTimeslots.fromJson(Map<String, dynamic> json) =
      _$ScreeningWithVenuesAndTimeslotsImpl.fromJson;

  @override
  Screening get screening;
  @override
  List<ScreeningVenueWithTimeslots> get venuesWithTimeslots;
  @override
  @JsonKey(ignore: true)
  _$$ScreeningWithVenuesAndTimeslotsImplCopyWith<
          _$ScreeningWithVenuesAndTimeslotsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
