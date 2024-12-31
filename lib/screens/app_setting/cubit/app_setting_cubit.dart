import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc_firebase_starter/screens/onboarding/domain/use_case/get_or_set_initial_onboarding_value_use_case.dart';
import 'package:flutter_bloc_firebase_starter/screens/onboarding/domain/use_case/set_onboarding_value_use_case.dart';
import 'package:flutter_bloc_firebase_starter/screens/theme_mode/domain/use_case/get_or_set_initial_theme_mode_use_case.dart';
import 'package:flutter_bloc_firebase_starter/screens/theme_mode/domain/use_case/set_theme_mode_id_use_case.dart';

part 'app_setting_state.dart';

//for app setting such as theme mode and onboarding
@injectable
class AppSettingCubit extends Cubit<AppSettingState> {
  AppSettingCubit(
    this._getOrSetInitialThemeModeUseCase,
    this._setThemeModeUseCase,
    this._getOrSetInitialOnBoardingValueUseCase,
    this._setOnBoardingValueUseCase,
  ) : super(
          const AppSettingState(),
        );

  final GetOrSetInitialThemeModeUseCase _getOrSetInitialThemeModeUseCase;
  final SetThemeModeUseCase _setThemeModeUseCase;
  final GetOrSetInitialOnBoardingValueUseCase
      _getOrSetInitialOnBoardingValueUseCase;
  final SetOnBoardingValueUseCase _setOnBoardingValueUseCase;

  Future<int> _getCurrentTheme() async {
    var systemThemeModeId = ThemeMode.system.index;

    var themeModeId = await _getOrSetInitialThemeModeUseCase.execute(
      GetOrSetInitialThemeModeUseCaseParams(
        currentThemeModeId: systemThemeModeId,
      ),
    );
    return themeModeId;
  }

  void setTheme(int? themeModeIndex) {
    if (themeModeIndex == null) return;

    _setThemeModeUseCase.execute(SetThemeModeUseCaseParams(
      themeModeIndex: themeModeIndex,
    ));

    emit(
      state.copyWith(
        selectedThemeMode: state.modes[themeModeIndex],
      ),
    );
  }

  Future<bool> _getOnBoardingValue() async {
    var value = await _getOrSetInitialOnBoardingValueUseCase.execute(
      const GetOrSetInitialOnBoardingValueUseCaseParams(
        currentOnBoardingValue: false,
      ),
    );
    return value;
  }

  void setOnBoardingValue(bool? onBoardingValue) {
    if (onBoardingValue == null) return;

    _setOnBoardingValueUseCase.execute(
      SetOnBoardingValueUseCaseParams(
        onBoardingValue: onBoardingValue,
      ),
    );

    emit(
      state.copyWith(
        isOnBoardingShown: onBoardingValue,
      ),
    );
  }

  void getCurrentSetting() async {
    var themeModeId = await _getCurrentTheme();
    var onBoardingValue = await _getOnBoardingValue();
    emit(
      state.copyWith(
        selectedThemeMode: ThemeMode.values[themeModeId],
        isOnBoardingShown: onBoardingValue,
      ),
    );
  }
}
