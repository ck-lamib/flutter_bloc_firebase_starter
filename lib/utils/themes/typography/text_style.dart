import 'package:flutter/material.dart';
import 'package:flutter_bloc_firebase_starter/utils/themes/typography/font_weight.dart';

abstract class AppTextStyle {
  static const _baseTextStyle = TextStyle(
    fontWeight: AppFontWeight.regular,
    fontFamily: 'LibreFranklin',
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );

  static final displayLarge = _baseTextStyle.copyWith(
    fontSize: 56.0,
    fontWeight: AppFontWeight.semiBold,
    height: 64 / 56, // Line Height / Font Size
  );
  static final displayMedium = _baseTextStyle.copyWith(
    fontSize: 48.0,
    fontWeight: AppFontWeight.semiBold,
    height: 56 / 48,
  );
  static final displaySmall = _baseTextStyle.copyWith(
    fontSize: 40.0,
    fontWeight: AppFontWeight.semiBold,
    height: 48 / 40,
  );
  static final headlineLarge = _baseTextStyle.copyWith(
    fontSize: 32.0,
    fontWeight: AppFontWeight.semiBold,
    height: 40 / 32,
  );
  static final headlineMedium = _baseTextStyle.copyWith(
    fontSize: 28.0,
    fontWeight: AppFontWeight.semiBold,
    height: 36 / 28,
  );
  static final headlineSmall = _baseTextStyle.copyWith(
    fontSize: 24.0,
    fontWeight: AppFontWeight.semiBold,
    height: 32 / 24,
  );
  static final titleLarge = _baseTextStyle.copyWith(
    fontSize: 22.0,
    fontWeight: AppFontWeight.semiBold,
    height: 28 / 22,
  );
  static final titleMedium = _baseTextStyle.copyWith(
    fontSize: 20.0,
    fontWeight: AppFontWeight.semiBold,
    height: 26 / 20,
  );
  static final titleSmall = _baseTextStyle.copyWith(
    fontSize: 18.0,
    fontWeight: AppFontWeight.semiBold,
    height: 24 / 18,
  );
  static final bodyLarge = _baseTextStyle.copyWith(
    fontSize: 18.0,
    fontWeight: AppFontWeight.regular,
    height: 24 / 18,
  );
  static final bodyMedium = _baseTextStyle.copyWith(
    fontSize: 16.0,
    fontWeight: AppFontWeight.regular,
    height: 24 / 16,
  );
  static final bodySmall = _baseTextStyle.copyWith(
    fontSize: 14.0,
    fontWeight: AppFontWeight.regular,
    height: 20 / 14,
  );

  static final button = _baseTextStyle.copyWith(
    fontSize: 14.0,
    fontWeight: AppFontWeight.semiBold,
    height: 20 / 14,
  );
  static final caption = _baseTextStyle.copyWith(
    fontSize: 12.0,
    fontWeight: AppFontWeight.regular,
    height: 16 / 12,
  );
  static final overline = _baseTextStyle.copyWith(
    fontSize: 10.0,
    fontWeight: AppFontWeight.regular,
    height: 14 / 10,
  );

  static final labelLarge = button;
  static final labelMedium = caption;
  static final labelSmall = overline;
}
