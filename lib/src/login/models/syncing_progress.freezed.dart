// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'syncing_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SyncingProgress _$SyncingProgressFromJson(Map<String, dynamic> json) {
  return _SyncingProgress.fromJson(json);
}

/// @nodoc
mixin _$SyncingProgress {
  bool get isSyncing => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncingProgressCopyWith<SyncingProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncingProgressCopyWith<$Res> {
  factory $SyncingProgressCopyWith(
          SyncingProgress value, $Res Function(SyncingProgress) then) =
      _$SyncingProgressCopyWithImpl<$Res, SyncingProgress>;
  @useResult
  $Res call({bool isSyncing, int currentPage, int lastPage});
}

/// @nodoc
class _$SyncingProgressCopyWithImpl<$Res, $Val extends SyncingProgress>
    implements $SyncingProgressCopyWith<$Res> {
  _$SyncingProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSyncing = null,
    Object? currentPage = null,
    Object? lastPage = null,
  }) {
    return _then(_value.copyWith(
      isSyncing: null == isSyncing
          ? _value.isSyncing
          : isSyncing // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncingProgressImplCopyWith<$Res>
    implements $SyncingProgressCopyWith<$Res> {
  factory _$$SyncingProgressImplCopyWith(_$SyncingProgressImpl value,
          $Res Function(_$SyncingProgressImpl) then) =
      __$$SyncingProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSyncing, int currentPage, int lastPage});
}

/// @nodoc
class __$$SyncingProgressImplCopyWithImpl<$Res>
    extends _$SyncingProgressCopyWithImpl<$Res, _$SyncingProgressImpl>
    implements _$$SyncingProgressImplCopyWith<$Res> {
  __$$SyncingProgressImplCopyWithImpl(
      _$SyncingProgressImpl _value, $Res Function(_$SyncingProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSyncing = null,
    Object? currentPage = null,
    Object? lastPage = null,
  }) {
    return _then(_$SyncingProgressImpl(
      isSyncing: null == isSyncing
          ? _value.isSyncing
          : isSyncing // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncingProgressImpl extends _SyncingProgress {
  const _$SyncingProgressImpl(
      {required this.isSyncing,
      required this.currentPage,
      required this.lastPage})
      : super._();

  factory _$SyncingProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncingProgressImplFromJson(json);

  @override
  final bool isSyncing;
  @override
  final int currentPage;
  @override
  final int lastPage;

  @override
  String toString() {
    return 'SyncingProgress(isSyncing: $isSyncing, currentPage: $currentPage, lastPage: $lastPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncingProgressImpl &&
            (identical(other.isSyncing, isSyncing) ||
                other.isSyncing == isSyncing) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isSyncing, currentPage, lastPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncingProgressImplCopyWith<_$SyncingProgressImpl> get copyWith =>
      __$$SyncingProgressImplCopyWithImpl<_$SyncingProgressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncingProgressImplToJson(
      this,
    );
  }
}

abstract class _SyncingProgress extends SyncingProgress {
  const factory _SyncingProgress(
      {required final bool isSyncing,
      required final int currentPage,
      required final int lastPage}) = _$SyncingProgressImpl;
  const _SyncingProgress._() : super._();

  factory _SyncingProgress.fromJson(Map<String, dynamic> json) =
      _$SyncingProgressImpl.fromJson;

  @override
  bool get isSyncing;
  @override
  int get currentPage;
  @override
  int get lastPage;
  @override
  @JsonKey(ignore: true)
  _$$SyncingProgressImplCopyWith<_$SyncingProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
