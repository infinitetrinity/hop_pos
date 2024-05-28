// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screening.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Screening _$ScreeningFromJson(Map<String, dynamic> json) {
  return _Screening.fromJson(json);
}

/// @nodoc
mixin _$Screening {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get corporate => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_whitecoat_screening')
  bool? get isWhitecoatScreening => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningCopyWith<Screening> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningCopyWith<$Res> {
  factory $ScreeningCopyWith(Screening value, $Res Function(Screening) then) =
      _$ScreeningCopyWithImpl<$Res, Screening>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? corporate,
      @JsonKey(name: 'is_whitecoat_screening') bool? isWhitecoatScreening});
}

/// @nodoc
class _$ScreeningCopyWithImpl<$Res, $Val extends Screening>
    implements $ScreeningCopyWith<$Res> {
  _$ScreeningCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? corporate = freezed,
    Object? isWhitecoatScreening = freezed,
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
      corporate: freezed == corporate
          ? _value.corporate
          : corporate // ignore: cast_nullable_to_non_nullable
              as String?,
      isWhitecoatScreening: freezed == isWhitecoatScreening
          ? _value.isWhitecoatScreening
          : isWhitecoatScreening // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScreeningImplCopyWith<$Res>
    implements $ScreeningCopyWith<$Res> {
  factory _$$ScreeningImplCopyWith(
          _$ScreeningImpl value, $Res Function(_$ScreeningImpl) then) =
      __$$ScreeningImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? corporate,
      @JsonKey(name: 'is_whitecoat_screening') bool? isWhitecoatScreening});
}

/// @nodoc
class __$$ScreeningImplCopyWithImpl<$Res>
    extends _$ScreeningCopyWithImpl<$Res, _$ScreeningImpl>
    implements _$$ScreeningImplCopyWith<$Res> {
  __$$ScreeningImplCopyWithImpl(
      _$ScreeningImpl _value, $Res Function(_$ScreeningImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? corporate = freezed,
    Object? isWhitecoatScreening = freezed,
  }) {
    return _then(_$ScreeningImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      corporate: freezed == corporate
          ? _value.corporate
          : corporate // ignore: cast_nullable_to_non_nullable
              as String?,
      isWhitecoatScreening: freezed == isWhitecoatScreening
          ? _value.isWhitecoatScreening
          : isWhitecoatScreening // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScreeningImpl extends _Screening {
  const _$ScreeningImpl(
      {required this.id,
      required this.name,
      this.corporate,
      @JsonKey(name: 'is_whitecoat_screening') this.isWhitecoatScreening})
      : super._();

  factory _$ScreeningImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScreeningImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? corporate;
  @override
  @JsonKey(name: 'is_whitecoat_screening')
  final bool? isWhitecoatScreening;

  @override
  String toString() {
    return 'Screening(id: $id, name: $name, corporate: $corporate, isWhitecoatScreening: $isWhitecoatScreening)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreeningImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.corporate, corporate) ||
                other.corporate == corporate) &&
            (identical(other.isWhitecoatScreening, isWhitecoatScreening) ||
                other.isWhitecoatScreening == isWhitecoatScreening));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, corporate, isWhitecoatScreening);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreeningImplCopyWith<_$ScreeningImpl> get copyWith =>
      __$$ScreeningImplCopyWithImpl<_$ScreeningImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScreeningImplToJson(
      this,
    );
  }
}

abstract class _Screening extends Screening {
  const factory _Screening(
      {required final int id,
      required final String name,
      final String? corporate,
      @JsonKey(name: 'is_whitecoat_screening')
      final bool? isWhitecoatScreening}) = _$ScreeningImpl;
  const _Screening._() : super._();

  factory _Screening.fromJson(Map<String, dynamic> json) =
      _$ScreeningImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get corporate;
  @override
  @JsonKey(name: 'is_whitecoat_screening')
  bool? get isWhitecoatScreening;
  @override
  @JsonKey(ignore: true)
  _$$ScreeningImplCopyWith<_$ScreeningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
