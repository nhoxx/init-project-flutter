import 'package:flutter/material.dart';

class AppDimens {
  static const double spacingUnit = 4;

  static double spacing(int noOfUnits) {
    return noOfUnits * spacingUnit;
  }

  static const double padding = 16;
}

extension SpacingEdgeInsets on EdgeInsets {
  EdgeInsets all(int noOfUnits) {
    return EdgeInsets.all(
      AppDimens.spacing(noOfUnits),
    );
  }

  EdgeInsets symmetric({
    int horizontalUnits = 0,
    int verticalUnits = 0,
  }) {
    return EdgeInsets.symmetric(
      horizontal: AppDimens.spacing(horizontalUnits),
      vertical: AppDimens.spacing(verticalUnits),
    );
  }

  EdgeInsets only({
    int leftUnits = 0,
    int topUnits = 0,
    int rightUnits = 0,
    int bottomUnits = 0,
  }) {
    return EdgeInsets.only(
      left: AppDimens.spacing(leftUnits),
      top: AppDimens.spacing(topUnits),
      right: AppDimens.spacing(rightUnits),
      bottom: AppDimens.spacing(bottomUnits),
    );
  }
}
