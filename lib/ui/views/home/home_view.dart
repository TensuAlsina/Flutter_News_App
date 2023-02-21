import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:news_app/ui/views/home/home_viewmodel.dart';

import 'package:stacked/stacked.dart';

import '../myhome/myhome_view.dart';
import '../profile/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        return Scaffold(
            bottomNavigationBar: GNav(
              backgroundColor: Colors.cyan,
              onTabChange: model.setIndex,
              gap: 8,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.settings,
                  text: "Setting",
                ),
              ],
            ),
            body: getViewForIndex(model.currentIndex));
      },
    );
  }

  Widget getViewForIndex(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const MyHomeView();
      case 1:
        return const ProfileView();

      default:
        return const MyHomeView();
    }
  }
}
