import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takkah/global_widgets/text_custom.dart';

import '../uitls/app_colors.dart';

class passwordTextField extends StatelessWidget {

  final TextEditingController controller;
  final String Title;
  final bool isShow;
  final bool isread;
  final Function() onshow;
  final Icon icon;


  passwordTextField({required this.controller,required this.icon,required this.Title,required this.isShow,required this.isread,required this.onshow});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 16.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustom(text: Title,fontSize: 16,color:AppColors.fontColor,fontWeight: FontWeight.w400),


              ],
            ),
          ),
          Container(
              height: 40.h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: AppColors.noColor,
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: AppColors.fontColor.withOpacity(0.5))
            ),
            child:TextFormField(
              controller: controller,
              readOnly: isread,
              toolbarOptions: const ToolbarOptions(
                copy: true,
                cut: true,
                paste: true,
                selectAll: true,
              ),
              keyboardType:TextInputType.text,
              obscureText: isShow,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14.sp,
                color: AppColors.fontColor.withOpacity(0.5),
              ),
              decoration: InputDecoration(
                suffixIcon: InkWell(onTap: onshow, child: icon),
                fillColor: Colors.transparent,
                filled: false,
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13.sp,
                  color: AppColors.lGray,
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w, vertical: 12.h),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.r),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.r),
                  borderSide: BorderSide.none,
                ),
                errorBorder: InputBorder.none,
              ),
            ),

            // TextFormField(
            //   validator: validator,
            //   controller: controllerText,
            //   readOnly: isReadOnly,
            //   toolbarOptions: const ToolbarOptions(
            //     copy: true,
            //     cut: true,
            //     paste: true,
            //     selectAll: true,
            //   ),
            //   keyboardType:isNum?TextInputType.number:isPhone?TextInputType.phone:isEmail?TextInputType.emailAddress:isAddress?TextInputType.streetAddress: TextInputType.text,
            //   style: TextStyle(
            //     fontFamily: 'Poppins',
            //     fontSize: 14.sp,
            //      color: AppColors.fontColor.withOpacity(0.5),
            //   ),
            //   maxLines: lineMax,
            //   decoration: InputDecoration(
            //     fillColor: Colors.transparent,
            //     filled: true,
            //     hintText: textHint,
            //     hintStyle: TextStyle(
            //       fontFamily: 'Poppins',
            //       fontSize: 13.sp,
            //       color: AppColors.lGray,
            //     ),
            //     contentPadding: EdgeInsets.symmetric(
            //         horizontal: 16.w, vertical: 12.h),
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(24.r),
            //       borderSide: BorderSide.none,
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(24.r),
            //       borderSide: BorderSide.none,
            //     ),
            //     errorBorder: InputBorder.none,
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}