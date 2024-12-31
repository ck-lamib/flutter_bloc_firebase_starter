import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_starter/screens/dashboard/cubit/bottom_navigation_cubit.dart';

class DashboardNavbarWidget extends StatelessWidget {
  final PageController _pageController;

  const DashboardNavbarWidget({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavigationCubit, BottomNavigationState>(
      listener: (context, state) {
        _pageController.jumpToPage(state.currentIndex);
      },
      builder: (context, state) {
        return NavigationBar(
          onDestinationSelected: (int index) {
            BlocProvider.of<BottomNavigationCubit>(context).changePage(index);
          },
          indicatorColor: Colors.amber,
          selectedIndex: state.currentIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings_outlined),
              label: "Profile",
            ),
          ],
        );
      },
    );
  }
}
