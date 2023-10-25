// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignupData {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool? get isDuplicateEmail => throw _privateConstructorUsedError;
  String? get otp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupDataCopyWith<SignupData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupDataCopyWith<$Res> {
  factory $SignupDataCopyWith(
          SignupData value, $Res Function(SignupData) then) =
      _$SignupDataCopyWithImpl<$Res, SignupData>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String password,
      bool? isDuplicateEmail,
      String? otp});
}

/// @nodoc
class _$SignupDataCopyWithImpl<$Res, $Val extends SignupData>
    implements $SignupDataCopyWith<$Res> {
  _$SignupDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? isDuplicateEmail = freezed,
    Object? otp = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isDuplicateEmail: freezed == isDuplicateEmail
          ? _value.isDuplicateEmail
          : isDuplicateEmail // ignore: cast_nullable_to_non_nullable
              as bool?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignupDataImplCopyWith<$Res>
    implements $SignupDataCopyWith<$Res> {
  factory _$$SignupDataImplCopyWith(
          _$SignupDataImpl value, $Res Function(_$SignupDataImpl) then) =
      __$$SignupDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String password,
      bool? isDuplicateEmail,
      String? otp});
}

/// @nodoc
class __$$SignupDataImplCopyWithImpl<$Res>
    extends _$SignupDataCopyWithImpl<$Res, _$SignupDataImpl>
    implements _$$SignupDataImplCopyWith<$Res> {
  __$$SignupDataImplCopyWithImpl(
      _$SignupDataImpl _value, $Res Function(_$SignupDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? isDuplicateEmail = freezed,
    Object? otp = freezed,
  }) {
    return _then(_$SignupDataImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isDuplicateEmail: freezed == isDuplicateEmail
          ? _value.isDuplicateEmail
          : isDuplicateEmail // ignore: cast_nullable_to_non_nullable
              as bool?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SignupDataImpl extends _SignupData {
  const _$SignupDataImpl(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      this.isDuplicateEmail,
      this.otp})
      : super._();

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String password;
  @override
  final bool? isDuplicateEmail;
  @override
  final String? otp;

  @override
  String toString() {
    return 'SignupData(firstName: $firstName, lastName: $lastName, email: $email, password: $password, isDuplicateEmail: $isDuplicateEmail, otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupDataImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isDuplicateEmail, isDuplicateEmail) ||
                other.isDuplicateEmail == isDuplicateEmail) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, firstName, lastName, email, password, isDuplicateEmail, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupDataImplCopyWith<_$SignupDataImpl> get copyWith =>
      __$$SignupDataImplCopyWithImpl<_$SignupDataImpl>(this, _$identity);
}

abstract class _SignupData extends SignupData {
  const factory _SignupData(
      {required final String firstName,
      required final String lastName,
      required final String email,
      required final String password,
      final bool? isDuplicateEmail,
      final String? otp}) = _$SignupDataImpl;
  const _SignupData._() : super._();

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get password;
  @override
  bool? get isDuplicateEmail;
  @override
  String? get otp;
  @override
  @JsonKey(ignore: true)
  _$$SignupDataImplCopyWith<_$SignupDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
