import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_review/core/model/popular_movie_model.dart';
import 'package:movie_review/core/theme/app_color.dart';
import 'package:movie_review/core/theme/app_textstyle.dart';
import 'package:movie_review/core/widgets/app_shimmer.dart';
import 'package:movie_review/core/widgets/spacing.dart';
import 'package:movie_review/feature/movie_details/view/movie_detail_view.dart';

class HighestRatedCard extends StatelessWidget {
  const HighestRatedCard({
    super.key,
    required this.movie,
  });

  final Result? movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailView(
                      movieId: movie?.id ?? 0,
                    )));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              "https://image.tmdb.org/t/p/w500${movie?.posterPath}",
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
          YMargin(12),
          SizedBox(
            width: 100.w,
            child: Text(
              movie?.title ?? "_",
              style: AppTextstyle.size14W700(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          YMargin(8),
          Row(
            children: [
              SvgPicture.asset("assets/icons/icon_star.svg"),
              XMargin(4),
              Text("${movie?.voteAverage?.toStringAsFixed(1) ?? '0.0'}/10",
                  style: AppTextstyle.size12W400(color: AppColor.primaryText)),
            ],
          )
        ],
      ),
    );
  }
}

class HighestRatedCardShimmer extends StatelessWidget {
  const HighestRatedCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: AppShimmer.rectangular(height: 128.h, width: 100.w)),
            XMargin(4),
            Expanded(
                child: AppShimmer.rectangular(height: 128.h, width: 100.w)),
            XMargin(4),
            Expanded(
                child: AppShimmer.rectangular(height: 128.h, width: 100.w)),
          ],
        ),
      ],
    );
  }
}
