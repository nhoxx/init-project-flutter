import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:pets_analytics/common/AppDimens.dart';
import 'package:pets_analytics/common/AppImages.dart';
import 'package:pets_analytics/common/AppStyles.dart';
import 'package:pets_analytics/common/widget/pets_button.dart';
import 'package:pets_analytics/features/authentication/presentation/screens/log_in_screen.dart';
import 'package:pets_analytics/features/authentication/presentation/screens/sign_up_screen.dart';

class WellcomeScreen extends ConsumerWidget {
  const WellcomeScreen({super.key});

  /// Named route for [WellcomeScreen]
  static const String route = 'WellcomeScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 70,
          left: AppDimens.padding,
          right: AppDimens.padding,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Image.asset(
                AppImages.intro,
                width: 180,
                height: 130,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 21),
                child: Column(
                  children: [
                    Text(
                      l10n.wellcome__app_wellcome,
                      style: AppStyles.darkBoldS24,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 128,
                          bottom: 16,
                          left: AppDimens.padding,
                          right: AppDimens.padding),
                      child: PetsButton(
                        title: l10n.wellcome__create_account,
                        onPressed: () {
                          context.goNamed(SignUpScreen.route);
                        },
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: '${l10n.wellcome__existing_member} ',
                        style: AppStyles.appColorSemiS16,
                        children: <TextSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => context.goNamed(LogInScreen.route),
                            text: l10n.wellcome__login_here,
                            style: AppStyles.appColorSemiS16.copyWith(
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
