import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_review/feature/home/view/home_view.dart';
import 'package:movie_review/core/theme/app_color.dart';

class MainView extends HookWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);

    void onDestinationSelected(int index) {
      selectedIndex.value = index;
    }

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        height: 94.h,
        selectedIndex: selectedIndex.value,
        onDestinationSelected: onDestinationSelected,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            // Assets.icons.iconExplore.svg(),
            label: "Explore",
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            // Assets.icons.iconWallet.svg(),
            label: "Portfolio",
          ),
          NavigationDestination(
            icon: Icon(Icons.book),
            // Assets.icons.iconSpend.svg(),
            label: "Spend",
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: "Connect",
          ),
        ],
      ),
      body: _buildPage(selectedIndex.value),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return Container();
      case 2:
        return Container();
      case 3:
        return Container();
      case 4:
        return Container();
      default:
        return Container();
    }
  }
}
