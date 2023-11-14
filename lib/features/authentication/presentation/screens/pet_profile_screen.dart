import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:pets_analytics/common/AppColors.dart';
import 'package:pets_analytics/common/AppDimens.dart';
import 'package:pets_analytics/common/AppImages.dart';
import 'package:pets_analytics/common/AppStyles.dart';
import 'package:pets_analytics/common/widget/pets_button.dart';
import 'package:pets_analytics/features/authentication/presentation/screens/wellcome_screen.dart';
import 'package:pets_analytics/features/authentication/presentation/widget/pet_profile_layout.dart';
import 'package:pets_analytics/features/authentication/presentation/widget/pet_profile_layout_1.dart';
import 'package:pets_analytics/features/authentication/presentation/widget/pet_profile_layout_2.dart';

class PetProfileScreen extends ConsumerStatefulWidget {
  const PetProfileScreen({super.key});

  /// Named route for [WellcomeScreen]
  static const String route = 'PetProfileScreen';
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PetProfileScreenState();
}

class _PetProfileScreenState extends ConsumerState<PetProfileScreen> {
  late int step = 0;

  void _onStep(int value) {
    setState(() {
      step = value;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    alignment: Alignment.centerRight,
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
                        onTap: () {},
                        child: Text(
                          l10n.pet_profile__skip,
                          style: AppStyles.appColorSemiS16,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                switch (step) {
                  0 => PetProfileLayout(
                      onStep: _onStep,
                    ),
                  1 => PetProfileLayout1(
                      onStep: _onStep,
                    ),
                  2 => PetProfileLayout2(
                      onStep: _onStep,
                    ),
                  int() => const SizedBox(),
                },
              ],
            )), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
