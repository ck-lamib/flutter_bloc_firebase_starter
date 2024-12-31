import "package:flutter/material.dart";
import "package:flutter_bloc_firebase_starter/utils/constants/colors.dart";
import "package:go_router/go_router.dart";
import "package:flutter_bloc_firebase_starter/utils/helpers/dialog_utils.dart";

class DeleteAccountDrawerTile extends StatelessWidget {
  const DeleteAccountDrawerTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.person_remove_alt_1_outlined,
        color: AppColors.errorColor,
      ),
      title: const Text(
        "Delete Account",
        style: TextStyle(
          color: AppColors.errorColor,
        ),
      ),
      onTap: () => _showDeleteAccountConfirmationDialog(context),
    );
  }

  Future<void> _showDeleteAccountConfirmationDialog(
    BuildContext context,
  ) async {
    final confirmed = await DialogUtils.showConfirmationDialog(
      context,
      title: "Delete Account",
      message:
          "Are you sure you want to delete your account? This process is irreversible. You will lose access to all your data.",
      confirmText: "Delete",
    );

    if (confirmed && context.mounted) {
      context.pop();
      // context.read<AuthBloc>().add(const AuthLogoutButtonPressed());
      // context.go(Routes.login.path);
    }
  }
}
