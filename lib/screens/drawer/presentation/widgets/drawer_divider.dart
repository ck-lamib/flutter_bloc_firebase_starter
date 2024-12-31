import 'package:flutter/material.dart';
import 'package:flutter_bloc_firebase_starter/utils/themes/spacing.dart';

class DrawerDivider extends StatelessWidget {
  const DrawerDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Divider(
        height: AppSpacing.md,
      ),
    );
  }
}
