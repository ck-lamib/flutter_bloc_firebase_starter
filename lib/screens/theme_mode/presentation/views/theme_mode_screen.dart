import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_starter/screens/app_setting/cubit/app_setting_cubit.dart';
import 'package:flutter_bloc_firebase_starter/utils/extensions/string_extensions.dart';

class ThemeModePage extends StatelessWidget {
  const ThemeModePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme mode"),
      ),
      body: SafeArea(
        child: BlocBuilder<AppSettingCubit, AppSettingState>(
          buildWhen: (previous, current) =>
              previous.selectedThemeMode != current.selectedThemeMode,
          builder: (context, state) {
            return ListView(
              children: state.modes
                  .map((mode) => RadioListTile(
                        title: Text(
                          mode.name.capitalize,
                        ),
                        value: mode.index,
                        groupValue: state.selectedThemeMode.index,
                        onChanged: (value) =>
                            context.read<AppSettingCubit>().setTheme(value),
                      ))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
