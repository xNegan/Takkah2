import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../uitls/app_colors.dart';

class CircularTextField extends StatelessWidget {
  Widget? suffixIcon;
  Widget? prefixIcon;
  String? hintText;
  Color filledColor;
  bool obsecureText;
  TextEditingController? controller;
  Function(String)? onChanged;
  Function(String?)? onSaved;
  Function()? onTap;
  TextInputAction? textInputAction;
  TextInputType textInputType;
  double fontSize;
  int? maxLine;

  CircularTextField({
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.filledColor = Colors.white,
    this.controller,
    this.obsecureText = false,
    this.textInputAction,
    this.textInputType = TextInputType.text,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      width: Get.width,
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: TextField(
        keyboardType: textInputType,
        cursorWidth: 3.sp,
        cursorColor: AppColors.mainYellow,
        textInputAction: textInputAction,
        obscureText: obsecureText,
        onChanged: onChanged,
        onTap: onTap,
        controller: controller,
        style: TextStyle(
          fontSize: fontSize.sp,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
            isDense: true,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: fontSize.sp),
            filled: true,
            fillColor: filledColor,
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w)),
      ),
    );
  }
}
