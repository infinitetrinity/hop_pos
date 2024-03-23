// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_server_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyncServerDataImpl _$$SyncServerDataImplFromJson(Map<String, dynamic> json) =>
    _$SyncServerDataImpl(
      licenseKey: json['license_key'] as String,
      lastSync: DateTime.parse(json['last_sync'] as String),
      newRecords: SyncNewRecordData.fromJson(
          json['new_records'] as Map<String, dynamic>),
      syncRecords: (json['sync_records'] as List<dynamic>)
          .map((e) => ToSyncData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SyncServerDataImplToJson(
        _$SyncServerDataImpl instance) =>
    <String, dynamic>{
      'license_key': instance.licenseKey,
      'last_sync': instance.lastSync.toIso8601String(),
      'new_records': instance.newRecords,
      'sync_records': instance.syncRecords,
    };
