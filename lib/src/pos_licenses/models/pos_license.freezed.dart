// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_license.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PosLicense _$PosLicenseFromJson(Map<String, dynamic> json) {
  return _PosLicense.fromJson(json);
}

/// @nodoc
mixin _$PosLicense {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_prefix')
  String get invoicePrefix => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_key')
  String get licenseKey => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_activated')
  bool get isActivated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PosLicenseCopyWith<PosLicense> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosLicenseCopyWith<$Res> {
  factory $PosLicenseCopyWith(
          PosLicense value, $Res Function(PosLicense) then) =
      _$PosLicenseCopyWithImpl<$Res, PosLicense>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'invoice_prefix') String invoicePrefix,
      @JsonKey(name: 'license_key') String licenseKey,
      String password,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_activated') bool isActivated});
}

/// @nodoc
class _$PosLicenseCopyWithImpl<$Res, $Val extends PosLicense>
    implements $PosLicenseCopyWith<$Res> {
  _$PosLicenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? invoicePrefix = null,
    Object? licenseKey = null,
    Object? password = null,
    Object? isActive = null,
    Object? isActivated = null,
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
      invoicePrefix: null == invoicePrefix
          ? _value.invoicePrefix
          : invoicePrefix // ignore: cast_nullable_to_non_nullable
              as String,
      licenseKey: null == licenseKey
          ? _value.licenseKey
          : licenseKey // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isActivated: null == isActivated
          ? _value.isActivated
          : isActivated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PosLicenseImplCopyWith<$Res>
    implements $PosLicenseCopyWith<$Res> {
  factory _$$PosLicenseImplCopyWith(
          _$PosLicenseImpl value, $Res Function(_$PosLicenseImpl) then) =
      __$$PosLicenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'invoice_prefix') String invoicePrefix,
      @JsonKey(name: 'license_key') String licenseKey,
      String password,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_activated') bool isActivated});
}

/// @nodoc
class __$$PosLicenseImplCopyWithImpl<$Res>
    extends _$PosLicenseCopyWithImpl<$Res, _$PosLicenseImpl>
    implements _$$PosLicenseImplCopyWith<$Res> {
  __$$PosLicenseImplCopyWithImpl(
      _$PosLicenseImpl _value, $Res Function(_$PosLicenseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? invoicePrefix = null,
    Object? licenseKey = null,
    Object? password = null,
    Object? isActive = null,
    Object? isActivated = null,
  }) {
    return _then(_$PosLicenseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      invoicePrefix: null == invoicePrefix
          ? _value.invoicePrefix
          : invoicePrefix // ignore: cast_nullable_to_non_nullable
              as String,
      licenseKey: null == licenseKey
          ? _value.licenseKey
          : licenseKey // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isActivated: null == isActivated
          ? _value.isActivated
          : isActivated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PosLicenseImpl extends _PosLicense {
  const _$PosLicenseImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'invoice_prefix') required this.invoicePrefix,
      @JsonKey(name: 'license_key') required this.licenseKey,
      required this.password,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'is_activated') required this.isActivated})
      : super._();

  factory _$PosLicenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PosLicenseImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'invoice_prefix')
  final String invoicePrefix;
  @override
  @JsonKey(name: 'license_key')
  final String licenseKey;
  @override
  final String password;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'is_activated')
  final bool isActivated;

  @override
  String toString() {
    return 'PosLicense(id: $id, name: $name, invoicePrefix: $invoicePrefix, licenseKey: $licenseKey, password: $password, isActive: $isActive, isActivated: $isActivated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosLicenseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.invoicePrefix, invoicePrefix) ||
                other.invoicePrefix == invoicePrefix) &&
            (identical(other.licenseKey, licenseKey) ||
                other.licenseKey == licenseKey) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isActivated, isActivated) ||
                other.isActivated == isActivated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, invoicePrefix,
      licenseKey, password, isActive, isActivated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PosLicenseImplCopyWith<_$PosLicenseImpl> get copyWith =>
      __$$PosLicenseImplCopyWithImpl<_$PosLicenseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PosLicenseImplToJson(
      this,
    );
  }
}

abstract class _PosLicense extends PosLicense {
  const factory _PosLicense(
          {required final int id,
          required final String name,
          @JsonKey(name: 'invoice_prefix') required final String invoicePrefix,
          @JsonKey(name: 'license_key') required final String licenseKey,
          required final String password,
          @JsonKey(name: 'is_active') required final bool isActive,
          @JsonKey(name: 'is_activated') required final bool isActivated}) =
      _$PosLicenseImpl;
  const _PosLicense._() : super._();

  factory _PosLicense.fromJson(Map<String, dynamic> json) =
      _$PosLicenseImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'invoice_prefix')
  String get invoicePrefix;
  @override
  @JsonKey(name: 'license_key')
  String get licenseKey;
  @override
  String get password;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'is_activated')
  bool get isActivated;
  @override
  @JsonKey(ignore: true)
  _$$PosLicenseImplCopyWith<_$PosLicenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
