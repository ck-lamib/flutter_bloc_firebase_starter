import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_starter/common/widgets/auth_listner_widget.dart';
import 'package:flutter_bloc_firebase_starter/core/dependency_injection.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/features/signup/cubit/signup_cubit.dart';

import 'package:flutter_bloc_firebase_starter/screens/auth/features/signup/presentation/widgets/signup_form.dart';
import 'package:flutter_bloc_firebase_starter/utils/themes/spacing.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupCubit>(),
      child: const AuthBlocListnerWidget(
        child: SignupView(),
      ),
    );
  }
}

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xlg),
          child: SignupForm(),
        ),
      ),
    );
  }
}
