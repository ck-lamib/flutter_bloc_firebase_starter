import 'package:flutter/material.dart';
import 'package:flutter_bloc_firebase_starter/common/widgets/confirmation_dialog.dart';

//for showing dialog. will return true if confirmed and false if cancled
class DialogUtils {
  const DialogUtils._();

  static Future<bool> showConfirmationDialog(
    BuildContext context, {
    required String title,
    required String message,
    required String confirmText,
  }) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => ConfirmationDialog(
            title: title,
            message: message,
            confirmText: confirmText,
          ),
        ) ??
        false;
  }
}
