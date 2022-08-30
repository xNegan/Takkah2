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

  ButtonApp(
      {required this.title,
      required this.onTap,
      this.width = 330,
      this.heigh = 55});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigh.h,
      //margin: EdgeInsetsDirectional.only(start: 50.w, end: 50.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        color: AppColors.blackColor

      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(width.w, heigh.h)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
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
