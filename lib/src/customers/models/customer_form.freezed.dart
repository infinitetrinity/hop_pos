// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerForm _$CustomerFormFromJson(Map<String, dynamic> json) {
  return _CustomerForm.fromJson(json);
}

/// @nodoc
mixin _$CustomerForm {
  int? get id => throw _privateConstructorUsedError;
  String? get nric => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_no')
  String? get mobileNo => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  DateTime? get dob => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerFormCopyWith<CustomerForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerFormCopyWith<$Res> {
  factory $CustomerFormCopyWith(
          CustomerForm value, $Res Function(CustomerForm) then) =
      _$CustomerFormCopyWithImpl<$Res, CustomerForm>;
  @useResult
  $Res call(
      {int? id,
      String? nric,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'mobile_no') String? mobileNo,
      String? gender,
      String? email,
      DateTime? dob});
}

/// @nodoc
class _$CustomerFormCopyWithImpl<$Res, $Val extends CustomerForm>
    implements $CustomerFormCopyWith<$Res> {
  _$CustomerFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nric = freezed,
    Object? fullName = freezed,
    Object? mobileNo = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? dob = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nric: freezed == nric
          ? _value.nric
          : nric // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerFormImplCopyWith<$Res>
    implements $CustomerFormCopyWith<$Res> {
  factory _$$CustomerFormImplCopyWith(
          _$CustomerFormImpl value, $Res Function(_$CustomerFormImpl) then) =
      __$$CustomerFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? nric,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'mobile_no') String? mobileNo,
      String? gender,
      String? email,
      DateTime? dob});
}

/// @nodoc
class __$$CustomerFormImplCopyWithImpl<$Res>
    extends _$CustomerFormCopyWithImpl<$Res, _$CustomerFormImpl>
    implements _$$CustomerFormImplCopyWith<$Res> {
  __$$CustomerFormImplCopyWithImpl(
      _$CustomerFormImpl _value, $Res Function(_$CustomerFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nric = freezed,
    Object? fullName = freezed,
    Object? mobileNo = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? dob = freezed,
  }) {
    return _then(_$CustomerFormImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nric: freezed == nric
          ? _value.nric
          : nric // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerFormImpl extends _CustomerForm {
  const _$CustomerFormImpl(
      {this.id,
      this.nric,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'mobile_no') this.mobileNo,
      this.gender,
      this.email,
      this.dob})
      : super._();

  factory _$CustomerFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerFormImplFromJson(json);

  @override
  final int? id;
  @override
  final String? nric;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'mobile_no')
  final String? mobileNo;
  @override
  final String? gender;
  @override
  final String? email;
  @override
  final DateTime? dob;

  @override
  String toString() {
    return 'CustomerForm(id: $id, nric: $nric, fullName: $fullName, mobileNo: $mobileNo, gender: $gender, email: $email, dob: $dob)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerFormImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nric, nric) || other.nric == nric) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.dob, dob) || other.dob == dob));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, nric, fullName, mobileNo, gender, email, dob);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerFormImplCopyWith<_$CustomerFormImpl> get copyWith =>
      __$$CustomerFormImplCopyWithImpl<_$CustomerFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerFormImplToJson(
      this,
    );
  }
}

abstract class _CustomerForm extends CustomerForm {
  const factory _CustomerForm(
      {final int? id,
      final String? nric,
      @JsonKey(name: 'full_name') final String? fullName,
      @JsonKey(name: 'mobile_no') final String? mobileNo,
      final String? gender,
      final String? email,
      final DateTime? dob}) = _$CustomerFormImpl;
  const _CustomerForm._() : super._();

  factory _CustomerForm.fromJson(Map<String, dynamic> json) =
      _$CustomerFormImpl.fromJson;

  @override
  int? get id;
  @override
  String? get nric;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'mobile_no')
  String? get mobileNo;
  @override
  String? get gender;
  @override
  String? get email;
  @override
  DateTime? get dob;
  @override
  @JsonKey(ignore: true)
  _$$CustomerFormImplCopyWith<_$CustomerFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
