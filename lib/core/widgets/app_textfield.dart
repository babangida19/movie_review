import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_review/core/theme/app_color.dart';
import 'package:movie_review/core/theme/app_textstyle.dart';


enum TextFieldType { email, password }

class AppTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String fieldName;

  final TextEditingController controller;

  final String? hintText;
  final bool obscureText;

  final Widget? suffixIcon;

  final TextFieldType textFieldType;
  final Function(String)? onChanged;
  final AutovalidateMode autovalidateMode;

  const AppTextField({
    super.key,
    this.fieldName = "",
    this.obscureText = false,
    this.validator,
    required this.controller,
    this.hintText,
    this.suffixIcon,
    this.onChanged,
    this.textFieldType = TextFieldType.email,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> showPassword = ValueNotifier(true);

    return Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          fieldName.isEmpty
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    fieldName,
                    style: AppTextstyle.size14W400(color: AppColor.primaryText),
                  ),
                ),
          ValueListenableBuilder(
              valueListenable: showPassword,
              builder: (BuildContext context, bool show, Widget? child) {
                return TextFormField(
                  textCapitalization: textFieldType == TextFieldType.email ||
                          textFieldType == TextFieldType.password
                      ? TextCapitalization.none
                      : TextCapitalization.sentences,
                  onChanged: onChanged,
                  autovalidateMode: autovalidateMode,
                  controller: controller,
                  validator: validator,
                  obscureText: obscureText && showPassword.value,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    filled: true,
                    fillColor: AppColor.primaryText,
                    suffixIconConstraints: BoxConstraints(
                      maxHeight: 25.h,
                      minHeight: 25.h,
                      minWidth: 25.w,
                    ),
                    suffixIcon: suffixIcon,
                    hintText: hintText ?? fieldName,
                    hintStyle:
                        AppTextstyle.size16W400(color: AppColor.primaryText),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14.0, vertical: 13),
                    border: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                  ),
                  onEditingComplete: () {
                    if (textFieldType == TextFieldType.email) {
                      controller.text = controller.text.trim();
                    }
                  },
                );
              }),
        ]));
  }
}

final outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.circular(25.r),
);

bool getShowPrefixIconPadding(
  TextFieldType textInputType,
) {
  switch (textInputType) {
    case TextFieldType.password:
    case TextFieldType.email:
      return true;
    default:
      return false;
  }
}
