import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../uitls/app_colors.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final double fontSize;
  final double? textHeight;
  final FontWeight fontWeight;
  final Color color;
  final Color? bgColor;
  final TextAlign textAlign;
  final TextOverflow? overFlow;
  final int? maxLine;
  final TextDecoration? textDecoration;

  TextCustom({
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.color = AppColors.darkBlack,
    this.bgColor,
    this.textAlign = TextAlign.start,
    this.textHeight,
    this.overFlow,
    this.maxLine,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize.sp,
        color: color,
        height: textHeight,
        backgroundColor: bgColor,
        decoration: textDecoration,
      ),
      textAlign: textAlign,
      overflow: overFlow,
      maxLines: maxLine,
    );
  }
}
