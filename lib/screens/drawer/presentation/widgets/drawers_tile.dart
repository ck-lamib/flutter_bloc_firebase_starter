import 'package:flutter/material.dart';
import 'package:flutter_bloc_firebase_starter/utils/extensions/build_context_extensions.dart';
import 'package:flutter_bloc_firebase_starter/utils/extensions/string_extensions.dart';

class DrawersTile extends StatelessWidget {
  const DrawersTile({
    super.key,
    required this.leading,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.trailing,
  });

  final Widget leading;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(
        title,
        style: context.textTheme.bodyMedium,
      ),
      subtitle: !subtitle.isNullOrEmpty
          ? Text(
              subtitle!,
              style: context.textTheme.bodySmall,
            )
          : null,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
