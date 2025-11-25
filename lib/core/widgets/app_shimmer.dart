import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final double height;
  final double width;
  final double? radius;
  final BoxShape shapeBorder;
  const AppShimmer.rectangular({
    super.key,
    required this.height,
    this.radius,
    required this.width,
  }) : shapeBorder = BoxShape.rectangle;
  const AppShimmer.circular({
    super.key,
    required this.height,
    this.radius,
    required this.width,
  }) : shapeBorder = BoxShape.circle;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 2)),
          color: Colors.grey,
        ),
        height: height.h,
        width: width.w,
      ),
    );
  }
}