import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc_firebase_starter/screens/drawer/presentation/widgets/drawers_tile.dart';
import 'package:flutter_bloc_firebase_starter/utils/routes/routes.dart';

class ThemeModeSettingsTile extends StatelessWidget {
  const ThemeModeSettingsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawersTile(
      leading: const Icon(Icons.dark_mode),
      title: "Theme mode",
      onTap: () {
        context.push(Routes.themeMode.path);
      },
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    );
  }
}
