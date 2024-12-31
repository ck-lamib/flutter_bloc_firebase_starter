// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:flutter_bloc_firebase_starter/core/app_module.dart' as _i15;
import 'package:flutter_bloc_firebase_starter/screens/app_setting/cubit/app_setting_cubit.dart'
    as _i430;
import 'package:flutter_bloc_firebase_starter/screens/auth/bloc/auth_bloc.dart'
    as _i633;
import 'package:flutter_bloc_firebase_starter/screens/auth/data/repository/firebase_auth_repository.dart'
    as _i837;
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/repository/auth_repository.dart'
    as _i483;
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/use_case/get_current_auth_state_use_case.dart'
    as _i146;
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/use_case/get_logged_in_user_use_case.dart'
    as _i936;
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/use_case/login_with_email_password_use_case.dart'
    as _i564;
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/use_case/login_with_google_use_case.dart'
    as _i575;
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/use_case/logout_use_case.dart'
    as _i183;
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/use_case/create_user_use_case.dart'
    as _i862;
import 'package:flutter_bloc_firebase_starter/screens/auth/features/login/bloc/login_bloc.dart'
    as _i93;
import 'package:flutter_bloc_firebase_starter/screens/auth/features/signup/cubit/signup_cubit.dart'
    as _i951;
import 'package:flutter_bloc_firebase_starter/screens/dashboard/cubit/bottom_navigation_cubit.dart'
    as _i816;
import 'package:flutter_bloc_firebase_starter/screens/onboarding/data/repository/onboarding_repository_impl.dart'
    as _i219;
import 'package:flutter_bloc_firebase_starter/screens/onboarding/domain/repository/onboarding_repository.dart'
    as _i996;
import 'package:flutter_bloc_firebase_starter/screens/onboarding/domain/use_case/get_or_set_initial_onboarding_value_use_case.dart'
    as _i308;
import 'package:flutter_bloc_firebase_starter/screens/onboarding/domain/use_case/set_onboarding_value_use_case.dart'
    as _i720;
import 'package:flutter_bloc_firebase_starter/screens/theme_mode/data/repository/theme_mode_repository_impl.dart'
    as _i175;
import 'package:flutter_bloc_firebase_starter/screens/theme_mode/domain/repository/theme_mode_repository.dart'
    as _i883;
import 'package:flutter_bloc_firebase_starter/screens/theme_mode/domain/use_case/get_or_set_initial_theme_mode_use_case.dart'
    as _i611;
import 'package:flutter_bloc_firebase_starter/screens/theme_mode/domain/use_case/set_theme_mode_id_use_case.dart'
    as _i267;
import 'package:flutter_bloc_firebase_starter/utils/helpers/connectivity_helper.dart'
    as _i850;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i59.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.factory<_i974.FirebaseFirestore>(() => appModule.firestore);
    gh.factory<_i457.FirebaseStorage>(() => appModule.firebaseStorage);
    gh.factory<_i116.GoogleSignIn>(() => appModule.googleSignIn);
    gh.factory<_i816.BottomNavigationCubit>(
        () => _i816.BottomNavigationCubit());
    gh.singleton<_i895.Connectivity>(() => appModule.connectivity);
    gh.factory<_i883.ThemeModeRepository>(
        () => _i175.ThemeModeRepositoryImpl());
    gh.factory<_i996.OnBoardingRepository>(
        () => _i219.OnBoardingRepositoryImpl());
    gh.factory<_i483.AuthRepository>(() => _i837.FirebaseAuthRepository(
          gh<_i59.FirebaseAuth>(),
          gh<_i116.GoogleSignIn>(),
        ));
    gh.factory<_i308.GetOrSetInitialOnBoardingValueUseCase>(() =>
        _i308.GetOrSetInitialOnBoardingValueUseCase(
            gh<_i996.OnBoardingRepository>()));
    gh.factory<_i720.SetOnBoardingValueUseCase>(() =>
        _i720.SetOnBoardingValueUseCase(gh<_i996.OnBoardingRepository>()));
    gh.singleton<_i850.ConnectivityHelper>(
        () => _i850.ConnectivityHelper(gh<_i895.Connectivity>()));
    gh.factory<_i611.GetOrSetInitialThemeModeUseCase>(() =>
        _i611.GetOrSetInitialThemeModeUseCase(gh<_i883.ThemeModeRepository>()));
    gh.factory<_i267.SetThemeModeUseCase>(
        () => _i267.SetThemeModeUseCase(gh<_i883.ThemeModeRepository>()));
    gh.factory<_i183.LogoutUseCase>(
        () => _i183.LogoutUseCase(gh<_i483.AuthRepository>()));
    gh.factory<_i936.GetLoggedInUserUseCase>(
        () => _i936.GetLoggedInUserUseCase(gh<_i483.AuthRepository>()));
    gh.factory<_i862.CreateUserUseCase>(
        () => _i862.CreateUserUseCase(gh<_i483.AuthRepository>()));
    gh.factory<_i564.LoginWithEmailPasswordUseCase>(
        () => _i564.LoginWithEmailPasswordUseCase(gh<_i483.AuthRepository>()));
    gh.factory<_i146.GetCurrentAuthStateUseCase>(
        () => _i146.GetCurrentAuthStateUseCase(gh<_i483.AuthRepository>()));
    gh.factory<_i575.LoginWithGoogleUseCase>(
        () => _i575.LoginWithGoogleUseCase(gh<_i483.AuthRepository>()));
    gh.factory<_i633.AuthBloc>(() => _i633.AuthBloc(
          gh<_i936.GetLoggedInUserUseCase>(),
          gh<_i146.GetCurrentAuthStateUseCase>(),
          gh<_i183.LogoutUseCase>(),
        ));
    gh.factory<_i430.AppSettingCubit>(() => _i430.AppSettingCubit(
          gh<_i611.GetOrSetInitialThemeModeUseCase>(),
          gh<_i267.SetThemeModeUseCase>(),
          gh<_i308.GetOrSetInitialOnBoardingValueUseCase>(),
          gh<_i720.SetOnBoardingValueUseCase>(),
        ));
    gh.factory<_i93.LoginBloc>(() => _i93.LoginBloc(
          gh<_i564.LoginWithEmailPasswordUseCase>(),
          gh<_i575.LoginWithGoogleUseCase>(),
        ));
    gh.factory<_i951.SignupCubit>(
        () => _i951.SignupCubit(gh<_i862.CreateUserUseCase>()));
    return this;
  }
}

class _$AppModule extends _i15.AppModule {}
