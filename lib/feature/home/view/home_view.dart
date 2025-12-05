import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_review/core/model/popular_movie_model.dart';
import 'package:movie_review/core/theme/app_textstyle.dart';
import 'package:movie_review/core/util/providers.dart';
import 'package:movie_review/core/widgets/spacing.dart';
import 'package:movie_review/feature/home/widget/highest_rated_card.dart';
import 'package:movie_review/feature/home/widget/popular_movie_card.dart';
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
          YMargin(30),
          Text("Highest Rated", style: AppTextstyle.size16W900()),
          YMargin(15),
          viewModel.highestRatedMovies.when(
            data: (data) {
              return CarouselSlider.builder(
                itemCount: data.results?.length ?? 0,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  final movie = data.results?[index];
                  return HighestRatedCard(movie: movie);
                },
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  aspectRatio: 113 / 79,
                  autoPlay: false,
                  viewportFraction: 0.42,
                ),
              );
            },
            error: (error, stack) => Text("Error while loading movies"),
            loading: () => HighestRatedCardShimmer(),
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
                      child: PopularMovieCard(movie: movie),
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
                    child: PopularMovieCardShimmer(),
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
