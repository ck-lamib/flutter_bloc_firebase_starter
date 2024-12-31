import 'package:flutter/material.dart';

/// Default Spacing in App UI.
abstract class AppSpacing {
  /// The default unit of spacing
  static const double spaceUnit = 16;

  /// xxxs spacing value (1pt)
  static const double xxxs = 0.0625 * spaceUnit;

  /// xxs spacing value (2pt)
  static const double xxs = 0.125 * spaceUnit;

  /// xs spacing value (4pt)
  static const double xs = 0.25 * spaceUnit;

  /// sm spacing value (8pt): basically for inter widget spacing like gap between textfield
  static const double sm = 0.5 * spaceUnit;

  /// md spacing value (12pt): basically for app widget padding
  static const double md = 0.75 * spaceUnit;

  /// lg spacing value (16pt) :
  static const double lg = spaceUnit;

  /// xlg spacing value (24pt) : basically for app horizontal pading
  static const double xlg = 1.5 * spaceUnit;

  /// xxlg spacing value (40pt) : for small big spacing
  static const double xxlg = 2.5 * spaceUnit;

  /// xxxlg pacing value (64pt) : for big spacing
  static const double xxxlg = 4 * spaceUnit;
}

/// Constant gap widths
const gapW1 = SizedBox(width: AppSpacing.xxxs);
const gapW2 = SizedBox(width: AppSpacing.xxs);
const gapW4 = SizedBox(width: AppSpacing.xs);
const gapW8 = SizedBox(width: AppSpacing.sm);
const gapW12 = SizedBox(width: AppSpacing.md);
const gapW16 = SizedBox(width: AppSpacing.lg);
const gapW24 = SizedBox(width: AppSpacing.xlg);
const gapW40 = SizedBox(width: AppSpacing.xxlg);
const gapW64 = SizedBox(width: AppSpacing.xxxlg);

/// Constant gap heights
const gapH1 = SizedBox(height: AppSpacing.xxxs);
const gapH2 = SizedBox(height: AppSpacing.xxs);
const gapH4 = SizedBox(height: AppSpacing.xs);
const gapH8 = SizedBox(height: AppSpacing.sm);
const gapH12 = SizedBox(height: AppSpacing.md);
const gapH16 = SizedBox(height: AppSpacing.lg);
const gapH24 = SizedBox(height: AppSpacing.xlg);
const gapH40 = SizedBox(height: AppSpacing.xxlg);
const gapH64 = SizedBox(height: AppSpacing.xxxlg);
