import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_review/core/model/popular_movie_model.dart';
import 'package:movie_review/core/theme/app_color.dart';
import 'package:movie_review/core/theme/app_textstyle.dart';
import 'package:movie_review/core/widgets/app_shimmer.dart';
import 'package:movie_review/core/widgets/spacing.dart';
import 'package:movie_review/feature/movie_details/view/movie_detail_view.dart';

class PopularMovieCard extends StatelessWidget {
  final Result movie;

  const PopularMovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailView(
                      movieId: movie.id ?? 0,
                    )));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              "https://image.tmdb.org/t/p/w200${movie.posterPath}",
              fit: BoxFit.cover,
              height: 128.h,
              width: 100.w,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 128.h,
                  width: 100.w,
                  color: Colors.grey,
                  child: Icon(Icons.movie),
                );
              },
            ),
          ),
          XMargin(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title ?? "Unknown",
                  style: AppTextstyle.size14W700(color: AppColor.mainColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                YMargin(6),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/icon_star.svg"),
                    XMargin(4),
                    Text(
                        "${movie.voteAverage?.toStringAsFixed(1) ?? '0.0'}/10 IMDb",
                        style: AppTextstyle.size12W400(
                            color: AppColor.primaryText)),
                  ],
                ),
                YMargin(8),
                // movie.
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: AppColor.blue100),
                  child: Text("VIEW DETAILS", style: AppTextstyle.size8W700()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PopularMovieCardShimmer extends StatelessWidget {
  const PopularMovieCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(3, (i) {
      return Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: AppShimmer.rectangular(
                  height: 128.h,
                  width: 100.w,
                ),
              ),
              XMargin(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppShimmer.rectangular(
                      height: 16.h,
                      width: 140.w,
                    ),
                    YMargin(8),
                    Row(
                      children: [
                        AppShimmer.rectangular(height: 14.h, width: 14.w),
                        XMargin(8),
                        AppShimmer.rectangular(height: 14.h, width: 50.w),
                      ],
                    ),
                    YMargin(10),
                    AppShimmer.circular(
                      height: 24.h,
                      width: 90.w,
                      radius: 100.r,
                    ),
                  ],
                ),
              ),
            ],
          ));
    }));
  }
}
