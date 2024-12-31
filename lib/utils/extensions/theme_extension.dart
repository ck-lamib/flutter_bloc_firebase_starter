import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_starter/screens/app_setting/cubit/app_setting_cubit.dart';

//for getting the app theme currently set
extension ThemeExtension on BuildContext {
  ThemeMode get watchCurrentThemeMode {
    return watch<AppSettingCubit>().state.selectedThemeMode;
  }
}
