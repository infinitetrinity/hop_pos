// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screening_with_timeslots.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningWithTimeslots _$ScreeningWithTimeslotsFromJson(
    Map<String, dynamic> json) {
  return _ScreeningWithTimeslots.fromJson(json);
}

/// @nodoc
mixin _$ScreeningWithTimeslots {
  Screening get screening => throw _privateConstructorUsedError;
  List<ScreeningTimeslot> get timeslots => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningWithTimeslotsCopyWith<ScreeningWithTimeslots> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningWithTimeslotsCopyWith<$Res> {
  factory $ScreeningWithTimeslotsCopyWith(ScreeningWithTimeslots value,
          $Res Function(ScreeningWithTimeslots) then) =
      _$ScreeningWithTimeslotsCopyWithImpl<$Res, ScreeningWithTimeslots>;
  @useResult
  $Res call({Screening screening, List<ScreeningTimeslot> timeslots});

  $ScreeningCopyWith<$Res> get screening;
}

/// @nodoc
class _$ScreeningWithTimeslotsCopyWithImpl<$Res,
        $Val extends ScreeningWithTimeslots>
    implements $ScreeningWithTimeslotsCopyWith<$Res> {
  _$ScreeningWithTimeslotsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screening = null,
    Object? timeslots = null,
  }) {
    return _then(_value.copyWith(
      screening: null == screening
          ? _value.screening
          : screening // ignore: cast_nullable_to_non_nullable
              as Screening,
      timeslots: null == timeslots
          ? _value.timeslots
          : timeslots // ignore: cast_nullable_to_non_nullable
              as List<ScreeningTimeslot>,
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
abstract class _$$ScreeningWithTimeslotsImplCopyWith<$Res>
    implements $ScreeningWithTimeslotsCopyWith<$Res> {
  factory _$$ScreeningWithTimeslotsImplCopyWith(
          _$ScreeningWithTimeslotsImpl value,
          $Res Function(_$ScreeningWithTimeslotsImpl) then) =
      __$$ScreeningWithTimeslotsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Screening screening, List<ScreeningTimeslot> timeslots});

  @override
  $ScreeningCopyWith<$Res> get screening;
}

/// @nodoc
class __$$ScreeningWithTimeslotsImplCopyWithImpl<$Res>
    extends _$ScreeningWithTimeslotsCopyWithImpl<$Res,
        _$ScreeningWithTimeslotsImpl>
    implements _$$ScreeningWithTimeslotsImplCopyWith<$Res> {
  __$$ScreeningWithTimeslotsImplCopyWithImpl(
      _$ScreeningWithTimeslotsImpl _value,
      $Res Function(_$ScreeningWithTimeslotsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screening = null,
    Object? timeslots = null,
  }) {
    return _then(_$ScreeningWithTimeslotsImpl(
      screening: null == screening
          ? _value.screening
          : screening // ignore: cast_nullable_to_non_nullable
              as Screening,
      timeslots: null == timeslots
          ? _value._timeslots
          : timeslots // ignore: cast_nullable_to_non_nullable
              as List<ScreeningTimeslot>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScreeningWithTimeslotsImpl implements _ScreeningWithTimeslots {
  const _$ScreeningWithTimeslotsImpl(
      {required this.screening,
      required final List<ScreeningTimeslot> timeslots})
      : _timeslots = timeslots;

  factory _$ScreeningWithTimeslotsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScreeningWithTimeslotsImplFromJson(json);

  @override
  final Screening screening;
  final List<ScreeningTimeslot> _timeslots;
  @override
  List<ScreeningTimeslot> get timeslots {
    if (_timeslots is EqualUnmodifiableListView) return _timeslots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeslots);
  }

  @override
  String toString() {
    return 'ScreeningWithTimeslots(screening: $screening, timeslots: $timeslots)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreeningWithTimeslotsImpl &&
            (identical(other.screening, screening) ||
                other.screening == screening) &&
            const DeepCollectionEquality()
                .equals(other._timeslots, _timeslots));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, screening, const DeepCollectionEquality().hash(_timeslots));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreeningWithTimeslotsImplCopyWith<_$ScreeningWithTimeslotsImpl>
      get copyWith => __$$ScreeningWithTimeslotsImplCopyWithImpl<
          _$ScreeningWithTimeslotsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScreeningWithTimeslotsImplToJson(
      this,
    );
  }
}

abstract class _ScreeningWithTimeslots implements ScreeningWithTimeslots {
  const factory _ScreeningWithTimeslots(
          {required final Screening screening,
          required final List<ScreeningTimeslot> timeslots}) =
      _$ScreeningWithTimeslotsImpl;

  factory _ScreeningWithTimeslots.fromJson(Map<String, dynamic> json) =
      _$ScreeningWithTimeslotsImpl.fromJson;

  @override
  Screening get screening;
  @override
  List<ScreeningTimeslot> get timeslots;
  @override
  @JsonKey(ignore: true)
  _$$ScreeningWithTimeslotsImplCopyWith<_$ScreeningWithTimeslotsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
