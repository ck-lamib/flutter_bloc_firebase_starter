import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_firebase_starter/app/app.dart';
import 'package:flutter_bloc_firebase_starter/app/bloc_observer.dart';
import 'package:flutter_bloc_firebase_starter/core/dependency_injection.dart';
import 'package:flutter_bloc_firebase_starter/firebase_options.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/sharedpreferences_helper.dart';

///This is the main function of the app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///for initiating bloc observer
  Bloc.observer = AppBlocObserver();

  //initializing firebase releated setup
  await _initializeFirebase();

  //initializing firebase releated setup
  await _initializeSharedPref();

  //initializing dependency injection
  configureDependencyInjection();

  //running the app
  runApp(const FirebaseStarterApp());
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> _initializeSharedPref() async {
  await SharedPreferencesHelper.init();
}
