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
  Color colorButton;

  ButtonApp(
      {required this.title,
      required this.onTap,
      this.fontSize = 14,
      this.width = 330,
        this.colorButton = AppColors.maincolor,
      this.isblack = false,
      this.heigh = 55});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: heigh.h,
        width: width,
        //margin: EdgeInsetsDirectional.only(start: 50.w, end: 50.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: colorButton),

        alignment: Alignment.center,
        child:  TextCustom(
              text: title,
              color: Colors.white,
              fontSize: fontSize,
            )
      ),
    );
  }
}
