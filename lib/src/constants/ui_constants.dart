import 'package:flutter/material.dart';

const kWOWFlexSpacer = Flexible(child: SizedBox.shrink());
const kWOWCrossAxisFlexSpacer = SizedBox.shrink();

const kVerticalSpacerMini = SizedBox(height: 2.0);
const kVerticalSpacerSmall = SizedBox(height: 4.0);
const kVerticalSpacerMedium = SizedBox(height: 8.0);
const kVerticalSpacerLarge = SizedBox(height: 16.0);
const kVerticalSpacerExtraLarge = SizedBox(height: 32.0);
const kVerticalSpacerXXL = SizedBox(height: 64.0);

const kHorizontalSpacerMini = SizedBox(width: 2.0);
const kHorizontalSpacerSmall = SizedBox(width: 4.0);
const kHorizontalSpacerMedium = SizedBox(width: 8.0);
const kHorizontalSpacerLarge = SizedBox(width: 16.0);
const kHorizontalSpacerExtraLarge = SizedBox(width: 32.0);
const kHorizontalSpacerXXL = SizedBox(width: 64.0);

const kPagePadding = EdgeInsets.all(16.0);
const kPagePaddingSmall = EdgeInsets.all(8.0);

const kListViewPadding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
const kListViewPaddingSmall =
    EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);

const kHorizontalPaddingSmall = EdgeInsets.symmetric(horizontal: 4.0);
const kHorizontalPaddingMedium = EdgeInsets.symmetric(horizontal: 8.0);
const kHorizontalPaddingLarge = EdgeInsets.symmetric(horizontal: 16.0);

const kVerticalPaddingSmall = EdgeInsets.symmetric(vertical: 4.0);
const kVerticalPaddingMedium = EdgeInsets.symmetric(vertical: 8.0);
const kVerticalPaddingLarge = EdgeInsets.symmetric(vertical: 16.0);

const kBorderRadiusSmall = BorderRadius.all(Radius.circular(4.0));
const kBorderRadiusMedium = BorderRadius.all(Radius.circular(8.0));
const kBorderRadiusLarge = BorderRadius.all(Radius.circular(16.0));
const kBorderRadiusExtraLarge = BorderRadius.all(Radius.circular(24.0));

const kInputBorderRadius = BorderRadius.all(Radius.circular(8.0));

const kButtonHeight = 48.0;
const kButtonHeightSmall = 36.0;

const kIconSizeSmall = 16.0;
const kIconSizeMedium = 24.0;
const kIconSizeLarge = 32.0;

const kAppBarHeight = 56.0;

const kCardElevationDefault = 2.0;
const kCardElevationLow = 1.0;
const kCardElevationHigh = 4.0;

const kShortAnimationDuration = Duration(milliseconds: 150);
const kMediumAnimationDuration = Duration(milliseconds: 300);
const kLongAnimationDuration = Duration(milliseconds: 500);

/// Common values for spacing and padding.
/// These can be used directly or as a base for creating more specific constants.
abstract class AppSpacing {
  static const double xxs = 2.0;
  static const double xs = 4.0;
  static const double s = 8.0;
  static const double m = 16.0;
  static const double l = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;
}

/// Common values for border radius.
abstract class AppRadius {
  static const double r4 = 4.0;
  static const double r8 = 8.0;
  static const double r12 = 12.0;
  static const double r16 = 16.0;
  static const double r24 = 24.0;
  static const double rFull =
      9999.0; // For fully rounded corners like in a pill shape
}

/// Common values for icon sizes.
abstract class AppIconSizes {
  static const double s16 = 16.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s32 = 32.0;
  static const double s48 = 48.0;
}

/// Common values for animation durations.
abstract class AppDurations {
  static const Duration ms100 = Duration(milliseconds: 100);
  static const Duration ms150 = Duration(milliseconds: 150);
  static const Duration ms200 = Duration(milliseconds: 200);
  static const Duration ms300 = Duration(milliseconds: 300);
  static const Duration ms500 = Duration(milliseconds: 500);
}
