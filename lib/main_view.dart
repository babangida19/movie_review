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
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
          child: NavigationBar(
            backgroundColor: Colors.white,
            elevation: 0,
            height: 50.h,
            selectedIndex: selectedIndex.value,
            onDestinationSelected: onDestinationSelected,
            indicatorColor: AppColor.white.withOpacity(0.1),
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            animationDuration: Duration(milliseconds: 400),
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(
                  "assets/icons/icon_home_tab.svg",
                  width: 24.w,
                  height: 24.h,
                ),
                selectedIcon: SvgPicture.asset(
                  "assets/icons/icon_home_tab.svg",
                  width: 26.w,
                  height: 26.h,
                ),
                label: "Home",
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  "assets/icons/icon_bookmarket_tab.svg",
                  width: 24.w,
                  height: 24.h,
                ),
                selectedIcon: SvgPicture.asset(
                  "assets/icons/icon_bookmarket_tab.svg",
                  width: 26.w,
                  height: 26.h,
                ),
                label: "Bookmark",
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  "assets/icons/icon_saved_tab.svg",
                  width: 24.w,
                  height: 24.h,
                ),
                selectedIcon: SvgPicture.asset(
                  "assets/icons/icon_saved_tab.svg",
                  width: 26.w,
                  height: 26.h,
                ),
                label: "Saved",
              ),
            ],
          ),
        ),
      ),
      body: _buildPage(selectedIndex.value),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return Center(
          child: Text(
            'Bookmarks',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
      case 2:
        return Center(
          child: Text(
            'Saved',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
      default:
        return Container();
    }
  }
}
