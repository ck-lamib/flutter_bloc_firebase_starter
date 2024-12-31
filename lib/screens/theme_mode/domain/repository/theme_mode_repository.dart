abstract class ThemeModeRepository {
  Future<int> getOrSetInitialThemeModeIndex(int defaultThemeModeIndex);
  Future<void> setThemeMode(int themeModeIndex);
}
