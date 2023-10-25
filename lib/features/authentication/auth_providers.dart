import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pets_analytics/features/authentication/domain/entities/signup_data.dart';
import 'package:pets_analytics/features/authentication/application/signup_with_mail_controller.dart';

final signupWithEmailProvider = Provider<SignupWithMailController>((ref) {
  return SignupWithMailController(ref);
});

final signupWithEmailStateProvider =
    StateNotifierProvider<SignupWithMailController, SignupData?>((ref) {
  return SignupWithMailController(ref);
});
