import 'package:reactive_forms/reactive_forms.dart';

class PetsEmailValidator extends Validator<dynamic> {
  const PetsEmailValidator() : super();
  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    // don't validate empty values to allow optional controls
    return (control.isNull || control.value.toString().isEmpty)
        ? null
        : <String, dynamic>{'email': control.value};
  }
}

PetsEmailValidator get petsEmailValidator => const PetsEmailValidator();
