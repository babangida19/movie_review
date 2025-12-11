import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_review/core/theme/app_color.dart';
import 'package:movie_review/core/theme/app_textstyle.dart';
import 'package:movie_review/core/util/providers.dart';
import 'package:movie_review/core/widgets/spacing.dart';
import 'package:movie_review/feature/movie_details/widget/movie_detail_shimmer.dart';

class MovieDetailView extends HookConsumerWidget {
  final int movieId;
  const MovieDetailView({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetailsModelVm = ref.watch(movieDetailViewModel);
    final movieDetailsNotifier = ref.read(movieDetailViewModel.notifier);

    useEffect(() {
      movieDetailsNotifier.getMovieDetail(movieId);
      movieDetailsNotifier.getMovieCredit(movieId);

      return null;
    }, [movieId]);
    return Scaffold(
        body: movieDetailsModelVm.movieDetail.when(
      data: (movieDetailsModel) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200.h,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Image.network(
                        "https://image.tmdb.org/t/p/w500${movieDetailsModel.backdropPath}",
                        height: 300.h,
                        width: 1.sw,
                        fit: BoxFit.cover),
                    Positioned(
                      top: 70.h,
                      left: 24.w,
                      right: 24.w,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SvgPicture.asset(
                                      "assets/icons/icon_back.svg")),
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
                            child:
                                SvgPicture.asset("assets/icons/icon_play.svg"),
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
                          movieDetailsModel.title ?? "_",
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
                        Text("${movieDetailsModel.voteAverage} IMDb",
                            style: AppTextstyle.size12W400(
                                color: AppColor.primaryText)),
                      ],
                    ),
                    YMargin(16),
                    Row(
                        children: movieDetailsModel.genres?.map((e) {
                              return Container(
                                margin: EdgeInsets.only(right: 8.w),
                                padding: EdgeInsets.symmetric(
                                    vertical: 4.h, horizontal: 12.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.r),
                                    color: AppColor.blue100),
                                child: Text(e.name ?? "_",
                                    style: AppTextstyle.size8W700()),
                              );
                            }).toList() ??
                            []),
                    YMargin(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Length",
                            style: AppTextstyle.size12W400(
                                color: AppColor.primaryText)),
                        YMargin(4),
                        Text("${movieDetailsModel.runtime}Hours",
                            style: AppTextstyle.size12W400(
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    YMargin(24),
                    Text("Description", style: AppTextstyle.size16W900()),
                    YMargin(8),
                    Text(
                      movieDetailsModel.overview ?? "_",
                      style:
                          AppTextstyle.size12W400(color: AppColor.primaryText),
                    ),
                    YMargin(24),
                    Text("Cast", style: AppTextstyle.size16W900()),
                    YMargin(19),
                    movieDetailsModelVm.movieCredit.when(
                      data: (data) {
                        if (data.cast == null || data.cast!.isEmpty) {
                          return Center(
                            child: Text(
                              "No cast information available",
                              style: AppTextstyle.size12W400(
                                  color: AppColor.mainColor),
                            ),
                          );
                        }

                        return CarouselSlider.builder(
                          itemCount:
                              data.cast!.length > 10 ? 10 : data.cast!.length,
                          options: CarouselOptions(
                            height: 140.h,
                            viewportFraction: 0.25,
                            enableInfiniteScroll: false,
                            padEnds: false,
                          ),
                          itemBuilder: (context, index, realIndex) {
                            final castMember = data.cast![index];
                            final imageUrl = castMember.profilePath != null
                                ? 'https://image.tmdb.org/t/p/w185${castMember.profilePath}'
                                : null;

                            return Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r),
                                    child: imageUrl != null
                                        ? Image.network(
                                            imageUrl,
                                            height: 76.h,
                                            width: 72.w,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                height: 76.h,
                                                width: 72.w,
                                                color: Colors.grey[800],
                                                child: Icon(Icons.person,
                                                    color: Colors.grey[600]),
                                              );
                                            },
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null)
                                                return child;
                                              return Container(
                                                height: 76.h,
                                                width: 72.w,
                                                color: Colors.grey[800],
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      AppColor.mainColor,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        : Container(
                                            height: 76.h,
                                            width: 72.w,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[800],
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: Icon(Icons.person,
                                                color: Colors.grey[600]),
                                          ),
                                  ),
                                  YMargin(4),
                                  SizedBox(
                                    width: 72.w,
                                    child: Text(
                                      castMember.name ?? "Unknown",
                                      style: AppTextstyle.size12W400(
                                          color: AppColor.mainColor),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  if (castMember.character != null)
                                    SizedBox(
                                      width: 72.w,
                                      child: Text(
                                        castMember.character!,
                                        style: AppTextstyle.size12W400(
                                          color: AppColor.mainColor
                                              .withOpacity(0.6),
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      error: (error, stack) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.error_outline,
                                  color: Colors.red, size: 32),
                              YMargin(8),
                              Text(
                                "Failed to load cast",
                                style: AppTextstyle.size12W400(
                                    color: AppColor.mainColor),
                              ),
                            ],
                          ),
                        );
                      },
                      loading: () {
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColor.mainColor),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
      error: (error, stack) => Text("data"),
      loading: () => MovieDetailShimmer(),
    ));
  }
}
