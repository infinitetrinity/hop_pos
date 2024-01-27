// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewCustomer _$NewCustomerFromJson(Map<String, dynamic> json) {
  return _NewCustomer.fromJson(json);
}

/// @nodoc
mixin _$NewCustomer {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  String? get nric => throw _privateConstructorUsedError;
  DateTime? get dob => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_no')
  String? get mobileNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'send_account_invitation')
  bool get sendAccountInvitation => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewCustomerCopyWith<NewCustomer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewCustomerCopyWith<$Res> {
  factory $NewCustomerCopyWith(
          NewCustomer value, $Res Function(NewCustomer) then) =
      _$NewCustomerCopyWithImpl<$Res, NewCustomer>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'full_name') String fullName,
      String? nric,
      DateTime? dob,
      String? gender,
      String? email,
      @JsonKey(name: 'mobile_no') String? mobileNo,
      @JsonKey(name: 'send_account_invitation') bool sendAccountInvitation,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$NewCustomerCopyWithImpl<$Res, $Val extends NewCustomer>
    implements $NewCustomerCopyWith<$Res> {
  _$NewCustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? nric = freezed,
    Object? dob = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? mobileNo = freezed,
    Object? sendAccountInvitation = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      nric: freezed == nric
          ? _value.nric
          : nric // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      sendAccountInvitation: null == sendAccountInvitation
          ? _value.sendAccountInvitation
          : sendAccountInvitation // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewCustomerImplCopyWith<$Res>
    implements $NewCustomerCopyWith<$Res> {
  factory _$$NewCustomerImplCopyWith(
          _$NewCustomerImpl value, $Res Function(_$NewCustomerImpl) then) =
      __$$NewCustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'full_name') String fullName,
      String? nric,
      DateTime? dob,
      String? gender,
      String? email,
      @JsonKey(name: 'mobile_no') String? mobileNo,
      @JsonKey(name: 'send_account_invitation') bool sendAccountInvitation,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$NewCustomerImplCopyWithImpl<$Res>
    extends _$NewCustomerCopyWithImpl<$Res, _$NewCustomerImpl>
    implements _$$NewCustomerImplCopyWith<$Res> {
  __$$NewCustomerImplCopyWithImpl(
      _$NewCustomerImpl _value, $Res Function(_$NewCustomerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? nric = freezed,
    Object? dob = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? mobileNo = freezed,
    Object? sendAccountInvitation = null,
    Object? createdAt = null,
  }) {
    return _then(_$NewCustomerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      nric: freezed == nric
          ? _value.nric
          : nric // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      sendAccountInvitation: null == sendAccountInvitation
          ? _value.sendAccountInvitation
          : sendAccountInvitation // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewCustomerImpl implements _NewCustomer {
  const _$NewCustomerImpl(
      {required this.id,
      @JsonKey(name: 'full_name') required this.fullName,
      this.nric,
      this.dob,
      this.gender,
      this.email,
      @JsonKey(name: 'mobile_no') this.mobileNo,
      @JsonKey(name: 'send_account_invitation')
      required this.sendAccountInvitation,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$NewCustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewCustomerImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  final String? nric;
  @override
  final DateTime? dob;
  @override
  final String? gender;
  @override
  final String? email;
  @override
  @JsonKey(name: 'mobile_no')
  final String? mobileNo;
  @override
  @JsonKey(name: 'send_account_invitation')
  final bool sendAccountInvitation;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'NewCustomer(id: $id, fullName: $fullName, nric: $nric, dob: $dob, gender: $gender, email: $email, mobileNo: $mobileNo, sendAccountInvitation: $sendAccountInvitation, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewCustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.nric, nric) || other.nric == nric) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.sendAccountInvitation, sendAccountInvitation) ||
                other.sendAccountInvitation == sendAccountInvitation) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, nric, dob, gender,
      email, mobileNo, sendAccountInvitation, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewCustomerImplCopyWith<_$NewCustomerImpl> get copyWith =>
      __$$NewCustomerImplCopyWithImpl<_$NewCustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewCustomerImplToJson(
      this,
    );
  }
}

abstract class _NewCustomer implements NewCustomer {
  const factory _NewCustomer(
          {required final int id,
          @JsonKey(name: 'full_name') required final String fullName,
          final String? nric,
          final DateTime? dob,
          final String? gender,
          final String? email,
          @JsonKey(name: 'mobile_no') final String? mobileNo,
          @JsonKey(name: 'send_account_invitation')
          required final bool sendAccountInvitation,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$NewCustomerImpl;

  factory _NewCustomer.fromJson(Map<String, dynamic> json) =
      _$NewCustomerImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  String? get nric;
  @override
  DateTime? get dob;
  @override
  String? get gender;
  @override
  String? get email;
  @override
  @JsonKey(name: 'mobile_no')
  String? get mobileNo;
  @override
  @JsonKey(name: 'send_account_invitation')
  bool get sendAccountInvitation;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$NewCustomerImplCopyWith<_$NewCustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
