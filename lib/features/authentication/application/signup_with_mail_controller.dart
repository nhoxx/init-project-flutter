import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pets_analytics/features/authentication/domain/entities/signup_data.dart';

class SignupWithMailController extends StateNotifier<SignupData?> {
  final Ref ref;

  SignupWithMailController(this.ref) : super(null);

  void saveSignupData(
      String email, String firstName, String lastName, String password) async {
    state = SignupData(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);
  }
}
