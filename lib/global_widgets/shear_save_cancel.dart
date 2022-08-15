// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:labib/global_widgets/shear_icon.dart';
//
//
// import '../uitls/app_colors.dart';
// import 'button_app.dart';
//
// class ShearSaveCancel extends StatelessWidget {
//  final Function()? shearTap;
//  final Function()? saveTap;
//  final Function()? cancelTap;
//
//  ShearSaveCancel({this.shearTap, this.saveTap, this.cancelTap});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         ShearIcon(
//           onTap: () {},
//           wSize: 40,
//           hSize: 40,
//           iconSize: 24,
//         ),
//         SizedBox(width: 16.w),
//         Expanded(
//             child: ButtonApp(
//               onPressed: () {},
//               text: 'حفظ ',
//               fontWeight: FontWeight.w500,
//               fontSize: 16,
//               bRadius: 24,
//               buttonBgColor: AppColors.mainYellow,
//               textColor: AppColors.darkBlack,
//             )),
//         SizedBox(width: 16.w),
//         Expanded(
//             child: ButtonApp(
//                 onPressed: () {},
//                 text: 'الغاء الحفظ ',
//                 fontWeight: FontWeight.w500,
//                 fontSize: 16,
//                 bRadius: 24,
//                 buttonBgColor: AppColors.mainYellow,
//                 textColor: AppColors.darkBlack)),
//       ],
//     );
//   }
// }
