import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../uitls/app_colors.dart';

class TextFieldCustom extends StatelessWidget {
  final String? textHint;
  final TextInputType textInputType;
  final bool obscureText;
  final bool readOnly;
  final TextEditingController? controller;
  final String? errorEmail;
  final String? errorPassword;
  final IconData? suffixIcon;
  final int? maxLength;
  final int? maxLine;
  final Function()? onTap;
  final FocusNode? textFocusNode;
  final ValueChanged<String>? onSubmit;
  final   FormFieldValidator<String>? validate;
  final ValueChanged? onChanged;
  final GestureTapCallback? lockOnTap;
  final double endPad;
  final double topPad;
  final double bottomPad;
  final Widget? suffixWid;
  final Widget? prefixWid;
  final Color textColor;
  final Color hintColor;

  TextFieldCustom({
     this.textHint,
    required this.textInputType,
    this.obscureText = false,
    this.readOnly = false,
     this.controller,
    this.errorEmail,
    this.errorPassword,
    this.suffixIcon,
    this.maxLength,
    this.maxLine = 1,
    this.endPad = 16,
    this.topPad = 16,
    this.bottomPad = 16,
    this.suffixWid,
    this.prefixWid,
    this.onTap,
    this.onChanged,
    this.textFocusNode,
    this.onSubmit,
    this.validate,
    this.lockOnTap,
    this.textColor = AppColors.whiteColor,
    this.hintColor = AppColors.veryLightGray,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color:AppColors.grayColor),),
      child: TextFormField(
        toolbarOptions: const ToolbarOptions(
          copy: true,
          cut: true,
          paste: true,
          selectAll: true,
        ),
        onTap: onTap,
        cursorHeight: 16.h,
        cursorColor: textColor,
        readOnly: readOnly,
        onChanged: onChanged,
        focusNode: textFocusNode,
        onFieldSubmitted: onSubmit,
        validator: validate,
        style: TextStyle(
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w500,
          color: textColor,
          fontSize: 14.sp
        ),
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscureText,
        maxLines: maxLine,
        minLines: 1,
        // expands: true,
        maxLength: maxLength,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          counter: Text(''),
          // suffix: suffixWid,
           suffixIcon: InkWell(onTap: lockOnTap, child: suffixWid),
          prefixIcon: prefixWid,
          hintText: textHint,
          hintStyle: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 14.sp,
            color: hintColor,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 24.h),
          errorStyle: TextStyle(
            color: AppColors.whiteColor,
            fontFamily: 'Tajawal',
          ),
          // errorBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(
          //     color: AppColors.whiteColor
          //   )
          // ),
          enabledBorder:const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.whiteColor
            )
          ),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.whiteColor
              )
          ),
        ),
      ),
    );
  }
}
