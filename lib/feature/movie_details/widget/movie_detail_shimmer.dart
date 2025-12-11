import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_review/core/widgets/app_shimmer.dart';
import 'package:movie_review/core/widgets/spacing.dart';

class MovieDetailShimmer extends StatelessWidget {
  const MovieDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200.h,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
            background: AppShimmer.rectangular(height: 300.h, width: 1.sw),
          ),
          backgroundColor: Colors.transparent,
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppShimmer.rectangular(height: 20.h, width: 200.w),
                    AppShimmer.circular(height: 32.h, width: 32.w),
                  ],
                ),
                YMargin(12),
                AppShimmer.rectangular(height: 14.h, width: 80.w),
                YMargin(24),
                Row(
                  children: [
                    AppShimmer.rectangular(height: 24.h, width: 60.w),
                    XMargin(8),
                    AppShimmer.rectangular(height: 24.h, width: 60.w),
                    XMargin(8),
                    AppShimmer.rectangular(height: 24.h, width: 60.w),
                  ],
                ),
                YMargin(24),
                AppShimmer.rectangular(height: 14.h, width: 80.w),
                YMargin(8),
                AppShimmer.rectangular(height: 14.h, width: 100.w),
                YMargin(24),
                AppShimmer.rectangular(height: 20.h, width: 150.w),
                YMargin(12),
                AppShimmer.rectangular(height: 12.h, width: 1.sw),
                YMargin(6),
                AppShimmer.rectangular(height: 12.h, width: 1.sw),
                YMargin(6),
                AppShimmer.rectangular(height: 12.h, width: 200.w),
                YMargin(24),
                AppShimmer.rectangular(height: 20.h, width: 100.w),
                YMargin(16),
                SizedBox(
                  height: 140.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    separatorBuilder: (_, __) => XMargin(12),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          AppShimmer.rectangular(height: 76.h, width: 72.w),
                          YMargin(8),
                          AppShimmer.rectangular(height: 12.h, width: 72.w),
                          YMargin(4),
                          AppShimmer.rectangular(height: 12.h, width: 50.w),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
