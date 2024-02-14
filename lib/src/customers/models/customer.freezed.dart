// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return _Customer.fromJson(json);
}

/// @nodoc
mixin _$Customer {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  String? get nric => throw _privateConstructorUsedError;
  DateTime? get dob => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_no')
  String? get mobileNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_pending')
  bool get isPending => throw _privateConstructorUsedError;
  @JsonKey(name: 'send_account_invitation')
  bool get sendAccountInvitation => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_new')
  bool get isNew => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_walk_in')
  bool get isWalkIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerCopyWith<Customer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) then) =
      _$CustomerCopyWithImpl<$Res, Customer>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'full_name') String fullName,
      String? nric,
      DateTime? dob,
      String? gender,
      String? email,
      @JsonKey(name: 'mobile_no') String? mobileNo,
      @JsonKey(name: 'is_pending') bool isPending,
      @JsonKey(name: 'send_account_invitation') bool sendAccountInvitation,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'is_new') bool isNew,
      @JsonKey(name: 'is_walk_in') bool isWalkIn});
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res, $Val extends Customer>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = null,
    Object? nric = freezed,
    Object? dob = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? mobileNo = freezed,
    Object? isPending = null,
    Object? sendAccountInvitation = null,
    Object? createdAt = freezed,
    Object? isNew = null,
    Object? isWalkIn = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      isPending: null == isPending
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool,
      sendAccountInvitation: null == sendAccountInvitation
          ? _value.sendAccountInvitation
          : sendAccountInvitation // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
      isWalkIn: null == isWalkIn
          ? _value.isWalkIn
          : isWalkIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerImplCopyWith<$Res>
    implements $CustomerCopyWith<$Res> {
  factory _$$CustomerImplCopyWith(
          _$CustomerImpl value, $Res Function(_$CustomerImpl) then) =
      __$$CustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'full_name') String fullName,
      String? nric,
      DateTime? dob,
      String? gender,
      String? email,
      @JsonKey(name: 'mobile_no') String? mobileNo,
      @JsonKey(name: 'is_pending') bool isPending,
      @JsonKey(name: 'send_account_invitation') bool sendAccountInvitation,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'is_new') bool isNew,
      @JsonKey(name: 'is_walk_in') bool isWalkIn});
}

/// @nodoc
class __$$CustomerImplCopyWithImpl<$Res>
    extends _$CustomerCopyWithImpl<$Res, _$CustomerImpl>
    implements _$$CustomerImplCopyWith<$Res> {
  __$$CustomerImplCopyWithImpl(
      _$CustomerImpl _value, $Res Function(_$CustomerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = null,
    Object? nric = freezed,
    Object? dob = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? mobileNo = freezed,
    Object? isPending = null,
    Object? sendAccountInvitation = null,
    Object? createdAt = freezed,
    Object? isNew = null,
    Object? isWalkIn = null,
  }) {
    return _then(_$CustomerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      isPending: null == isPending
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool,
      sendAccountInvitation: null == sendAccountInvitation
          ? _value.sendAccountInvitation
          : sendAccountInvitation // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
      isWalkIn: null == isWalkIn
          ? _value.isWalkIn
          : isWalkIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerImpl extends _Customer {
  const _$CustomerImpl(
      {this.id,
      @JsonKey(name: 'full_name') required this.fullName,
      this.nric,
      this.dob,
      this.gender,
      this.email,
      @JsonKey(name: 'mobile_no') this.mobileNo,
      @JsonKey(name: 'is_pending') this.isPending = false,
      @JsonKey(name: 'send_account_invitation')
      this.sendAccountInvitation = false,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'is_new') this.isNew = false,
      @JsonKey(name: 'is_walk_in') this.isWalkIn = false})
      : super._();

  factory _$CustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerImplFromJson(json);

  @override
  final int? id;
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
  @JsonKey(name: 'is_pending')
  final bool isPending;
  @override
  @JsonKey(name: 'send_account_invitation')
  final bool sendAccountInvitation;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'is_new')
  final bool isNew;
  @override
  @JsonKey(name: 'is_walk_in')
  final bool isWalkIn;

  @override
  String toString() {
    return 'Customer(id: $id, fullName: $fullName, nric: $nric, dob: $dob, gender: $gender, email: $email, mobileNo: $mobileNo, isPending: $isPending, sendAccountInvitation: $sendAccountInvitation, createdAt: $createdAt, isNew: $isNew, isWalkIn: $isWalkIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.nric, nric) || other.nric == nric) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.isPending, isPending) ||
                other.isPending == isPending) &&
            (identical(other.sendAccountInvitation, sendAccountInvitation) ||
                other.sendAccountInvitation == sendAccountInvitation) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isNew, isNew) || other.isNew == isNew) &&
            (identical(other.isWalkIn, isWalkIn) ||
                other.isWalkIn == isWalkIn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullName,
      nric,
      dob,
      gender,
      email,
      mobileNo,
      isPending,
      sendAccountInvitation,
      createdAt,
      isNew,
      isWalkIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      __$$CustomerImplCopyWithImpl<_$CustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerImplToJson(
      this,
    );
  }
}

abstract class _Customer extends Customer {
  const factory _Customer(
      {final int? id,
      @JsonKey(name: 'full_name') required final String fullName,
      final String? nric,
      final DateTime? dob,
      final String? gender,
      final String? email,
      @JsonKey(name: 'mobile_no') final String? mobileNo,
      @JsonKey(name: 'is_pending') final bool isPending,
      @JsonKey(name: 'send_account_invitation')
      final bool sendAccountInvitation,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'is_new') final bool isNew,
      @JsonKey(name: 'is_walk_in') final bool isWalkIn}) = _$CustomerImpl;
  const _Customer._() : super._();

  factory _Customer.fromJson(Map<String, dynamic> json) =
      _$CustomerImpl.fromJson;

  @override
  int? get id;
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
  @JsonKey(name: 'is_pending')
  bool get isPending;
  @override
  @JsonKey(name: 'send_account_invitation')
  bool get sendAccountInvitation;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'is_new')
  bool get isNew;
  @override
  @JsonKey(name: 'is_walk_in')
  bool get isWalkIn;
  @override
  @JsonKey(ignore: true)
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
