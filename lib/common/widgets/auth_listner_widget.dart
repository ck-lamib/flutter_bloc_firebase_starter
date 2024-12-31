import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/snackbars.dart';
import 'package:flutter_bloc_firebase_starter/utils/routes/routes.dart';

//this is used for navigating in the authenticated state of app
class AuthBlocListnerWidget extends StatelessWidget {
  const AuthBlocListnerWidget({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUserAuthenticated) {
          Future.delayed(const Duration(milliseconds: 200), () {
            CustomSnackbar.showToastMessage(
              message:
                  "Welcome ${state.user.userName ?? "cute user"}!. Enjoy your time with us.",
            );
          });
          context.goNamed(Routes.dashboard.name);
        }
      },
      child: child,
    );
  }
}
