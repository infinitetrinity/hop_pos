// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_server_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SyncServerData _$SyncServerDataFromJson(Map<String, dynamic> json) {
  return _SyncServerData.fromJson(json);
}

/// @nodoc
mixin _$SyncServerData {
  @JsonKey(name: 'license_key')
  String get licenseKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_sync')
  DateTime get lastSync => throw _privateConstructorUsedError;
  @JsonKey(name: 'new_records')
  SyncNewRecordData get newRecords => throw _privateConstructorUsedError;
  @JsonKey(name: 'sync_records')
  List<ToSyncData> get syncRecords => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncServerDataCopyWith<SyncServerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncServerDataCopyWith<$Res> {
  factory $SyncServerDataCopyWith(
          SyncServerData value, $Res Function(SyncServerData) then) =
      _$SyncServerDataCopyWithImpl<$Res, SyncServerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'license_key') String licenseKey,
      @JsonKey(name: 'last_sync') DateTime lastSync,
      @JsonKey(name: 'new_records') SyncNewRecordData newRecords,
      @JsonKey(name: 'sync_records') List<ToSyncData> syncRecords});

  $SyncNewRecordDataCopyWith<$Res> get newRecords;
}

/// @nodoc
class _$SyncServerDataCopyWithImpl<$Res, $Val extends SyncServerData>
    implements $SyncServerDataCopyWith<$Res> {
  _$SyncServerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licenseKey = null,
    Object? lastSync = null,
    Object? newRecords = null,
    Object? syncRecords = null,
  }) {
    return _then(_value.copyWith(
      licenseKey: null == licenseKey
          ? _value.licenseKey
          : licenseKey // ignore: cast_nullable_to_non_nullable
              as String,
      lastSync: null == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as DateTime,
      newRecords: null == newRecords
          ? _value.newRecords
          : newRecords // ignore: cast_nullable_to_non_nullable
              as SyncNewRecordData,
      syncRecords: null == syncRecords
          ? _value.syncRecords
          : syncRecords // ignore: cast_nullable_to_non_nullable
              as List<ToSyncData>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SyncNewRecordDataCopyWith<$Res> get newRecords {
    return $SyncNewRecordDataCopyWith<$Res>(_value.newRecords, (value) {
      return _then(_value.copyWith(newRecords: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SyncServerDataImplCopyWith<$Res>
    implements $SyncServerDataCopyWith<$Res> {
  factory _$$SyncServerDataImplCopyWith(_$SyncServerDataImpl value,
          $Res Function(_$SyncServerDataImpl) then) =
      __$$SyncServerDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'license_key') String licenseKey,
      @JsonKey(name: 'last_sync') DateTime lastSync,
      @JsonKey(name: 'new_records') SyncNewRecordData newRecords,
      @JsonKey(name: 'sync_records') List<ToSyncData> syncRecords});

  @override
  $SyncNewRecordDataCopyWith<$Res> get newRecords;
}

/// @nodoc
class __$$SyncServerDataImplCopyWithImpl<$Res>
    extends _$SyncServerDataCopyWithImpl<$Res, _$SyncServerDataImpl>
    implements _$$SyncServerDataImplCopyWith<$Res> {
  __$$SyncServerDataImplCopyWithImpl(
      _$SyncServerDataImpl _value, $Res Function(_$SyncServerDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licenseKey = null,
    Object? lastSync = null,
    Object? newRecords = null,
    Object? syncRecords = null,
  }) {
    return _then(_$SyncServerDataImpl(
      licenseKey: null == licenseKey
          ? _value.licenseKey
          : licenseKey // ignore: cast_nullable_to_non_nullable
              as String,
      lastSync: null == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as DateTime,
      newRecords: null == newRecords
          ? _value.newRecords
          : newRecords // ignore: cast_nullable_to_non_nullable
              as SyncNewRecordData,
      syncRecords: null == syncRecords
          ? _value._syncRecords
          : syncRecords // ignore: cast_nullable_to_non_nullable
              as List<ToSyncData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncServerDataImpl implements _SyncServerData {
  const _$SyncServerDataImpl(
      {@JsonKey(name: 'license_key') required this.licenseKey,
      @JsonKey(name: 'last_sync') required this.lastSync,
      @JsonKey(name: 'new_records') required this.newRecords,
      @JsonKey(name: 'sync_records')
      required final List<ToSyncData> syncRecords})
      : _syncRecords = syncRecords;

  factory _$SyncServerDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncServerDataImplFromJson(json);

  @override
  @JsonKey(name: 'license_key')
  final String licenseKey;
  @override
  @JsonKey(name: 'last_sync')
  final DateTime lastSync;
  @override
  @JsonKey(name: 'new_records')
  final SyncNewRecordData newRecords;
  final List<ToSyncData> _syncRecords;
  @override
  @JsonKey(name: 'sync_records')
  List<ToSyncData> get syncRecords {
    if (_syncRecords is EqualUnmodifiableListView) return _syncRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_syncRecords);
  }

  @override
  String toString() {
    return 'SyncServerData(licenseKey: $licenseKey, lastSync: $lastSync, newRecords: $newRecords, syncRecords: $syncRecords)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncServerDataImpl &&
            (identical(other.licenseKey, licenseKey) ||
                other.licenseKey == licenseKey) &&
            (identical(other.lastSync, lastSync) ||
                other.lastSync == lastSync) &&
            (identical(other.newRecords, newRecords) ||
                other.newRecords == newRecords) &&
            const DeepCollectionEquality()
                .equals(other._syncRecords, _syncRecords));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, licenseKey, lastSync, newRecords,
      const DeepCollectionEquality().hash(_syncRecords));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncServerDataImplCopyWith<_$SyncServerDataImpl> get copyWith =>
      __$$SyncServerDataImplCopyWithImpl<_$SyncServerDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncServerDataImplToJson(
      this,
    );
  }
}

abstract class _SyncServerData implements SyncServerData {
  const factory _SyncServerData(
      {@JsonKey(name: 'license_key') required final String licenseKey,
      @JsonKey(name: 'last_sync') required final DateTime lastSync,
      @JsonKey(name: 'new_records') required final SyncNewRecordData newRecords,
      @JsonKey(name: 'sync_records')
      required final List<ToSyncData> syncRecords}) = _$SyncServerDataImpl;

  factory _SyncServerData.fromJson(Map<String, dynamic> json) =
      _$SyncServerDataImpl.fromJson;

  @override
  @JsonKey(name: 'license_key')
  String get licenseKey;
  @override
  @JsonKey(name: 'last_sync')
  DateTime get lastSync;
  @override
  @JsonKey(name: 'new_records')
  SyncNewRecordData get newRecords;
  @override
  @JsonKey(name: 'sync_records')
  List<ToSyncData> get syncRecords;
  @override
  @JsonKey(ignore: true)
  _$$SyncServerDataImplCopyWith<_$SyncServerDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
