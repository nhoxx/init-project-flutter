import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pets_analytics/common/AppColors.dart';
import 'package:pets_analytics/common/AppDimens.dart';
import 'package:pets_analytics/common/widget/pets_button.dart';
import 'package:pets_analytics/common/widget/pets_textfield.dart';
import 'package:pets_analytics/utils/email_validator.dart';
import 'package:pets_analytics/utils/must_match_validator.dart';

import 'package:pets_analytics/utils/password_validator.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUpForm extends ConsumerWidget {
  SignUpForm({super.key});

  final form = FormGroup({
    'first_name':
        FormControl<String>(value: '', validators: [Validators.required]),
    'last_name':
        FormControl<String>(value: '', validators: [Validators.required]),
    'email': FormControl<String>(
      value: '',
      validators: [Validators.required, petsEmailValidator],
    ),
    'password': FormControl<String>(
        value: '', validators: [Validators.required, petsPasswordValidator]),
    'confirm_password':
        FormControl<String>(value: '', validators: [Validators.required]),
  }, validators: [
    PestMustMatchValidator(
        controlName: 'password', matchingControlName: 'confirm_password')
  ]);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return ReactiveForm(
      formGroup: form,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: AppDimens.padding * 1.5,
          ),
          PetsTextField(
            key: const Key('first_name'),
            formControlName: 'first_name',
            validationMessages: {
              'required': (error) => l10n.msg002,
            },
            labelText: l10n.signup__firstname,
            prefixIcon: const Icon(
              FlutterRemix.user_3_line,
              color: AppColors.greyMediumDark,
            ),
            prefixActiveIcon: const Icon(
              FlutterRemix.user_3_line,
              color: AppColors.dark,
            ),
          ),
          const SizedBox(
            height: AppDimens.padding * 1.5,
          ),
          PetsTextField(
            key: const Key('last_name'),
            formControlName: 'last_name',
            validationMessages: {
              'required': (error) => l10n.msg002,
            },
            labelText: l10n.signup__lastname,
            prefixIcon: const Icon(
              FlutterRemix.user_3_line,
              color: AppColors.greyMediumDark,
            ),
            prefixActiveIcon: const Icon(
              FlutterRemix.user_3_line,
              color: AppColors.dark,
            ),
          ),
          const SizedBox(
            height: AppDimens.padding * 1.5,
          ),
          PetsTextField(
            key: const Key('email'),
            formControlName: 'email',
            validationMessages: {
              'required': (error) => l10n.msg002,
              'email': (error) => l10n.msg013,
            },
            labelText: l10n.common__email,
            prefixIcon: const Icon(
              FlutterRemix.mail_line,
              color: AppColors.greyMediumDark,
            ),
            prefixActiveIcon: const Icon(
              FlutterRemix.mail_line,
              color: AppColors.dark,
            ),
          ),
          const SizedBox(
            height: AppDimens.padding * 1.5,
          ),
          PetsTextField(
            key: const Key('password'),
            formControlName: 'password',
            validationMessages: {
              'required': (error) => l10n.msg002,
              'password': (error) => l10n.signup__password_invalid,
            },
            obscureText: true,
            suffixShowIcon: const Icon(
              FlutterRemix.eye_2_line,
              color: AppColors.greyMediumDark,
            ),
            suffixHideIcon: const Icon(
              FlutterRemix.eye_off_line,
              color: AppColors.greyMediumDark,
            ),
            labelText: l10n.signup__password,
            prefixIcon: const Icon(
              FlutterRemix.lock_password_line,
              color: AppColors.greyMediumDark,
            ),
            prefixActiveIcon: const Icon(
              FlutterRemix.lock_password_line,
              color: AppColors.dark,
            ),
          ),
          const SizedBox(
            height: AppDimens.padding * 1.5,
          ),
          PetsTextField(
            key: const Key('confirm_password'),
            formControlName: 'confirm_password',
            validationMessages: {
              'required': (error) => l10n.msg002,
              'mustMatch': (error) => l10n.msg016,
            },
            labelText: l10n.signup__confirmpassword,
            obscureText: true,
            suffixShowIcon: const Icon(
              FlutterRemix.eye_2_line,
              color: AppColors.greyMediumDark,
            ),
            suffixHideIcon: const Icon(
              FlutterRemix.eye_off_line,
              color: AppColors.greyMediumDark,
            ),
            prefixIcon: const Icon(
              FlutterRemix.lock_password_line,
              color: AppColors.greyMediumDark,
            ),
            prefixActiveIcon: const Icon(
              FlutterRemix.lock_password_line,
              color: AppColors.dark,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 128, bottom: 16),
            child: PetsButton(
              title: l10n.sign_up__sign_up,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
