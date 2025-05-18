import 'package:flutter/material.dart';

/// Contains standard UI constants for consistent spacing, padding, radii, etc.

// --- Spacing ---
const double kSizeXXSmall = 2.0;
const double kSizeXSmall = 4.0;
const double kSizeSmall = 8.0;
const double kSizeSMedium = 12.0;
const double kSizeMedium = 16.0;
const double kSizeLarge = 24.0;
const double kSizeXLarge = 32.0;
const double kSizeXXLarge = 48.0;
const double kSizeXXXLarge = 64.0;
const double kSizeX3Large = 80.0;
const double kSizeXX3Large = 96.0;
const double kSizeXXX3Large = 128.0;
const double kSizeXXXX3Large = 160.0;

// --- Padding ---
const EdgeInsets kXSmallPadding = EdgeInsets.all(kSizeXSmall);
const EdgeInsets kSmallPadding = EdgeInsets.all(kSizeSmall);
const EdgeInsets kMediumPadding = EdgeInsets.all(kSizeMedium);
const EdgeInsets kXLargePadding = EdgeInsets.all(kSizeXLarge);
const EdgeInsets kXXLargePadding = EdgeInsets.all(kSizeXXLarge);
const EdgeInsets kXXXLargePadding = EdgeInsets.all(kSizeXXXLarge);
const EdgeInsets kX3LargePadding = EdgeInsets.all(kSizeX3Large);
const EdgeInsets kXXX3LargePadding = EdgeInsets.all(kSizeXXX3Large);

// --- Icon Sizes ---
const double kXXSmallIconSize = kSizeXXSmall;
const double kXSmallIconSize = kSizeXSmall;
const double kSmallIconSize = kSizeSmall;
const double kSMediumIconSize = kSizeSMedium;
const double kMediumIconSize = kSizeMedium;
const double kLargeIconSize = kSizeLarge;
const double kXLargeIconSize = kSizeXLarge;
const double kXXLargeIconSize = kSizeXXLarge;
const double kXXXLargeIconSize = kSizeXXXLarge;
const double kX3LargeIconSize = kSizeX3Large; // Renamed from kx3LargeIconSize
const double kXX3LargeIconSize = kSizeXX3Large;
const double kXXX3LargeIconSize = kSizeXXX3Large;
const double kXXXX3LargeIconSize = kSizeXXXX3Large;

// --- Custom Sizes ---
// Miscellaneous custom sizes used in the application.
const double loadingIconSize =
    220; // This value is custom and not derived from kSpace
const double appBarSize =
    60; // This value is custom and not derived from kSpace

// --- SizedBox Vertical Gaps ---
// Predefined SizedBox widgets for vertical spacing.
const SizedBox kXXSmallVGap = SizedBox(height: kSizeXXSmall);
const SizedBox kXSmallVGap = SizedBox(height: kSizeXSmall);
const SizedBox kSmallVGap = SizedBox(height: kSizeSmall);
const SizedBox kSMediumVGap = SizedBox(height: kSizeSMedium);
const SizedBox kMediumVGap = SizedBox(height: kSizeMedium);
const SizedBox kLargeVGap = SizedBox(height: kSizeLarge);
const SizedBox kXLargeVGap = SizedBox(height: kSizeXLarge);
const SizedBox kXXLargeVGap = SizedBox(height: kSizeXXLarge);
const SizedBox kXXXLargeVGap = SizedBox(height: kSizeXXXLarge);
const SizedBox kX3LargeVGap = SizedBox(height: kSizeX3Large);
const SizedBox kXX3LargeVGap = SizedBox(height: kSizeXX3Large);
const SizedBox kXXX3LargeVGap = SizedBox(height: kSizeXXX3Large);
const SizedBox kXXXX3LargeVGap = SizedBox(height: kSizeXXXX3Large);
const SizedBox kCustomVGap = SizedBox(height: 40); // Custom 40px gap

// --- SizedBox Horizontal Gaps ---
// Predefined SizedBox widgets for horizontal spacing.
const SizedBox kXXSmallHGap = SizedBox(width: kSizeXXSmall);
const SizedBox kXSmallHGap = SizedBox(width: kSizeXSmall);
const SizedBox kSmallHGap = SizedBox(width: kSizeSmall);
const SizedBox kSMediumHGap = SizedBox(width: kSizeSMedium);
const SizedBox kMediumHGap = SizedBox(width: kSizeMedium);
const SizedBox kLargeHGap = SizedBox(width: kSizeLarge);
const SizedBox kXLargeHGap = SizedBox(width: kSizeXLarge);
const SizedBox kXXLargeHGap = SizedBox(width: kSizeXXLarge);
const SizedBox kXXXLargeHGap = SizedBox(width: kSizeXXXLarge);
const SizedBox kX3LargeHGap = SizedBox(width: kSizeX3Large);
const SizedBox kXX3LargeHGap = SizedBox(width: kSizeXX3Large);
const SizedBox kXXX3LargeHGap = SizedBox(width: kSizeXXX3Large);
const SizedBox kXXXX3LargeHGap = SizedBox(width: kSizeXXXX3Large);
const SizedBox kCustomHGap = SizedBox(width: 40); // Custom 40px gap

// --- Radius Values ---
// Standard border radius values.
const double kXXSmallRadius = kSizeXXSmall;
const double kXSmallRadius = kSizeXSmall;
const double kSmallRadius = kSizeSmall;
const double kSMediumRadius = kSizeSMedium; // Was kMediumRadius
const double kMediumRadius = kSizeMedium;
const double kLargeRadius = kSizeLarge;
const double kXLargeRadius = kSizeXLarge;
const double kXXLargeRadius = kSizeXXLarge;
const double kXXXLargeRadius = kSizeXXXLarge;
const double kX3LargeRadius = kSizeX3Large;
const double kXX3LargeRadius = kSizeXX3Large;
const double kXXX3LargeRadius = kSizeXXX3Large;
const double kXXXX3LargeRadius = kSizeXXXX3Large;
const double kCustomRadius40 =
    40.0; // Renamed from mediumRadius, as 40.0 doesn't map to a kSpace constant
