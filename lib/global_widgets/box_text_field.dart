import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takkah/global_widgets/text_custom.dart';

import '../uitls/app_colors.dart';

class BoxTextField extends StatelessWidget {
  final TextEditingController controllerText;
  final String title;
  final int lineMax;
  final bool showCounter;
  final String textHint;
  final  Function()? arabicTap;
  final Function()? englishTap;
  final bool arabicEnglish;
  FormFieldValidator<String>? validator;



   BoxTextField({required this.title,this.validator,required this.controllerText, this.lineMax = 1, this.showCounter= true, this.textHint='', this.arabicTap, this.englishTap,this.arabicEnglish=false});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustom(text: title,fontSize: 16,fontWeight: FontWeight.w500,),
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
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.16),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],

            ),
            child: TextFormField(
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
                color: AppColors.mGray,
              ),
              maxLines: lineMax,
              decoration: InputDecoration(
                fillColor: AppColors.whiteColor,
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
