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
const EdgeInsets kXSmallPadding = EdgeInsets.all(kSpaceXSmall);
const EdgeInsets kSmallPadding = EdgeInsets.all(kSpaceSmall);
const EdgeInsets kMediumPadding = EdgeInsets.all(kSpaceMedium);
const EdgeInsets kXLargePadding = EdgeInsets.all(kSpaceXLarge);
const EdgeInsets kXXLargePadding = EdgeInsets.all(kSpaceXXLarge);
const EdgeInsets kXXXLargePadding = EdgeInsets.all(kSpaceXXXLarge);
const EdgeInsets kX3LargePadding = EdgeInsets.all(kSpaceX3Large);
const EdgeInsets kXXX3LargePadding = EdgeInsets.all(kSpaceXXX3Large);

// --- Icon Sizes ---
const double kXXSmallIconSize = kSpaceXXSmall;
const double kXSmallIconSize = kSpaceXSmall;
const double kSmallIconSize = kSpaceSmall;
const double kSMediumIconSize = kSpaceSMedium;
const double kMediumIconSize = kSpaceMedium;
const double kLargeIconSize = kSpaceLarge;
const double kXLargeIconSize = kSpaceXLarge;
const double kXXLargeIconSize = kSpaceXXLarge;
const double kXXXLargeIconSize = kSpaceXXXLarge;
const double kX3LargeIconSize = kSpaceX3Large; // Renamed from kx3LargeIconSize
const double kXX3LargeIconSize = kSpaceXX3Large;
const double kXXX3LargeIconSize = kSpaceXXX3Large;
const double kXXXX3LargeIconSize = kSpaceXXXX3Large;

// --- Custom Sizes ---
// Miscellaneous custom sizes used in the application.
const double loadingIconSize =
    220; // This value is custom and not derived from kSpace
const double appBarSize =
    60; // This value is custom and not derived from kSpace

// --- Label Sizes ---
// Standard sizes for text labels.
const double kXSmallLabelSize = kSpaceXSmall;
const double kSmallLabelSize = kSpaceSmall;
const double kMediumLabelSize = kSpaceMedium;
const double kLargeLabelSize = kSpaceLarge;
const double kSMediumLabelSize = kSpaceSMedium;
const double kXLargeLabelSize = kSpaceXLarge;
const double kXXLargeLabelSize = kSpaceXXLarge;
const double kXXXLargeLabelSize = kSpaceXXXLarge;
const double kX3LargeLabelSize = kSpaceX3Large;
const double kXX3LargeLabelSize = kSpaceXX3Large;
const double kXXX3LargeLabelSize = kSpaceXXX3Large;
const double kXXXX3LargeLabelSize = kSpaceXXXX3Large;

// --- Text Styles ---
// Predefined text styles for consistent typography.
const TextStyle kLargeHeadline = TextStyle(fontSize: kSpaceLarge);
const TextStyle kMediumHeadline = TextStyle(fontSize: kSpaceXLarge);
const TextStyle kLargeLabel = TextStyle(fontSize: kSpaceLarge);
const TextStyle kMediumLabel = TextStyle(fontSize: kSpaceMedium);

// --- SizedBox Vertical Gaps ---
// Predefined SizedBox widgets for vertical spacing.
const SizedBox kXXSmallVGap = SizedBox(height: kSpaceXXSmall);
const SizedBox kXSmallVGap = SizedBox(height: kSpaceXSmall);
const SizedBox kSmallVGap = SizedBox(height: kSpaceSmall);
const SizedBox kSMediumVGap = SizedBox(height: kSpaceSMedium);
const SizedBox kMediumVGap = SizedBox(height: kSpaceMedium);
const SizedBox kLargeVGap = SizedBox(height: kSpaceLarge);
const SizedBox kXLargeVGap = SizedBox(height: kSpaceXLarge);
const SizedBox kXXLargeVGap = SizedBox(height: kSpaceXXLarge);
const SizedBox kXXXLargeVGap = SizedBox(height: kSpaceXXXLarge);
const SizedBox kX3LargeVGap = SizedBox(height: kSpaceX3Large);
const SizedBox kXX3LargeVGap = SizedBox(height: kSpaceXX3Large);
const SizedBox kXXX3LargeVGap = SizedBox(height: kSpaceXXX3Large);
const SizedBox kXXXX3LargeVGap = SizedBox(height: kSpaceXXXX3Large);
const SizedBox kCustomVGap = SizedBox(height: 40); // Custom 40px gap

// --- SizedBox Horizontal Gaps ---
// Predefined SizedBox widgets for horizontal spacing.
const SizedBox kXXSmallHGap = SizedBox(width: kSpaceXXSmall);
const SizedBox kXSmallHGap = SizedBox(width: kSpaceXSmall);
const SizedBox kSmallHGap = SizedBox(width: kSpaceSmall);
const SizedBox kSMediumHGap = SizedBox(width: kSpaceSMedium);
const SizedBox kMediumHGap = SizedBox(width: kSpaceMedium);
const SizedBox kLargeHGap = SizedBox(width: kSpaceLarge);
const SizedBox kXLargeHGap = SizedBox(width: kSpaceXLarge);
const SizedBox kXXLargeHGap = SizedBox(width: kSpaceXXLarge);
const SizedBox kXXXLargeHGap = SizedBox(width: kSpaceXXXLarge);
const SizedBox kX3LargeHGap = SizedBox(width: kSpaceX3Large);
const SizedBox kXX3LargeHGap = SizedBox(width: kSpaceXX3Large);
const SizedBox kXXX3LargeHGap = SizedBox(width: kSpaceXXX3Large);
const SizedBox kXXXX3LargeHGap = SizedBox(width: kSpaceXXXX3Large);
const SizedBox kCustomHGap = SizedBox(width: 40); // Custom 40px gap

// --- Radius Values ---
// Standard border radius values.
const double kXXSmallRadius = kSpaceXXSmall;
const double kXSmallRadius = kSpaceXSmall;
const double kSmallRadius = kSpaceSmall;
const double kSMediumRadius = kSpaceSMedium; // Was kMediumRadius
const double kMediumRadius = kSpaceMedium;
const double kLargeRadius = kSpaceLarge;
const double kXLargeRadius = kSpaceXLarge;
const double kXXLargeRadius = kSpaceXXLarge;
const double kXXXLargeRadius = kSpaceXXXLarge;
const double kX3LargeRadius = kSpaceX3Large;
const double kXX3LargeRadius = kSpaceXX3Large;
const double kXXX3LargeRadius = kSpaceXXX3Large;
const double kXXXX3LargeRadius = kSpaceXXXX3Large;
const double kCustomRadius40 =
    40.0; // Renamed from mediumRadius, as 40.0 doesn't map to a kSpace constant
