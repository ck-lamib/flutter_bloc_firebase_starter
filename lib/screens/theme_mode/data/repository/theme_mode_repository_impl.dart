import 'package:injectable/injectable.dart';
import 'package:flutter_bloc_firebase_starter/screens/theme_mode/domain/repository/theme_mode_repository.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/sharedpreferences_helper.dart';

@Injectable(as: ThemeModeRepository)
class ThemeModeRepositoryImpl implements ThemeModeRepository {
  final SharedPreferencesHelper _pref = SharedPreferencesHelper();
  final _themeModeIdKey = "themeModeId";

  @override
  Future<int> getOrSetInitialThemeModeIndex(int defaultThemeModeIndex) async {
    if (defaultThemeModeIndex < 0) {
      throw ArgumentError("Theme mode id cannot be less than 0.");
    }

    final storedThemeMode = await _pref.getInt(_themeModeIdKey);
    if (storedThemeMode != null) {
      return storedThemeMode;
    } else {
      await setThemeMode(defaultThemeModeIndex);
      return defaultThemeModeIndex;
    }
  }

  @override
  Future<void> setThemeMode(int themeModeId) async {
    if (themeModeId < 0) {
      throw ArgumentError("Theme mode id cannot be less than 0.");
    }

    await _pref.setInt(_themeModeIdKey, themeModeId);
  }
}
