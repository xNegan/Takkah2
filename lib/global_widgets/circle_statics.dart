// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'package:vision_law_skm/global_widgets/text_custom.dart';
// import 'package:vision_law_skm/uitls/app_colors.dart';
//
// class CircleStatics extends StatelessWidget {
//   // final bool isSelected;
//   // final bool isHeader;
//   // final String titleHeader;
//   // final String centerTextOne;
//   // final String centerTextTwo;
//   // final String centerTextThree;
//   // final double percentOne;
//   // final double percentTwo;
//   // final double percentThree;
//   //
//   // CircleStatics({
//   //   required this.isSelected,
//   //   this.isHeader = true,
//   //   required this.titleHeader,
//   //   required this.centerTextOne,
//   //   required this.centerTextTwo,
//   //   required this.centerTextThree,
//   //   required this.percentOne,
//   //   required this.percentTwo,
//   //   required this.percentThree,
//   // });
//
//   @override
//   Widget build(BuildContext context) {
//     return ExpansionPanelList.radio(
//       initialOpenPanelValue: 0,
//       expandedHeaderPadding:
//           EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
//       children: [
//         // ExpansionPanelRadio(
//         //   value: 0,
//         //   canTapOnHeader: true,
//         //   // isExpanded: isSelected,
//         //   headerBuilder: (_, bool isExpanded) {
//         //     // return buildHeader();
//         //   },
//         //   // body: buildBody(),
//         // )
//       ],
//     );
//   }
//
//
// }
//
//
// class HeaderExpansion extends StatelessWidget {
//   final bool isShow;
//   final String titleHeader;
//   final double percentOne;
//   final double percentTwo;
//   final double percentThree;
//   final String centerTextOne;
//   final String centerTextTwo;
//   final String centerTextThree;
//
//   HeaderExpansion({
//     required this.isShow,
//     required this.titleHeader,
//     required this.percentOne,
//     required this.percentTwo,
//     required this.percentThree,
//     required this.centerTextOne,
//     required this.centerTextTwo,
//     required this.centerTextThree,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 24.h),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextCustom(
//                 text: titleHeader, fontSize: 16, fontWeight: FontWeight.w500),
//           ),
//         Expanded(
//           flex: 2,
//           child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: [
//            if (!isShow)
//            CircularPercentIndicator(
//              startAngle: 90,
//              radius: 24.r,
//              lineWidth: 8.sp,
//              animation: true,
//              percent: percentOne,
//              center: TextCustom(
//                text: centerTextOne,
//                fontSize: 16,
//                textHeight: 2,
//                fontWeight: FontWeight.w600,
//              ),
//              circularStrokeCap: CircularStrokeCap.round,
//              progressColor: AppColors.mainYellow,
//            ),
//            if (!isShow)
//            CircularPercentIndicator(
//              startAngle: 90,
//              radius: 24.r,
//              lineWidth: 8.sp,
//              animation: true,
//              percent: percentTwo,
//              center: TextCustom(
//                text: centerTextTwo,
//                fontSize: 16,
//                textHeight: 2,
//                fontWeight: FontWeight.w600,
//              ),
//              circularStrokeCap: CircularStrokeCap.round,
//              progressColor: AppColors.lRed,
//            ),
//            if (!isShow)
//            CircularPercentIndicator(
//              startAngle: 90,
//              radius: 24.r,
//              lineWidth: 8.sp,
//              animation: true,
//              percent: percentThree,
//              center: TextCustom(
//                text: centerTextThree,
//                fontSize: 16,
//                textHeight: 2,
//                fontWeight: FontWeight.w600,
//              ),
//              circularStrokeCap: CircularStrokeCap.round,
//              progressColor: AppColors.dPink,
//            ),
//        ],
//    ),
//         ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
// class BodyExpansion extends StatelessWidget {
//   final String titleHeader;
//   final double percentOne;
//   final double percentTwo;
//   final double percentThree;
//   final String centerTextOne;
//   final String centerTextTwo;
//   final String centerTextThree;
//
//   BodyExpansion({
//     required this.titleHeader,
//     required this.percentOne,
//     required this.percentTwo,
//     required this.percentThree,
//     required this.centerTextOne,
//     required this.centerTextTwo,
//     required this.centerTextThree,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 24.h),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           CircularPercentIndicator(
//             startAngle: 90,
//             radius: 50.r,
//             lineWidth: 13.0,
//             animation: true,
//             percent: percentOne,
//             center: TextCustom(
//               text: centerTextOne,
//               fontSize: 24,
//               textHeight: 2,
//               fontWeight: FontWeight.w600,
//             ),
//             footer: Padding(
//               padding: EdgeInsets.symmetric(vertical: 16.h),
//               child: TextCustom(
//                 text: 'مكتملة',
//                 color: AppColors.midGray,
//               ),
//             ),
//             circularStrokeCap: CircularStrokeCap.round,
//             progressColor: AppColors.mainYellow,
//           ),
//           CircularPercentIndicator(
//             startAngle: 90,
//             radius: 50.r,
//             lineWidth: 13.0,
//             animation: true,
//             percent: percentTwo,
//             center: TextCustom(
//               text: centerTextTwo,
//               fontSize: 24,
//               textHeight: 2,
//               fontWeight: FontWeight.w600,
//             ),
//             footer: Padding(
//               padding: EdgeInsets.symmetric(vertical: 16.h),
//               child: TextCustom(
//                 text: 'قيد التنفيذ',
//                 color: AppColors.midGray,
//               ),
//             ),
//             circularStrokeCap: CircularStrokeCap.round,
//             progressColor: AppColors.lRed,
//           ),
//           CircularPercentIndicator(
//             startAngle: 90,
//             radius: 50.r,
//             lineWidth: 13.0,
//             animation: true,
//             percent: percentThree,
//             center: TextCustom(
//               text: centerTextThree,
//               fontSize: 24,
//               textHeight: 2,
//               fontWeight: FontWeight.w600,
//             ),
//             footer: Padding(
//               padding: EdgeInsets.symmetric(vertical: 16.h),
//               child: TextCustom(
//                 text: 'متوقفة',
//                 color: AppColors.midGray,
//               ),
//             ),
//             circularStrokeCap: CircularStrokeCap.round,
//             progressColor: AppColors.dPink,
//           ),
//         ],
//       ),
//     );
//   }
// }
