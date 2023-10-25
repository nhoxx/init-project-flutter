import 'package:reactive_forms/reactive_forms.dart';

class PasswordValidator extends Validator<dynamic> {
  static final RegExp passwordRegex =
      RegExp(r'^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{8,20})$');

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    // don't validate empty values to allow optional controls
    return (control.isNull ||
            control.value.toString().isEmpty ||
            passwordRegex.hasMatch(control.value.toString()))
        ? null
        : <String, dynamic>{'password': control.value};
  }
}

PasswordValidator get petsPasswordValidator => PasswordValidator();
