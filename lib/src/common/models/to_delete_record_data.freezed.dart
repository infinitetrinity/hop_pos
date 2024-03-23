// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'to_delete_record_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToDeleteRecordData _$ToDeleteRecordDataFromJson(Map<String, dynamic> json) {
  return _ToDeleteRecordData.fromJson(json);
}

/// @nodoc
mixin _$ToDeleteRecordData {
  ToDeleteModels get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'model_id')
  String get modelId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToDeleteRecordDataCopyWith<ToDeleteRecordData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDeleteRecordDataCopyWith<$Res> {
  factory $ToDeleteRecordDataCopyWith(
          ToDeleteRecordData value, $Res Function(ToDeleteRecordData) then) =
      _$ToDeleteRecordDataCopyWithImpl<$Res, ToDeleteRecordData>;
  @useResult
  $Res call({ToDeleteModels model, @JsonKey(name: 'model_id') String modelId});
}

/// @nodoc
class _$ToDeleteRecordDataCopyWithImpl<$Res, $Val extends ToDeleteRecordData>
    implements $ToDeleteRecordDataCopyWith<$Res> {
  _$ToDeleteRecordDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? modelId = null,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ToDeleteModels,
      modelId: null == modelId
          ? _value.modelId
          : modelId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToDeleteRecordDataImplCopyWith<$Res>
    implements $ToDeleteRecordDataCopyWith<$Res> {
  factory _$$ToDeleteRecordDataImplCopyWith(_$ToDeleteRecordDataImpl value,
          $Res Function(_$ToDeleteRecordDataImpl) then) =
      __$$ToDeleteRecordDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ToDeleteModels model, @JsonKey(name: 'model_id') String modelId});
}

/// @nodoc
class __$$ToDeleteRecordDataImplCopyWithImpl<$Res>
    extends _$ToDeleteRecordDataCopyWithImpl<$Res, _$ToDeleteRecordDataImpl>
    implements _$$ToDeleteRecordDataImplCopyWith<$Res> {
  __$$ToDeleteRecordDataImplCopyWithImpl(_$ToDeleteRecordDataImpl _value,
      $Res Function(_$ToDeleteRecordDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? modelId = null,
  }) {
    return _then(_$ToDeleteRecordDataImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ToDeleteModels,
      modelId: null == modelId
          ? _value.modelId
          : modelId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToDeleteRecordDataImpl implements _ToDeleteRecordData {
  const _$ToDeleteRecordDataImpl(
      {required this.model, @JsonKey(name: 'model_id') required this.modelId});

  factory _$ToDeleteRecordDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToDeleteRecordDataImplFromJson(json);

  @override
  final ToDeleteModels model;
  @override
  @JsonKey(name: 'model_id')
  final String modelId;

  @override
  String toString() {
    return 'ToDeleteRecordData(model: $model, modelId: $modelId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToDeleteRecordDataImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.modelId, modelId) || other.modelId == modelId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, model, modelId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToDeleteRecordDataImplCopyWith<_$ToDeleteRecordDataImpl> get copyWith =>
      __$$ToDeleteRecordDataImplCopyWithImpl<_$ToDeleteRecordDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToDeleteRecordDataImplToJson(
      this,
    );
  }
}

abstract class _ToDeleteRecordData implements ToDeleteRecordData {
  const factory _ToDeleteRecordData(
          {required final ToDeleteModels model,
          @JsonKey(name: 'model_id') required final String modelId}) =
      _$ToDeleteRecordDataImpl;

  factory _ToDeleteRecordData.fromJson(Map<String, dynamic> json) =
      _$ToDeleteRecordDataImpl.fromJson;

  @override
  ToDeleteModels get model;
  @override
  @JsonKey(name: 'model_id')
  String get modelId;
  @override
  @JsonKey(ignore: true)
  _$$ToDeleteRecordDataImplCopyWith<_$ToDeleteRecordDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
