import 'package:flutter/material.dart';
import 'package:flutter_bloc_firebase_starter/utils/constants/colors.dart';
import 'package:flutter_bloc_firebase_starter/utils/themes/border_radius.dart';
import 'package:flutter_bloc_firebase_starter/utils/themes/typography/text_style.dart';

///for customizing app theme
class AppTheme {
  static final lightTheme = _getTheme(_lightColorScheme);
  static final darkTheme = _getTheme(_darkColorScheme);

  static final _lightColorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.lightSeedColor,
    brightness: Brightness.light,
  );

  static final _darkColorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.darkSeedColor,
    brightness: Brightness.dark,
  );

  static ThemeData _getTheme(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: _getTextTheme(colorScheme),
      appBarTheme: _getAppBarTheme(),
      elevatedButtonTheme: _getElevatedButtonTheme(),
      textButtonTheme: _getTextButtonTheme(),
      inputDecorationTheme: _getInputDecorationTheme(),
    );
  }

  static TextTheme _getTextTheme(ColorScheme colorScheme) {
    return TextTheme(
      displayLarge: AppTextStyle.displayLarge,
      displayMedium: AppTextStyle.displayMedium,
      displaySmall: AppTextStyle.displaySmall,
      headlineLarge: AppTextStyle.headlineLarge,
      headlineMedium: AppTextStyle.headlineMedium,
      headlineSmall: AppTextStyle.headlineSmall,
      titleLarge: AppTextStyle.titleLarge,
      titleMedium: AppTextStyle.titleMedium,
      titleSmall: AppTextStyle.titleSmall,
      bodyLarge: AppTextStyle.bodyLarge,
      bodyMedium: AppTextStyle.bodyMedium,
      bodySmall: AppTextStyle.bodySmall,
      labelLarge: AppTextStyle.labelLarge,
      labelMedium: AppTextStyle.labelMedium,
      labelSmall: AppTextStyle.labelSmall,
    ).apply(
      displayColor: colorScheme.onSurface,
      bodyColor: colorScheme.onSurface,
    );
  }

  static AppBarTheme _getAppBarTheme() {
    return const AppBarTheme(
        // scrolledUnderElevation: 0,
        // forceMaterialTransparency: true,
        );
  }

  static ElevatedButtonThemeData _getElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        maximumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppBorderRadius.medium,
          ),
        ),
      ),
    );
  }

  static TextButtonThemeData _getTextButtonTheme() {
    return TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        maximumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppBorderRadius.medium,
          ),
        ),
      ),
    );
  }

  static InputDecorationTheme _getInputDecorationTheme() {
    return InputDecorationTheme(
      errorStyle: AppTextStyle.labelMedium,
      labelStyle: AppTextStyle.bodySmall,
    );
  }
}
