import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pets_analytics/common/AppColors.dart';
import 'package:pets_analytics/common/AppDimens.dart';
import 'package:pets_analytics/common/AppStyles.dart';
import 'package:pets_analytics/common/widget/pets_button.dart';

// ignore: non_constant_identifier_names
final PET_GENDER = ['Male', 'Female'];
// ignore: non_constant_identifier_names
final PET_TYPE = ['Dog', 'Cat', 'Hamster', 'Rabbit'];

class PetProfileLayout1 extends ConsumerStatefulWidget {
  const PetProfileLayout1({super.key, required this.onStep});
  final Function(int value) onStep;

  /// Named route for [WellcomeScreen]
  static const String route = 'PetProfileScreen';
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PetProfileLayout1State();
}

class _PetProfileLayout1State extends ConsumerState<PetProfileLayout1>
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
                      text: '1 ',
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
                            (AppDimens.padding * 4)) /
                        2,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.appColors,
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  width: 110,
                  height: 110,
                  margin: const EdgeInsets.only(top: AppDimens.padding * 2),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.gray2,
                  ),
                  child: Text(
                    l10n.pet_profile__add_photo,
                    style: AppStyles.greyMediumS14,
                  ),
                ),
              ),
              _renderTitle('Pet Name'),
              TextField(
                style: AppStyles.blackRegularS16,
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16),
                  hintText: l10n.pet_profile__pet_name,
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
              _renderTitle(l10n.pet_profile__pet_gender),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    PET_GENDER.length, // Length of the list
                    (index) => SizedBox(
                      width: (MediaQuery.of(context).size.width -
                              (AppDimens.padding * 8)) /
                          2,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: AppColors.gray2,
                            foregroundColor: AppColors.gray3,
                            padding: const EdgeInsets.all(0),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                        child: Text(
                          PET_GENDER[index],
                          style: AppStyles.blackRegularS16,
                        ),
                      ),
                    ),
                  )),
              _renderTitle(l10n.pet_profile__pet_type),
              Wrap(
                children: List.generate(
                  PET_TYPE.length, // Length of the list
                  (index) => Container(
                    margin: EdgeInsets.only(
                        right: index % 2 == 0 ? AppDimens.padding * 2 : 0,
                        bottom: AppDimens.padding),
                    width: (MediaQuery.of(context).size.width -
                            (AppDimens.padding * 8)) /
                        2,
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
                        PET_TYPE[index],
                        style: AppStyles.blackRegularS16,
                      ),
                    ),
                  ),
                ),
              ),
              _renderTitle(l10n.pet_profile__breed),
              DropdownMenu<String>(
                textStyle: AppStyles.blackRegularS16,
                width:
                    MediaQuery.of(context).size.width - (AppDimens.padding * 6),
                hintText: l10n.pet_profile__please_select_a_breed,
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
                    const EdgeInsets.only(top: 40, bottom: AppDimens.padding),
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
