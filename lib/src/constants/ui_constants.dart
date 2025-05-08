import 'package:flutter/material.dart';

/// Contains standard UI constants for consistent spacing, padding, radii, etc.

// --- Spacing ---
const double kSpaceXXSmall = 2.0;
const double kSpaceXSmall = 4.0;
const double kSpaceSmall = 8.0;
const double kSpaceSMedium = 12.0;
const double kSpaceMedium = 16.0;
const double kSpaceLarge = 24.0;
const double kSpaceXLarge = 32.0;
const double kSpaceXXLarge = 48.0;
const double kSpaceXXXLarge = 64.0;
const double kSpaceX3Large = 80.0;
const double kSpaceXX3Large = 96.0;
const double kSpaceXXX3Large = 128.0;
const double kSpaceXXXX3Large = 160.0;

// --- Padding ---
const EdgeInsets xsmallPadding = EdgeInsets.all(kSpaceXSmall);
const EdgeInsets smallPadding = EdgeInsets.all(kSpaceSmall);
const EdgeInsets mediumPadding = EdgeInsets.all(kSpaceMedium);
const EdgeInsets largePadding = EdgeInsets.all(kSpaceXLarge);
const EdgeInsets xLargePadding = EdgeInsets.all(kSpaceXXXLarge);
const EdgeInsets xxLargePadding = EdgeInsets.all(kSpaceXXX3Large);

// --- Icon Sizes ---
const double smallIconSize = kSpaceMedium;
const double mediumIconSize = kSpaceXLarge;
const double largeIconSize = kSpaceXXXLarge;
const double xlargeIconSize = kSpaceX3Large;
const double x2largeIconSize = kSpaceXX3Large;

// --- Custom Sizes ---
// Miscellaneous custom sizes used in the application.
const double loadingIconSize = 220;
const double appBarSize = 60;

// --- General Element Sizes ---
// Standard sizes for various UI elements.
const double xsmallSize = kSpaceSmall;
const double smallSize = kSpaceMedium;
const double mediumSize = kSpaceXLarge;
const double largeSize = kSpaceXXXLarge;
const double xlargeSize = kSpaceX3Large;
const double x2largeSize = kSpaceXX3Large;
const double x3largeSize = kSpaceXX3Large; // Corresponds to 96.0

// --- Label Sizes ---
// Standard sizes for text labels.
const double xlabelSmallSize = kSpaceXSmall;
const double labelSmallSize = kSpaceSmall;
const double labelMediumSize = kSpaceMedium;
const double labelLargeSize = kSpaceLarge;


// --- Text Styles ---
// Predefined text styles for consistent typography.
const TextStyle headlineLarge = TextStyle(fontSize: kSpaceLarge);
const TextStyle headlineMedium = TextStyle(fontSize: kSpaceXLarge);
const TextStyle labelLarge = TextStyle(fontSize: kSpaceLarge);
const TextStyle labelMedium = TextStyle(fontSize: kSpaceMedium);

// --- SizedBox Vertical Gaps ---
// Predefined SizedBox widgets for vertical spacing.
const SizedBox xsmallVGap = SizedBox(height: kSpaceSmall);
const SizedBox xxsmallVGap = SizedBox(height: kSpaceMedium);
const SizedBox smallVGap = SizedBox(height: kSpaceLarge);
const SizedBox mediumVGap = SizedBox(height: kSpaceXLarge);
const SizedBox largeVGap = SizedBox(height: 40);

// --- SizedBox Horizontal Gaps ---
// Predefined SizedBox widgets for horizontal spacing.
const SizedBox xxsmallHGap = SizedBox(width: kSpaceSmall);
const SizedBox xsmallHGap = SizedBox(width: kSpaceMedium);
const SizedBox smallHGap = SizedBox(width: kSpaceLarge);
const SizedBox mediumHGap = SizedBox(width: kSpaceXLarge);
const SizedBox largeHGap = SizedBox(width: 40);

// --- Radius Values ---
// Standard border radius values.
const double xsmallRadius = kSpaceSMedium;
const double smallRadius = kSpaceLarge;
const double mediumRadius = 40;
const double largeRadius = kSpaceXXXLarge;
const double xlargeRadius = kSpaceX3Large;
