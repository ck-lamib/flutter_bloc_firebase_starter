import 'package:flutter/material.dart';
import 'package:flutter_bloc_firebase_starter/screens/home/presentation/widgets/home_silver_appbar.dart';
import 'package:flutter_bloc_firebase_starter/utils/themes/spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, scrollInnerBody) => [
            const HomeSilverAppBar(),
          ],
          body: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.lg,
              ),
              child: Center(
                child: Text(
                  "This is Home Screen",
                ),
              )),
        ),
      ),
    );
  }
}
