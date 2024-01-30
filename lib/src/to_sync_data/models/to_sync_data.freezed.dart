// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'to_sync_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToSyncData _$ToSyncDataFromJson(Map<String, dynamic> json) {
  return _ToSyncData.fromJson(json);
}

/// @nodoc
mixin _$ToSyncData {
  int get id => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'model_id')
  int get modelId => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  Map<String, dynamic> get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToSyncDataCopyWith<ToSyncData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToSyncDataCopyWith<$Res> {
  factory $ToSyncDataCopyWith(
          ToSyncData value, $Res Function(ToSyncData) then) =
      _$ToSyncDataCopyWithImpl<$Res, ToSyncData>;
  @useResult
  $Res call(
      {int id,
      String model,
      @JsonKey(name: 'model_id') int modelId,
      String action,
      @JsonKey(name: 'created_at') DateTime createdAt,
      Map<String, dynamic> value});
}

/// @nodoc
class _$ToSyncDataCopyWithImpl<$Res, $Val extends ToSyncData>
    implements $ToSyncDataCopyWith<$Res> {
  _$ToSyncDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? model = null,
    Object? modelId = null,
    Object? action = null,
    Object? createdAt = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      modelId: null == modelId
          ? _value.modelId
          : modelId // ignore: cast_nullable_to_non_nullable
              as int,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToSyncDataImplCopyWith<$Res>
    implements $ToSyncDataCopyWith<$Res> {
  factory _$$ToSyncDataImplCopyWith(
          _$ToSyncDataImpl value, $Res Function(_$ToSyncDataImpl) then) =
      __$$ToSyncDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String model,
      @JsonKey(name: 'model_id') int modelId,
      String action,
      @JsonKey(name: 'created_at') DateTime createdAt,
      Map<String, dynamic> value});
}

/// @nodoc
class __$$ToSyncDataImplCopyWithImpl<$Res>
    extends _$ToSyncDataCopyWithImpl<$Res, _$ToSyncDataImpl>
    implements _$$ToSyncDataImplCopyWith<$Res> {
  __$$ToSyncDataImplCopyWithImpl(
      _$ToSyncDataImpl _value, $Res Function(_$ToSyncDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? model = null,
    Object? modelId = null,
    Object? action = null,
    Object? createdAt = null,
    Object? value = null,
  }) {
    return _then(_$ToSyncDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      modelId: null == modelId
          ? _value.modelId
          : modelId // ignore: cast_nullable_to_non_nullable
              as int,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToSyncDataImpl implements _ToSyncData {
  const _$ToSyncDataImpl(
      {required this.id,
      required this.model,
      @JsonKey(name: 'model_id') required this.modelId,
      required this.action,
      @JsonKey(name: 'created_at') required this.createdAt,
      required final Map<String, dynamic> value})
      : _value = value;

  factory _$ToSyncDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToSyncDataImplFromJson(json);

  @override
  final int id;
  @override
  final String model;
  @override
  @JsonKey(name: 'model_id')
  final int modelId;
  @override
  final String action;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final Map<String, dynamic> _value;
  @override
  Map<String, dynamic> get value {
    if (_value is EqualUnmodifiableMapView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_value);
  }

  @override
  String toString() {
    return 'ToSyncData(id: $id, model: $model, modelId: $modelId, action: $action, createdAt: $createdAt, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToSyncDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.modelId, modelId) || other.modelId == modelId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, model, modelId, action,
      createdAt, const DeepCollectionEquality().hash(_value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToSyncDataImplCopyWith<_$ToSyncDataImpl> get copyWith =>
      __$$ToSyncDataImplCopyWithImpl<_$ToSyncDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToSyncDataImplToJson(
      this,
    );
  }
}

abstract class _ToSyncData implements ToSyncData {
  const factory _ToSyncData(
      {required final int id,
      required final String model,
      @JsonKey(name: 'model_id') required final int modelId,
      required final String action,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      required final Map<String, dynamic> value}) = _$ToSyncDataImpl;

  factory _ToSyncData.fromJson(Map<String, dynamic> json) =
      _$ToSyncDataImpl.fromJson;

  @override
  int get id;
  @override
  String get model;
  @override
  @JsonKey(name: 'model_id')
  int get modelId;
  @override
  String get action;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  Map<String, dynamic> get value;
  @override
  @JsonKey(ignore: true)
  _$$ToSyncDataImplCopyWith<_$ToSyncDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
