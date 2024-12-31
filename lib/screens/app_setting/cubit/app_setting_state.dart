part of 'app_setting_cubit.dart';

@immutable
class AppSettingState extends Equatable {
  const AppSettingState({
    this.selectedThemeMode = ThemeMode.system,
    this.modes = ThemeMode.values,
    this.isOnBoardingShown = false,
  });
  final ThemeMode selectedThemeMode;
  final List<ThemeMode> modes;
  final bool isOnBoardingShown;

  AppSettingState copyWith({
    ThemeMode? selectedThemeMode,
    List<ThemeMode>? modes,
    bool? isOnBoardingShown,
  }) {
    return AppSettingState(
      selectedThemeMode: selectedThemeMode ?? this.selectedThemeMode,
      modes: modes ?? this.modes,
      isOnBoardingShown: isOnBoardingShown ?? this.isOnBoardingShown,
    );
  }

  @override
  List<Object> get props => [
        selectedThemeMode,
        modes,
        isOnBoardingShown,
      ];
}
