// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:vision_law_skm/global_widgets/text_custom.dart';
// import 'package:vision_law_skm/uitls/app_colors.dart';
//
//
// class ButtonApp extends StatelessWidget {
//   final String text;
//   final double fontSize;
//   final double? widthSize;
//   final double? heightSize;
//   final double? bRadius;
//   final double? hPadding;
//   final double? vPadding;
//   final FontWeight fontWeight;
//   final Function()? onPressed;
//   final bool ready;
//   final Color textColor;
//   final Color buttonBgColor;
//   Widget? child;
//
//   ButtonApp({
//      this.text = '',
//      this.fontSize = 12,
//     this.widthSize =90,
//     this.heightSize = 40,
//     this.fontWeight = FontWeight.w700,
//     required this.onPressed,
//     this.ready = true,
//     this.textColor = AppColors.mainYellow,
//     this.buttonBgColor = AppColors.darkBlack,
//     this.child,
//     this.bRadius = 8,
//     this.hPadding = 12,
//     this.vPadding =0,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           padding: EdgeInsets.symmetric(horizontal: hPadding!.w,vertical: vPadding!.h),
//           minimumSize: Size(widthSize!.w, heightSize!.h),
//           elevation: 0,
//           primary: buttonBgColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(bRadius!.r),
//           ),
//         ),
//         child: child ??
//             TextCustom(
//               text: text,
//               fontSize: fontSize.sp,
//               fontWeight: fontWeight,
//               color: textColor,
//             ));
//   }
// }
