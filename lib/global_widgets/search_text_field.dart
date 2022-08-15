import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../uitls/app_colors.dart';

class SearchTextField extends StatelessWidget {
  final bool readOnly;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final int? maxLength;
  final int? maxLine;
  final Function()? onTap;
  final ValueChanged<String>? onSubmit;
  final ValueChanged? onChanged;
  final Widget? suffixWid;
  final Widget? prefixWid;
  final String hintText;

  SearchTextField({
    this.readOnly = false,
     this.controller,
    this.suffixIcon,
    this.maxLength,
    this.maxLine = 1,
    this.suffixWid,
    this.prefixWid,
    this.onTap,
    this.onChanged,
    this.onSubmit,
    this.hintText = '... بحث',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.16),
            offset: const Offset(0,2),
            blurRadius: 48,
          )
        ]
      ),
      child: TextFormField(
        toolbarOptions: const ToolbarOptions(
          copy: true,
          cut: true,
          paste: true,
          selectAll: true,
        ),
        onTap: onTap,
        cursorHeight: 16.h,
       // cursorColor: AppColors.mainYellow,
        readOnly: readOnly,
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        style: TextStyle(
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w500,
          color: AppColors.darkBlack,
          fontSize: 14.sp
        ),
        keyboardType: TextInputType.text,
        maxLines: maxLine,
        minLines: 1,
        // expands: true,
        maxLength: maxLength,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(

          filled: true,
          fillColor: AppColors.whiteColor,
          suffixIcon: suffixWid,
          prefixIcon: Icon(Icons.search),

          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 14.sp,
            color: AppColors.hintText,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          enabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(24.r),
            borderSide: const BorderSide(
              color: AppColors.noColor
            )
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.r),
              borderSide:const BorderSide(
                  color: AppColors.noColor
              )
          ),

        ),

      ),
    );
  }
}
