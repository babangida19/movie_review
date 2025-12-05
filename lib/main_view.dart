import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
        elevation: 8,
        height: 60.h,
        selectedIndex: selectedIndex.value,
        onDestinationSelected: onDestinationSelected,
        indicatorColor: AppColor.white,
        destinations: [
          NavigationDestination(
            icon:SvgPicture.asset("assets/icons/icon_home_tab.svg"),
            label: "",
          ),
          NavigationDestination(
            icon: SvgPicture.asset("assets/icons/icon_bookmarket_tab.svg"),
            label: "",
          ),
          NavigationDestination(
            icon:SvgPicture.asset("assets/icons/icon_saved_tab.svg"),
            label: "",
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

      default:
        return Container();
    }
  }
}
