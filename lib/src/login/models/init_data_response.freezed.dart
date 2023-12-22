// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'init_data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InitDataResponse {
  bool get hasNextPage => throw _privateConstructorUsedError;
  List<Customer> get customers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InitDataResponseCopyWith<InitDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitDataResponseCopyWith<$Res> {
  factory $InitDataResponseCopyWith(
          InitDataResponse value, $Res Function(InitDataResponse) then) =
      _$InitDataResponseCopyWithImpl<$Res, InitDataResponse>;
  @useResult
  $Res call({bool hasNextPage, List<Customer> customers});
}

/// @nodoc
class _$InitDataResponseCopyWithImpl<$Res, $Val extends InitDataResponse>
    implements $InitDataResponseCopyWith<$Res> {
  _$InitDataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasNextPage = null,
    Object? customers = null,
  }) {
    return _then(_value.copyWith(
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      customers: null == customers
          ? _value.customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitDataResponseImplCopyWith<$Res>
    implements $InitDataResponseCopyWith<$Res> {
  factory _$$InitDataResponseImplCopyWith(_$InitDataResponseImpl value,
          $Res Function(_$InitDataResponseImpl) then) =
      __$$InitDataResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasNextPage, List<Customer> customers});
}

/// @nodoc
class __$$InitDataResponseImplCopyWithImpl<$Res>
    extends _$InitDataResponseCopyWithImpl<$Res, _$InitDataResponseImpl>
    implements _$$InitDataResponseImplCopyWith<$Res> {
  __$$InitDataResponseImplCopyWithImpl(_$InitDataResponseImpl _value,
      $Res Function(_$InitDataResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasNextPage = null,
    Object? customers = null,
  }) {
    return _then(_$InitDataResponseImpl(
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      customers: null == customers
          ? _value._customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
    ));
  }
}

/// @nodoc

class _$InitDataResponseImpl extends _InitDataResponse {
  const _$InitDataResponseImpl(
      {required this.hasNextPage, required final List<Customer> customers})
      : _customers = customers,
        super._();

  @override
  final bool hasNextPage;
  final List<Customer> _customers;
  @override
  List<Customer> get customers {
    if (_customers is EqualUnmodifiableListView) return _customers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customers);
  }

  @override
  String toString() {
    return 'InitDataResponse(hasNextPage: $hasNextPage, customers: $customers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitDataResponseImpl &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            const DeepCollectionEquality()
                .equals(other._customers, _customers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hasNextPage,
      const DeepCollectionEquality().hash(_customers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitDataResponseImplCopyWith<_$InitDataResponseImpl> get copyWith =>
      __$$InitDataResponseImplCopyWithImpl<_$InitDataResponseImpl>(
          this, _$identity);
}

abstract class _InitDataResponse extends InitDataResponse {
  const factory _InitDataResponse(
      {required final bool hasNextPage,
      required final List<Customer> customers}) = _$InitDataResponseImpl;
  const _InitDataResponse._() : super._();

  @override
  bool get hasNextPage;
  @override
  List<Customer> get customers;
  @override
  @JsonKey(ignore: true)
  _$$InitDataResponseImplCopyWith<_$InitDataResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
