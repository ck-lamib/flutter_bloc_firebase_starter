import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc_firebase_starter/screens/app_setting/cubit/app_setting_cubit.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc_firebase_starter/utils/constants/app_constant.dart';
import 'package:flutter_bloc_firebase_starter/utils/extensions/build_context_extensions.dart';
import 'package:flutter_bloc_firebase_starter/utils/routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<AuthBloc>(),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          // Introduce a 3-second delay
          await Future.delayed(const Duration(seconds: 3));
          if (context.mounted) {
            bool isOnBoardingShown =
                context.read<AppSettingCubit>().state.isOnBoardingShown;

            // Navigate based on the authentication state
            if (isOnBoardingShown) {
              if (state is AuthUserAuthenticated && context.mounted) {
                context.goNamed(Routes.dashboard.name);
              } else {
                context.goNamed(Routes.login.name);
              }
            } else {
              context.goNamed(Routes.onBoarding.name);
            }
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Text(
                AppConstant.appName,
                style: context.theme.textTheme.headlineLarge,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: context.screenSize.width * 0.4,
              child: const LinearProgressIndicator(
                minHeight: 2,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${AppConstant.appName} is loading ...",
              style: context.theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   child: CircularProgressIndicator(),
      // ),
    );
  }
}
