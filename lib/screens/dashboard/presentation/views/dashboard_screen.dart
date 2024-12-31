import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_starter/core/dependency_injection.dart';
import 'package:flutter_bloc_firebase_starter/screens/dashboard/cubit/bottom_navigation_cubit.dart';

import 'package:flutter_bloc_firebase_starter/screens/dashboard/presentation/widgets/dashboard_body.dart';
import 'package:flutter_bloc_firebase_starter/screens/dashboard/presentation/widgets/dashboard_navbar.dart';
import 'package:flutter_bloc_firebase_starter/screens/drawer/presentation/views/drawer_widget.dart';

var drawerKey = GlobalKey<ScaffoldState>();

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<BottomNavigationCubit>(),
        ),
      ],
      child: OfflineDashboardView(),
    );
  }
}

class OfflineDashboardView extends StatelessWidget {
  final PageController _pageController = PageController();
  OfflineDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      drawer: DrawerWidget(),
      body: DashboardBodyWidget(pageController: _pageController),
      bottomNavigationBar: DashboardNavbarWidget(
        pageController: _pageController,
      ),
    );
  }
}
