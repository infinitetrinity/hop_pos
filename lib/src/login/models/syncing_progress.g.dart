// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syncing_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyncingProgressImpl _$$SyncingProgressImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncingProgressImpl(
      isSyncing: json['isSyncing'] as bool,
      currentPage: json['currentPage'] as int,
      lastPage: json['lastPage'] as int,
    );

Map<String, dynamic> _$$SyncingProgressImplToJson(
        _$SyncingProgressImpl instance) =>
    <String, dynamic>{
      'isSyncing': instance.isSyncing,
      'currentPage': instance.currentPage,
      'lastPage': instance.lastPage,
    };
