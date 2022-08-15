// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:vision_law_skm/global_widgets/text_custom.dart';
// import 'package:vision_law_skm/uitls/app_colors.dart';
//
// class ButtonWithCircle extends StatelessWidget {
//   final String text;
//   final GestureTapCallback? onTap;
//
//
//   ButtonWithCircle({required this.text, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 230.w,
//       height: 70.h,
//       padding: EdgeInsets.all(10.r),
//       decoration: BoxDecoration(
//           color: AppColors.radial,
//           borderRadius: BorderRadius.circular(50.r),
//           boxShadow: [
//             BoxShadow(
//               color: AppColors.blackColor.withOpacity(0.16),
//               offset: Offset(0,17),
//               blurRadius: 80,
//             ),
//           ]
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Spacer(),
//           TextCustom(text: text, color: AppColors.whiteColor,fontWeight: FontWeight.w600,),
//           Spacer(),
//           InkWell(
//             onTap: onTap,
//             child: Container(
//               width: 50.w,
//               height: 50.h,
//               alignment: AlignmentDirectional.center,
//               decoration: const BoxDecoration(
//                 color: AppColors.radialLight,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(Icons.arrow_forward, color: AppColors.whiteColor,),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }