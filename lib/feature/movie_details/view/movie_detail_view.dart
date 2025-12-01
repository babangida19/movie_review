// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:movie_review/core/theme/app_color.dart';
// import 'package:movie_review/core/theme/app_textstyle.dart';
// import 'package:movie_review/core/widgets/spacing.dart';

// class MovieDetailView extends StatelessWidget {
//   const MovieDetailView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         top: false,
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Image.asset(
//                   "assets/images/image_poster.png",
//                   height: 300.h,
//                   width: 1.sw,
//                   fit: BoxFit.cover,
//                 ),
//                 Positioned(
//                   top: 70.h,
//                   left: 24.w,
//                   right: 24.w,
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           SvgPicture.asset("assets/icons/icon_back.svg"),
//                           SvgPicture.asset("assets/icons/icon_dot.svg")
//                         ],
//                       ),
//                       YMargin(50),
//                       Container(
//                         padding: EdgeInsets.all(11),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: AppColor.white,
//                         ),
//                         child: SvgPicture.asset("assets/icons/icon_play.svg"),
//                       ),
//                       YMargin(8),
//                       Text(
//                         "Play Trailer",
//                         style: AppTextstyle.size12W400(
//                             fontWeight: FontWeight.w700, color: AppColor.white),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             Container(
//               padding: EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(24.r),
//                       bottomRight: Radius.circular(24.r))),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Spiderman: No Way Home",
//                         style: AppTextstyle.size20W700(),
//                       ),
//                       SvgPicture.asset("assets/icons/icon_bookmark.svg")
//                     ],
//                   ),
//                   YMargin(8),
//                   Row(
//                     children: [
//                       SvgPicture.asset("assets/icons/icon_star.svg"),
//                       XMargin(4),
//                       Text("9.1/10 IMDb",
//                           style: AppTextstyle.size12W400(
//                               color: AppColor.primaryText)),
//                     ],
//                   ),
//                   YMargin(16),
//                   Container(
//                     padding:
//                         EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100.r),
//                         color: AppColor.blue100),
//                     child: Text("HORROR", style: AppTextstyle.size8W700()),
//                   ),
//                   YMargin(16),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Length",
//                           style: AppTextstyle.size12W400(
//                               color: AppColor.primaryText)),
//                       YMargin(4),
//                       Text("2h 28min",
//                           style: AppTextstyle.size12W400(
//                               fontWeight: FontWeight.w600)),
//                     ],
//                   ),
//                   YMargin(24),
//                   Text("Description", style: AppTextstyle.size16W900()),
//                   YMargin(8),
//                   Text(
//                     "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help.",
//                     style: AppTextstyle.size12W400(color: AppColor.primaryText),
//                   ),
//                   YMargin(24),
//                   Text("Cast", style: AppTextstyle.size16W900()),
//                   YMargin(19),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Image.asset(
//                         "assets/images/image_poster.png",
//                         height: 76.h,
//                         width: 72.w,
//                         fit: BoxFit.cover,
//                       ),
//                       YMargin(4),
//                       Text("Tom Holland",
//                           style: AppTextstyle.size12W400(
//                               color: AppColor.mainColor))
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_review/core/theme/app_color.dart';
import 'package:movie_review/core/theme/app_textstyle.dart';
import 'package:movie_review/core/widgets/spacing.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.h,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image.asset(
                    "assets/images/image_poster.png",
                    height: 300.h,
                    width: 1.sw,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 70.h,
                    left: 24.w,
                    right: 24.w,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset("assets/icons/icon_back.svg"),
                            SvgPicture.asset("assets/icons/icon_dot.svg")
                          ],
                        ),
                        YMargin(50),
                        Container(
                          padding: EdgeInsets.all(11),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.white,
                          ),
                          child: SvgPicture.asset("assets/icons/icon_play.svg"),
                        ),
                        YMargin(8),
                        Text(
                          "Play Trailer",
                          style: AppTextstyle.size12W400(
                              fontWeight: FontWeight.w700,
                              color: AppColor.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
            leading: SizedBox.shrink(),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Spiderman: No Way Home",
                        style: AppTextstyle.size20W700(),
                      ),
                      SvgPicture.asset("assets/icons/icon_bookmark.svg")
                    ],
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
                  ),
                  YMargin(16),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: AppColor.blue100),
                    child: Text("HORROR", style: AppTextstyle.size8W700()),
                  ),
                  YMargin(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Length",
                          style: AppTextstyle.size12W400(
                              color: AppColor.primaryText)),
                      YMargin(4),
                      Text("2h 28min",
                          style: AppTextstyle.size12W400(
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  YMargin(24),
                  Text("Description", style: AppTextstyle.size16W900()),
                  YMargin(8),
                  Text(
                    "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help.",
                    style: AppTextstyle.size12W400(color: AppColor.primaryText),
                  ),
                  YMargin(24),
                  Text("Cast", style: AppTextstyle.size16W900()),
                  YMargin(19),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/image_poster.png",
                        height: 76.h,
                        width: 72.w,
                        fit: BoxFit.cover,
                      ),
                      YMargin(4),
                      Text("Tom Holland",
                          style: AppTextstyle.size12W400(
                              color: AppColor.mainColor))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}