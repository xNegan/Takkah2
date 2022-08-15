import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takkah/global_widgets/text_custom.dart';

import '../uitls/app_colors.dart';

class TitleBoxRow extends StatelessWidget {
  final TextEditingController? controllerText;
  final String title;
  final int lineMax;
  final bool showCounter;
  final String textHint;
  final  Function()? arabicTap;
  final Function()? englishTap;
  final bool arabicEnglish;
  final bool isReadOnly;
  final bool isNum;
  final bool isPhone;
  final bool isEmail;
  final bool isAddress;
  final bool isNote;
  FormFieldValidator<String>? validator;


  TitleBoxRow({this.isAddress=false,required this.isNote,this.controllerText,this.isReadOnly = true,required this.title, this.lineMax = 1, this.showCounter= true, this.textHint='', this.arabicTap, this.englishTap,this.arabicEnglish=false,this.validator,this.isNum=false,this.isPhone=false,this.isEmail=false});


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
                TextCustom(text: title,fontSize: 16,color:AppColors.fontColor,fontWeight: FontWeight.w400),
                Visibility(
                  visible: arabicEnglish,
                  child: Row(
                    children: [
                      InkWell(
                          onTap: arabicTap,
                          child: TextCustom(text: 'عربي',fontSize: 16,fontWeight: FontWeight.w500,)),
                      SizedBox(
                        width: 5.w,
                      ),
                      TextCustom(text: '|',fontSize: 16,fontWeight: FontWeight.w500,),
                      SizedBox(
                        width: 5.w,
                      ),
                      InkWell(
                          onTap: englishTap,
                          child: TextCustom(text: 'English',fontSize: 16,fontWeight: FontWeight.w500,)),
                    ],
                  ),
                ),

              ],
            ),
          ),
          isNote?
          Container(

            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: AppColors.noColor,
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: AppColors.fontColor.withOpacity(0.5))
            ),
            child:TextFormField(
              validator: validator,
              controller: controllerText,
              toolbarOptions: const ToolbarOptions(
                copy: true,
                cut: true,
                paste: true,
                selectAll: true,
              ),
              keyboardType: TextInputType.text,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14.sp,
                color: AppColors.fontColor.withOpacity(0.7),
              ),
              maxLines: lineMax,
              decoration: InputDecoration(
                fillColor: AppColors.noColor,
                filled: true,
                hintText: textHint,
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13.sp,
                  color:  AppColors.fontColor.withOpacity(0.7),
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
          ):
          Container(
              height: 40.h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.noColor,
              borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: AppColors.fontColor.withOpacity(0.5))
            ),
            child:
            TextFormField(
              validator: validator,
              controller: controllerText,
              readOnly: isReadOnly,
              toolbarOptions: const ToolbarOptions(
                copy: true,
                cut: true,
                paste: true,
                selectAll: true,
              ),
              keyboardType:isNum?TextInputType.number:isPhone?TextInputType.phone:isEmail?TextInputType.emailAddress:isAddress?TextInputType.streetAddress: TextInputType.text,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14.sp,
                 color: AppColors.fontColor.withOpacity(0.5),
              ),
              maxLines: lineMax,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                filled: true,
                hintText: textHint,
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
          ),
        ],
      ),
    );
  }
}