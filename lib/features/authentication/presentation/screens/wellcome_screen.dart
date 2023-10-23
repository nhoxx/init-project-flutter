import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pets_analytics/common/AppImages.dart';
import 'package:pets_analytics/common/AppStyles.dart';

class WellcomeScreen extends ConsumerWidget {
  const WellcomeScreen({super.key});

  /// Named route for [WellcomeScreen]
  static const String route = 'wellcomeScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              l10n.common__api_error,
              style: AppStyles.blueMediumS16,
            ),
            Image.asset(
              AppImages.intro,
              width: 100,
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
