import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pets_analytics/common/AppDimens.dart';
import 'package:pets_analytics/common/AppImages.dart';
import 'package:pets_analytics/common/AppStyles.dart';
import 'package:pets_analytics/common/widget/pets_button.dart';

class PetProfileLayout extends ConsumerWidget {
  const PetProfileLayout({super.key, required this.onStep});
  final Function(int value) onStep;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: <Widget>[
              Image.asset(
                AppImages.intro,
                width: 180,
                height: 130,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: AppDimens.padding),
                child: Image.asset(
                  AppImages.intro_1,
                  width: double.infinity,
                  height: 303,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.padding * 2),
                child: Text(
                  l10n.pet_profile__fill_out,
                  style: getAppTextStyle(AppStyles.darkSemiboldS26, 32),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.padding * 2,
                    vertical: AppDimens.padding),
                child: Text(
                  l10n.pet_profile__fill_out_description,
                  style: getAppTextStyle(AppStyles.greyMediumS14, 26),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 40, bottom: AppDimens.padding),
                child: PetsButton(
                  title: l10n.pet_profile__start,
                  onPressed: () {
                    onStep(1);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
