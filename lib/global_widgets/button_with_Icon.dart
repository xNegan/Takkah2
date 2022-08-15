// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:vision_law_skm/global_widgets/text_custom.dart';
// import 'package:vision_law_skm/uitls/app_colors.dart';
//
//
// class ButtonWithIcon extends StatelessWidget {
//   final String text;
//   final IconData iconButton;
//   final Color textIconColor;
//   final Color buttonBgColor;
//   final VoidCallback? onPressed;
//   final double? widthSize;
//   final double? heightSize;
//   final double spaceBtIcon;
//
//   ButtonWithIcon({
//     required this.text,
//     required this.iconButton,
//     required this.onPressed,
//     this.textIconColor = AppColors.whiteColor,
//     this.buttonBgColor = AppColors.radial,
//     this.widthSize = double.infinity,
//     this.heightSize = 60,
//     this.spaceBtIcon = 12,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           padding: EdgeInsets.zero,
//           minimumSize: Size(widthSize!, heightSize!),
//           elevation: 0,
//           primary: buttonBgColor,
//           // onPrimary: AppColors.whiteColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(24.r),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               iconButton,
//               color: textIconColor,
//               size: 16.sp,
//             ),
//             SizedBox(width: spaceBtIcon.w),
//             TextCustom(
//               text: text,
//               fontSize: 12.sp,
//               fontWeight: FontWeight.w500,
//               color: textIconColor,
//             ),
//           ],
//         ));
//   }
// }