import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:pets_analytics/common/AppColors.dart';
import 'package:pets_analytics/common/AppDimens.dart';
import 'package:pets_analytics/common/AppStyles.dart';
import 'package:pets_analytics/common/widget/pets_button.dart';
import 'package:pets_analytics/features/authentication/presentation/widget/sign_up_form.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  /// Named route for [SignUpScreen]
  static const String route = 'SignUpScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: AppDimens.padding,
            right: AppDimens.padding,
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimens.padding * 1.5,
                ),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        l10n.sign_up__sign_up,
                        style: AppStyles.darkBoldS24,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: const Icon(
                        FlutterRemix.close_line,
                        color: AppColors.greyMediumDark,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: SignUpForm(),
                ),
              )
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
