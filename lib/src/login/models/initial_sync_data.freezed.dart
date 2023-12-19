// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'initial_sync_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InitialSyncData {
  UsersTableCompanion get user => throw _privateConstructorUsedError;
  PosLicensesTableCompanion get posLicense =>
      throw _privateConstructorUsedError;
  CompanyTableCompanion get company => throw _privateConstructorUsedError;
  ReceiptSettingsTableCompanion get receiptSettings =>
      throw _privateConstructorUsedError;
  List<PosExtrasTableCompanion> get posExtras =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InitialSyncDataCopyWith<InitialSyncData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitialSyncDataCopyWith<$Res> {
  factory $InitialSyncDataCopyWith(
          InitialSyncData value, $Res Function(InitialSyncData) then) =
      _$InitialSyncDataCopyWithImpl<$Res, InitialSyncData>;
  @useResult
  $Res call(
      {UsersTableCompanion user,
      PosLicensesTableCompanion posLicense,
      CompanyTableCompanion company,
      ReceiptSettingsTableCompanion receiptSettings,
      List<PosExtrasTableCompanion> posExtras});
}

/// @nodoc
class _$InitialSyncDataCopyWithImpl<$Res, $Val extends InitialSyncData>
    implements $InitialSyncDataCopyWith<$Res> {
  _$InitialSyncDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? posLicense = freezed,
    Object? company = freezed,
    Object? receiptSettings = freezed,
    Object? posExtras = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UsersTableCompanion,
      posLicense: freezed == posLicense
          ? _value.posLicense
          : posLicense // ignore: cast_nullable_to_non_nullable
              as PosLicensesTableCompanion,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as CompanyTableCompanion,
      receiptSettings: freezed == receiptSettings
          ? _value.receiptSettings
          : receiptSettings // ignore: cast_nullable_to_non_nullable
              as ReceiptSettingsTableCompanion,
      posExtras: null == posExtras
          ? _value.posExtras
          : posExtras // ignore: cast_nullable_to_non_nullable
              as List<PosExtrasTableCompanion>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialSyncDataImplCopyWith<$Res>
    implements $InitialSyncDataCopyWith<$Res> {
  factory _$$InitialSyncDataImplCopyWith(_$InitialSyncDataImpl value,
          $Res Function(_$InitialSyncDataImpl) then) =
      __$$InitialSyncDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UsersTableCompanion user,
      PosLicensesTableCompanion posLicense,
      CompanyTableCompanion company,
      ReceiptSettingsTableCompanion receiptSettings,
      List<PosExtrasTableCompanion> posExtras});
}

/// @nodoc
class __$$InitialSyncDataImplCopyWithImpl<$Res>
    extends _$InitialSyncDataCopyWithImpl<$Res, _$InitialSyncDataImpl>
    implements _$$InitialSyncDataImplCopyWith<$Res> {
  __$$InitialSyncDataImplCopyWithImpl(
      _$InitialSyncDataImpl _value, $Res Function(_$InitialSyncDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? posLicense = freezed,
    Object? company = freezed,
    Object? receiptSettings = freezed,
    Object? posExtras = null,
  }) {
    return _then(_$InitialSyncDataImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UsersTableCompanion,
      posLicense: freezed == posLicense
          ? _value.posLicense
          : posLicense // ignore: cast_nullable_to_non_nullable
              as PosLicensesTableCompanion,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as CompanyTableCompanion,
      receiptSettings: freezed == receiptSettings
          ? _value.receiptSettings
          : receiptSettings // ignore: cast_nullable_to_non_nullable
              as ReceiptSettingsTableCompanion,
      posExtras: null == posExtras
          ? _value._posExtras
          : posExtras // ignore: cast_nullable_to_non_nullable
              as List<PosExtrasTableCompanion>,
    ));
  }
}

/// @nodoc

class _$InitialSyncDataImpl extends _InitialSyncData {
  const _$InitialSyncDataImpl(
      {required this.user,
      required this.posLicense,
      required this.company,
      required this.receiptSettings,
      required final List<PosExtrasTableCompanion> posExtras})
      : _posExtras = posExtras,
        super._();

  @override
  final UsersTableCompanion user;
  @override
  final PosLicensesTableCompanion posLicense;
  @override
  final CompanyTableCompanion company;
  @override
  final ReceiptSettingsTableCompanion receiptSettings;
  final List<PosExtrasTableCompanion> _posExtras;
  @override
  List<PosExtrasTableCompanion> get posExtras {
    if (_posExtras is EqualUnmodifiableListView) return _posExtras;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posExtras);
  }

  @override
  String toString() {
    return 'InitialSyncData(user: $user, posLicense: $posLicense, company: $company, receiptSettings: $receiptSettings, posExtras: $posExtras)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialSyncDataImpl &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.posLicense, posLicense) &&
            const DeepCollectionEquality().equals(other.company, company) &&
            const DeepCollectionEquality()
                .equals(other.receiptSettings, receiptSettings) &&
            const DeepCollectionEquality()
                .equals(other._posExtras, _posExtras));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(posLicense),
      const DeepCollectionEquality().hash(company),
      const DeepCollectionEquality().hash(receiptSettings),
      const DeepCollectionEquality().hash(_posExtras));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialSyncDataImplCopyWith<_$InitialSyncDataImpl> get copyWith =>
      __$$InitialSyncDataImplCopyWithImpl<_$InitialSyncDataImpl>(
          this, _$identity);
}

abstract class _InitialSyncData extends InitialSyncData {
  const factory _InitialSyncData(
          {required final UsersTableCompanion user,
          required final PosLicensesTableCompanion posLicense,
          required final CompanyTableCompanion company,
          required final ReceiptSettingsTableCompanion receiptSettings,
          required final List<PosExtrasTableCompanion> posExtras}) =
      _$InitialSyncDataImpl;
  const _InitialSyncData._() : super._();

  @override
  UsersTableCompanion get user;
  @override
  PosLicensesTableCompanion get posLicense;
  @override
  CompanyTableCompanion get company;
  @override
  ReceiptSettingsTableCompanion get receiptSettings;
  @override
  List<PosExtrasTableCompanion> get posExtras;
  @override
  @JsonKey(ignore: true)
  _$$InitialSyncDataImplCopyWith<_$InitialSyncDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
