import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_review/core/theme/app_color.dart';
import 'package:movie_review/core/theme/app_textstyle.dart';
import 'package:movie_review/core/widgets/spacing.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/icons/icon_menu.svg"),
                Text(
                  "FilmKu",
                  style: AppTextstyle.size16W500(),
                ),
                SvgPicture.asset("assets/icons/icon_notif.svg")
              ],
            ),
            YMargin(32),
            Text("Now Showing", style: AppTextstyle.size16W900()),
            YMargin(19),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    child: Image.asset(
                  "assets/images/image_poster.png",
                )),
                YMargin(12),
                Text(
                  "Spiderman: No Way Home",
                  style: AppTextstyle.size14W700(),
                ),
                YMargin(8),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/icon_star.svg"),
                    XMargin(4),
                    Text("9.1/10 IMDb",
                        style: AppTextstyle.size12W400(
                            color: AppColor.primaryText)),
                  ],
                )
              ],
            ),
            YMargin(24),
            Text("Popular", style: AppTextstyle.size16W900()),
            YMargin(15),
            Row(
              children: [
                ClipRRect(
                    child: Image.asset(
                  "assets/images/image_poster.png",
                  width: 85.w,
                  height: 128.h,
                )),
                XMargin(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Venom Let There Be \nCarnage",
                      style: AppTextstyle.size14W700(color: AppColor.mainColor),
                    ),
                    YMargin(6),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/icon_star.svg"),
                        XMargin(4),
                        Text("9.1/10 IMDb",
                            style: AppTextstyle.size12W400(
                                color: AppColor.primaryText)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
