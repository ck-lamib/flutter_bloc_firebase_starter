import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_starter/core/dependency_injection.dart';
import 'package:flutter_bloc_firebase_starter/screens/app_setting/cubit/app_setting_cubit.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc_firebase_starter/screens/package_info/cubit/package_info_cubit.dart';
import 'package:flutter_bloc_firebase_starter/utils/constants/app_constant.dart';
import 'package:flutter_bloc_firebase_starter/utils/routes/router.dart';
import 'package:flutter_bloc_firebase_starter/utils/themes/app_theme.dart';

///This is the main entry point of the app
class FirebaseStarterApp extends StatelessWidget {
  const FirebaseStarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AuthBloc>()
            ..add(
              const AuthInitialCheckRequested(),
            ),
        ),
        BlocProvider(
          create: (_) => getIt<AppSettingCubit>()..getCurrentSetting(),
        ),
        BlocProvider(
          lazy: false,
          create: (_) => PackageInfoCubit()..loadPackageInfo(),
        ),
      ],
      child: const FirebaseStarterAppView(),
    );
  }
}

class FirebaseStarterAppView extends StatelessWidget {
  const FirebaseStarterAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingCubit, AppSettingState>(
      buildWhen: (previous, current) =>
          previous.selectedThemeMode != current.selectedThemeMode,
      builder: (context, state) {
        return MaterialApp.router(
          title: AppConstant.appName,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.selectedThemeMode,
          // themeMode: ThemeMode.light,
        );
      },
    );
  }
}
