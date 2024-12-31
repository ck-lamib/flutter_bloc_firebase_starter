import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_starter/common/widgets/auth_listner_widget.dart';
import 'package:flutter_bloc_firebase_starter/core/dependency_injection.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/features/login/bloc/login_bloc.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/features/login/presentation/widgets/login_form.dart';
import 'package:flutter_bloc_firebase_starter/utils/themes/spacing.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: const AuthBlocListnerWidget(
        child: LoginView(),
      ),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xlg),
          child: LoginForm(),
        ),
      ),
    );
  }
}
