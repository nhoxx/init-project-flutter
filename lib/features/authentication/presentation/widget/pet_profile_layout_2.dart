import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pets_analytics/common/AppColors.dart';
import 'package:pets_analytics/common/AppDimens.dart';
import 'package:pets_analytics/common/AppStyles.dart';
import 'package:pets_analytics/common/widget/pest_time_picker.dart';
import 'package:pets_analytics/common/widget/pets_button.dart';

// ignore: non_constant_identifier_names
final PET_CURRENT_DIET = ['Wet Food', 'Dry Food', 'Mix'];

class PetProfileLayout2 extends ConsumerStatefulWidget {
  const PetProfileLayout2({super.key, required this.onStep});
  final Function(int value) onStep;

  /// Named route for [WellcomeScreen]
  static const String route = 'PetProfileScreen';
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PetProfileLayout2State();
}

class _PetProfileLayout2State extends ConsumerState<PetProfileLayout2>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late final Animation<Offset> _offsetAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: const Duration(milliseconds: 500),
    )..forward(from: 0.0);
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<String>> colorEntries = [
      const DropdownMenuEntry(
          label: "Domestic Shorthair", value: 'Domestic Shorthair'),
      const DropdownMenuEntry(
          label: "Domestic Shorthair", value: 'Domestic Shorthair'),
      const DropdownMenuEntry(
          label: "Domestic Shorthair", value: 'Domestic Shorthair'),
      const DropdownMenuEntry(
          label: "Domestic Shorthair", value: 'Domestic Shorthair')
    ];
    final l10n = AppLocalizations.of(context)!;
    return Expanded(
        child: SlideTransition(
      position: _offsetAnimation,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppDimens.padding * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: AppDimens.padding),
                child: Center(
                  child: RichText(
                    text: const TextSpan(
                      text: '2 ',
                      style: AppStyles.blackBoldS14,
                      children: <TextSpan>[
                        TextSpan(
                          text: ' of 2',
                          style: AppStyles.darkMediumS14,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width -
                        (AppDimens.padding * 4),
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.gray2,
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width -
                        (AppDimens.padding * 4)),
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.appColors,
                    ),
                  ),
                ],
              ),
              _renderTitle(l10n.pet_profile__birth_date),
              const PetsTimePicker(
                text: 'DD/MM/YYYY',
              ),
              _renderTitle(l10n.pet_profile__weight),
              TextField(
                style: AppStyles.blackRegularS16,
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16),
                  hintText: l10n.pet_profile__enter_here,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: AppColors.border,
                        width: 1,
                        style: BorderStyle.solid,
                      )),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        color: AppColors.border,
                        width: 1,
                        style: BorderStyle.solid,
                      )),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: AppColors.border,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              _renderTitle(l10n.pet_profile__current_diet),
              Wrap(
                children: List.generate(
                  PET_CURRENT_DIET.length, // Length of the list
                  (index) => Container(
                    margin: EdgeInsets.only(
                      right: index != PET_CURRENT_DIET.length - 1
                          ? AppDimens.padding
                          : 0,
                    ),
                    width: (MediaQuery.of(context).size.width -
                            (AppDimens.padding * 8)) /
                        3,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: AppColors.gray2,
                          foregroundColor: AppColors.gray3,
                          padding: const EdgeInsets.all(0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          )),
                      child: Text(
                        PET_CURRENT_DIET[index],
                        style: AppStyles.blackRegularS16,
                      ),
                    ),
                  ),
                ),
              ),
              _renderTitle(l10n.pet_profile__prre_existing_conditions),
              DropdownMenu<String>(
                textStyle: AppStyles.blackRegularS16,
                width:
                    MediaQuery.of(context).size.width - (AppDimens.padding * 6),
                hintText: l10n.pet_profile__prre_selec_conditions,
                inputDecorationTheme: const InputDecorationTheme(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: AppDimens.padding),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: AppColors.border,
                        width: 1,
                        style: BorderStyle.solid,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        color: AppColors.border,
                        width: 1,
                        style: BorderStyle.solid,
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: AppColors.border,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                dropdownMenuEntries: colorEntries,
                onSelected: (String? value) {},
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 80, bottom: AppDimens.padding),
                child: PetsButton(
                  title: l10n.pet_profile__next,
                  onPressed: () {
                    widget.onStep(2);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _renderTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppDimens.padding * 2, bottom: AppDimens.padding),
      child: (Text(
        title,
        style: AppStyles.blackBoldS18,
      )),
    );
  }
}
