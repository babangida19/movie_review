import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_review/core/model/popular_movie_model.dart';
import 'package:movie_review/core/theme/app_color.dart';
import 'package:movie_review/core/theme/app_textstyle.dart';
import 'package:movie_review/core/util/providers.dart';
import 'package:movie_review/core/widgets/spacing.dart';
import 'package:movie_review/feature/movie_details/view/movie_detail_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(homeViewModel);

    final viewModelNotifier = ref.read(homeViewModel.notifier);
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
          viewModel.highestRatedMovies.when(
            data: (data) {
              return CarouselSlider.builder(
                itemCount: data.results?.length ?? 0,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  final movie = data.results?[index];
                  return Column(
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
                          Text(
                              "${movie?.voteAverage?.toStringAsFixed(1) ?? '0.0'}/10",
                              style: AppTextstyle.size12W400(
                                  color: AppColor.primaryText)),
                        ],
                      )
                    ],
                  );
                },
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  aspectRatio: 113 / 79,
                  autoPlay: true,
                  viewportFraction: 0.42,
                ),
              );
            },
            error: (error, stack) => Text("data"),
            loading: () => CircularProgressIndicator(),
          ),
          YMargin(15),
          Text("Popular", style: AppTextstyle.size16W900()),
          YMargin(15),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                viewModelNotifier.popularPagingController.refresh();
              },
              child: PagedListView<int, Result>(
                state: viewModelNotifier.popularPagingController.value,
                fetchNextPage:
                    viewModelNotifier.popularPagingController.fetchNextPage,
                builderDelegate: PagedChildBuilderDelegate<Result>(
                  itemBuilder: (context, movie, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
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
                                  style: AppTextstyle.size14W700(
                                      color: AppColor.mainColor),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                YMargin(6),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/icons/icon_star.svg"),
                                    XMargin(4),
                                    Text(
                                        "${movie.voteAverage?.toStringAsFixed(1) ?? '0.0'}/10 IMDb",
                                        style: AppTextstyle.size12W400(
                                            color: AppColor.primaryText)),
                                  ],
                                ),
                                YMargin(8),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MovieDetailView(
                                                  movieId: movie.id ?? 0,
                                                )));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4.h, horizontal: 12.w),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        color: AppColor.blue100),
                                    child: Text("VIEW DETAILS",
                                        style: AppTextstyle.size8W700()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  firstPageErrorIndicatorBuilder: (context) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline, size: 48, color: Colors.red),
                        YMargin(16),
                        Text('Failed to load movies',
                            style: AppTextstyle.size14W700()),
                        YMargin(8),
                        ElevatedButton(
                          onPressed: () => viewModelNotifier
                              .popularPagingController
                              .refresh(),
                          child: Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                  newPageErrorIndicatorBuilder: (context) => Padding(
                    padding: EdgeInsets.all(16.h),
                    child: Center(
                      child: Column(
                        children: [
                          Text('Failed to load more'),
                          YMargin(8),
                          TextButton(
                            onPressed: () => viewModelNotifier
                                .popularPagingController
                                .refresh(),
                            child: Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  firstPageProgressIndicatorBuilder: (context) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  newPageProgressIndicatorBuilder: (context) => Padding(
                    padding: EdgeInsets.all(16.h),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  noItemsFoundIndicatorBuilder: (context) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.movie_outlined,
                            size: 48, color: Colors.grey),
                        YMargin(16),
                        Text('No movies found',
                            style: AppTextstyle.size14W700()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
