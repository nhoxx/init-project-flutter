import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:pets_analytics/common/AppColors.dart';
import 'package:pets_analytics/common/AppDimens.dart';
import 'package:pets_analytics/common/AppImages.dart';
import 'package:pets_analytics/common/AppStyles.dart';
import 'package:pets_analytics/features/authentication/presentation/screens/wellcome_screen.dart';

class AppDemoScreen extends ConsumerStatefulWidget {
  const AppDemoScreen({super.key});

  /// Named route for [WellcomeScreen]
  static const String route = 'AppDemoScreen';
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppDemoScreenState();
}

class _AppDemoScreenState extends ConsumerState<AppDemoScreen> {
  late Timer t;

  @override
  void initState() {
    _initState();
    super.initState();
  }

  @override
  void dispose() {
    t.cancel();
    super.dispose();
  }

  void _initState() {
    t = Timer(const Duration(seconds: 3), () {
      context.replaceNamed(WellcomeScreen.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 68,
          left: AppDimens.padding,
          right: AppDimens.padding,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: <Widget>[
                  Image.asset(
                    AppImages.intro,
                    width: 180,
                    height: 130,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 303,
                    margin: const EdgeInsets.only(top: 54),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset(
                          AppImages.intro_1,
                        ).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 21),
                      child: Text(
                        l10n.common__app_name,
                        style: AppStyles.darkBoldS24,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: MediaQuery.of(context).padding.bottom + 20,
                child: const CupertinoActivityIndicator(
                  radius: 15,
                  color: AppColors.appColors,
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
