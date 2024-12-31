import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_bloc_firebase_starter/utils/constants/colors.dart";
import "package:go_router/go_router.dart";
import "package:flutter_bloc_firebase_starter/screens/auth/bloc/auth_bloc.dart";

import "package:flutter_bloc_firebase_starter/utils/helpers/dialog_utils.dart";
import "package:flutter_bloc_firebase_starter/utils/routes/routes.dart";

class LogoutDrawerTile extends StatelessWidget {
  const LogoutDrawerTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.exit_to_app,
        color: AppColors.errorColor,
      ),
      title: const Text(
        "Logout",
        style: TextStyle(
          color: AppColors.errorColor,
        ),
      ),
      onTap: () => _showLogOutConfirmationDialog(context),
    );
  }

  Future<void> _showLogOutConfirmationDialog(
    BuildContext context,
  ) async {
    final confirmed = await DialogUtils.showConfirmationDialog(
      context,
      title: "Logout",
      message: "Are you sure you want to logout?",
      confirmText: "Logout",
    );

    if (confirmed && context.mounted) {
      context.read<AuthBloc>().add(const AuthLogoutButtonPressed());
      context.go(Routes.login.path);
    }
  }
}
