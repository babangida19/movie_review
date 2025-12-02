import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:movie_review/core/theme/app_color.dart';
import 'package:movie_review/core/theme/app_textstyle.dart';
import 'package:movie_review/core/widgets/spacing.dart';
import 'package:movie_review/feature/home/viewmodel/home_viewmodel.dart';
import 'package:movie_review/feature/movie_details/view/movie_detail_view.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends HookWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      // Future.microtask(
      //   () => serviceLocator<MovieViewmodel>().getPopularMovie(),
      // );
      context.read<MovieViewmodel>().getPopularMovie();
      context.read<MovieViewmodel>().getHighestRatedMovie(1);
      ;

      // return null;
    }, []);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        child: Consumer<MovieViewmodel>(builder: (ctx, viewModel, index) {
          return Column(
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
              Text("Highest Rated", style: AppTextstyle.size16W900()),
              YMargin(19),
              CarouselSlider.builder(
                itemCount:
                    viewModel.highestRatedMovieResponse.data?.results?.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  final movie =
                      viewModel.highestRatedMovieResponse.data?.results?[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500${movie?.posterPath}}",
                          fit: BoxFit.cover,
                          height: 128.h,
                          width: 100.w,
                        ),
                      ),
                      YMargin(12),
                      Text(
                        movie?.title ?? "_",
                        style: AppTextstyle.size14W700(),
                      ),
                      YMargin(8),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/icon_star.svg"),
                          XMargin(4),
                          Text("${movie?.voteAverage ?? 0} IMDb",
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
              ),
              YMargin(24),
              Text("Popular", style: AppTextstyle.size16W900()),
              YMargin(15),
              SizedBox(
                height: 200.h,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    final movie =
                        viewModel.popularMovieResponse.data!.results![index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Row(
                        children: [
                          ClipRRect(
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500${movie?.posterPath}}",
                              fit: BoxFit.cover,
                              height: 128.h,
                              width: 100.w,
                            ),
                          ),
                          XMargin(12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title ?? "_",
                                style: AppTextstyle.size14W700(
                                    color: AppColor.mainColor),
                              ),
                              YMargin(6),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/icons/icon_star.svg"),
                                  XMargin(4),
                                  Text("${movie.voteAverage} IMDb",
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
                                          builder: (context) => MovieDetailView(
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
                                  child: Text("HORROR",
                                      style: AppTextstyle.size8W700()),
                                ),
                              ),
                              YMargin(8),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/icons/icon_duration.svg"),
                                  XMargin(4),
                                  Text("1h 47m",
                                      style: AppTextstyle.size12W400(
                                          color: AppColor.black)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
