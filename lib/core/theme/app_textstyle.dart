import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_review/core/theme/app_color.dart';

class AppTextstyle {
  static TextStyle size22W700(
      {double fontSize = 22,
      FontWeight fontWeight = FontWeight.w700,
      Color color = AppColor.primaryText}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }

  static TextStyle size16W900(
      {double fontSize = 16,
      FontWeight fontWeight = FontWeight.w900,
      Color color = AppColor.mainColor}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }
  static TextStyle size16W500(
      {double fontSize = 16,
      FontWeight fontWeight = FontWeight.w500,
      Color color = AppColor.mainColor}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }

  static TextStyle size16W400(
      {double fontSize = 16,
      FontWeight fontWeight = FontWeight.w400,
      Color color = AppColor.primaryText}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }

  static TextStyle size14W700(
      {double fontSize = 14,
      FontWeight fontWeight = FontWeight.w700,
      Color color = AppColor.black}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }

  static TextStyle size14W400(
      {double fontSize = 14,
      FontWeight fontWeight = FontWeight.w400,
      Color color = AppColor.primaryText}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }

  static TextStyle size12W400(
      {double fontSize = 12,
      FontWeight fontWeight = FontWeight.w400,
      Color color = AppColor.black}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }
}
