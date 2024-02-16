// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screening_venue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningVenue _$ScreeningVenueFromJson(Map<String, dynamic> json) {
  return _ScreeningVenue.fromJson(json);
}

/// @nodoc
mixin _$ScreeningVenue {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_address')
  String? get fullAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'screening_form_id')
  int get screeningFormId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningVenueCopyWith<ScreeningVenue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningVenueCopyWith<$Res> {
  factory $ScreeningVenueCopyWith(
          ScreeningVenue value, $Res Function(ScreeningVenue) then) =
      _$ScreeningVenueCopyWithImpl<$Res, ScreeningVenue>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'full_address') String? fullAddress,
      @JsonKey(name: 'screening_form_id') int screeningFormId});
}

/// @nodoc
class _$ScreeningVenueCopyWithImpl<$Res, $Val extends ScreeningVenue>
    implements $ScreeningVenueCopyWith<$Res> {
  _$ScreeningVenueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fullAddress = freezed,
    Object? screeningFormId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fullAddress: freezed == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      screeningFormId: null == screeningFormId
          ? _value.screeningFormId
          : screeningFormId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScreeningVenueImplCopyWith<$Res>
    implements $ScreeningVenueCopyWith<$Res> {
  factory _$$ScreeningVenueImplCopyWith(_$ScreeningVenueImpl value,
          $Res Function(_$ScreeningVenueImpl) then) =
      __$$ScreeningVenueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'full_address') String? fullAddress,
      @JsonKey(name: 'screening_form_id') int screeningFormId});
}

/// @nodoc
class __$$ScreeningVenueImplCopyWithImpl<$Res>
    extends _$ScreeningVenueCopyWithImpl<$Res, _$ScreeningVenueImpl>
    implements _$$ScreeningVenueImplCopyWith<$Res> {
  __$$ScreeningVenueImplCopyWithImpl(
      _$ScreeningVenueImpl _value, $Res Function(_$ScreeningVenueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fullAddress = freezed,
    Object? screeningFormId = null,
  }) {
    return _then(_$ScreeningVenueImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fullAddress: freezed == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      screeningFormId: null == screeningFormId
          ? _value.screeningFormId
          : screeningFormId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScreeningVenueImpl extends _ScreeningVenue {
  const _$ScreeningVenueImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'full_address') this.fullAddress,
      @JsonKey(name: 'screening_form_id') required this.screeningFormId})
      : super._();

  factory _$ScreeningVenueImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScreeningVenueImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'full_address')
  final String? fullAddress;
  @override
  @JsonKey(name: 'screening_form_id')
  final int screeningFormId;

  @override
  String toString() {
    return 'ScreeningVenue(id: $id, name: $name, fullAddress: $fullAddress, screeningFormId: $screeningFormId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreeningVenueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.screeningFormId, screeningFormId) ||
                other.screeningFormId == screeningFormId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, fullAddress, screeningFormId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreeningVenueImplCopyWith<_$ScreeningVenueImpl> get copyWith =>
      __$$ScreeningVenueImplCopyWithImpl<_$ScreeningVenueImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScreeningVenueImplToJson(
      this,
    );
  }
}

abstract class _ScreeningVenue extends ScreeningVenue {
  const factory _ScreeningVenue(
      {required final int id,
      required final String name,
      @JsonKey(name: 'full_address') final String? fullAddress,
      @JsonKey(name: 'screening_form_id')
      required final int screeningFormId}) = _$ScreeningVenueImpl;
  const _ScreeningVenue._() : super._();

  factory _ScreeningVenue.fromJson(Map<String, dynamic> json) =
      _$ScreeningVenueImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'full_address')
  String? get fullAddress;
  @override
  @JsonKey(name: 'screening_form_id')
  int get screeningFormId;
  @override
  @JsonKey(ignore: true)
  _$$ScreeningVenueImplCopyWith<_$ScreeningVenueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
