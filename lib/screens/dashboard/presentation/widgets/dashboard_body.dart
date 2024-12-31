import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_starter/screens/dashboard/cubit/bottom_navigation_cubit.dart';
import 'package:flutter_bloc_firebase_starter/screens/home/presentation/views/home_screen.dart';
import 'package:flutter_bloc_firebase_starter/screens/profile/presentation/views/profile_screen.dart';

class DashboardBodyWidget extends StatelessWidget {
  final PageController _pageController;

  const DashboardBodyWidget({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: (index) {
        BlocProvider.of<BottomNavigationCubit>(context).changePage(index);
      },
      children: const [
        HomeScreen(),
        ProfileScreen(),

        // HomeScreen(),
      ],
    );
  }
}
