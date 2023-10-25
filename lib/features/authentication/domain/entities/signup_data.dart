import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_data.freezed.dart';

@freezed
@immutable
abstract class SignupData with _$SignupData {
  const SignupData._();
  const factory SignupData({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    bool? isDuplicateEmail,
    String? otp,
  }) = _SignupData;
}
