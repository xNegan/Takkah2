import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../global_widgets/text_custom.dart';
import '../uitls/app_colors.dart';

class ButtonApp extends StatelessWidget {
  final String title;
  final Function() onTap;
  bool isblack;
  double width;
  double heigh;
  double fontSize;

  ButtonApp(
      {required this.title,
      required this.onTap,
      this.width = 330,
      this.fontSize = 24,
      this.isblack = false,
      this.heigh = 55});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigh.h,
      //margin: EdgeInsetsDirectional.only(start: 50.w, end: 50.w),

      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(width.w, heigh.h)),
            backgroundColor: MaterialStateProperty.all(
                isblack ? AppColors.blackColor : AppColors.maincolor),
          ),
          onPressed: onTap,
          child: TextCustom(
            text: title,
            color: Colors.white,
            fontSize: fontSize.sp,
          )),
    );
  }
}
