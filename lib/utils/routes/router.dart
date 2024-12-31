import 'package:flutter/material.dart';
import 'package:flutter_bloc_firebase_starter/screens/home/presentation/views/home_screen.dart';
import 'package:flutter_bloc_firebase_starter/screens/profile/presentation/views/profile_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc_firebase_starter/app/navigation_observer.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/features/login/presentation/views/login_screen.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/features/signup/presentation/views/signup_screen.dart';
import 'package:flutter_bloc_firebase_starter/screens/dashboard/presentation/views/dashboard_screen.dart';
import 'package:flutter_bloc_firebase_starter/screens/drawer/presentation/widgets/about_developer.dart';
import 'package:flutter_bloc_firebase_starter/screens/onboarding/presentation/views/onboarding_screen.dart';
import 'package:flutter_bloc_firebase_starter/screens/splash/views/splash_screen.dart';
import 'package:flutter_bloc_firebase_starter/screens/theme_mode/presentation/views/theme_mode_screen.dart';
import 'package:flutter_bloc_firebase_starter/utils/routes/routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  navigatorKey: navigatorKey,
  observers: [
    AppNavigatorObserver(),
  ],
  routes: [
    GoRoute(
      name: Routes.splash.name,
      path: Routes.splash.path,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: Routes.onBoarding.name,
      path: Routes.onBoarding.path,
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      name: Routes.themeMode.name,
      path: Routes.themeMode.path,
      builder: (context, state) => const ThemeModePage(),
    ),
    GoRoute(
      name: Routes.login.name,
      path: Routes.login.path,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: Routes.signup.name,
      path: Routes.signup.path,
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      name: Routes.dashboard.name,
      path: Routes.dashboard.path,
      builder: (context, state) => const DashboardScreen(),
      routes: [
        GoRoute(
          name: Routes.home.name,
          path: Routes.home.name,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: Routes.profile.name,
          path: Routes.profile.name,
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
    GoRoute(
      name: Routes.aboutDeveloper.name,
      path: Routes.aboutDeveloper.path,
      builder: (context, state) => AboutDeveloper(),
    ),
  ],
);
