// // Padding buildAddBox({
// //   required String title,
// //   required TextEditingController controller,
// //   Function()? onTapBox,
// //   required FormFieldValidator<String>? validator,
// // }) {
// //   return Padding(
// //     padding: EdgeInsetsDirectional.only(bottom: 16.h),
// //     child: Column(
// //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         TextCustom(
// //           text: title,fontSize: 16,fontWeight: FontWeight.w500,
// //         ),
// //         SizedBox(height: 12.h),
// //         Container(
// //           // alignment: AlignmentDirectional.center,
// //           // color: AppColors.mainYellow,
// //           width: ScreenUtil().screenWidth,
// //           height: 40.h,
// //           //  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 0.w),
// //           padding: EdgeInsetsDirectional.only(top: 10.h,bottom: 10.h,end: 15.w),
// //           decoration: BoxDecoration(
// //             color: AppColors.mainYellow,
// //             boxShadow: [
// //               BoxShadow(
// //                 color: AppColors.blackColor.withOpacity(0.16),
// //                 offset: Offset(0,5),
// //                 blurRadius: 5,
// //               ),
// //             ],
// //             borderRadius: BorderRadius.circular(24.r),
// //           ),
// //           child: Row(children: [
// //             // TextCustom(text: controller.text,color: AppColors.darkBlack,fontSize: 14.sp),
// //             Container(
// //               width:ScreenUtil().screenWidth*0.75,
// //               height: 40.h,
// //               child: TextFormField(
// //                 readOnly: true,
// //                 cursorColor: Colors.black,
// //                 controller: controller,
// //                 //keyboardType: inputType,
// //                 decoration: new InputDecoration(
// //                   border: InputBorder.none,
// //                   focusedBorder: InputBorder.none,
// //                   enabledBorder: InputBorder.none,
// //                   errorBorder: InputBorder.none,
// //                   disabledBorder: InputBorder.none,
// //                   contentPadding:
// //                   EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
// //                 ),
// //                 validator: validator,
// //               ),
// //             ),
// //             Spacer(),
// //             InkWell(
// //                 onTap:onTapBox ,
// //                 child: Icon(Icons.arrow_drop_down_rounded))
// //           ],),
// //         ),
// //         // Container(
// //         //   // alignment: AlignmentDirectional.center,
// //         //   // color: AppColors.mainYellow,
// //         //   width: ScreenUtil().screenWidth,
// //         //   //height: 40.h,
// //         //  // padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
// //         //   decoration: BoxDecoration(
// //         //     color: AppColors.mainYellow,
// //         //     boxShadow: [
// //         //       BoxShadow(
// //         //         color: AppColors.blackColor.withOpacity(0.16),
// //         //         offset: Offset(0,5),
// //         //         blurRadius: 5,
// //         //       ),
// //         //     ],
// //         //     borderRadius: BorderRadius.circular(24.r),
// //         //   ),
// //         //   child: TextFieldCustom(
// //         //     onTap: onTapBox,
// //         //     readOnly: read,
// //         //     textInputType: textType,
// //         //     controller: controller,
// //         //     textHint: hintText,
// //         //    // hPadding: 27,
// //         //     suffixWid: showEndIcon
// //         //         ? Icon(
// //         //       iconData,
// //         //       size: iconSize.sp,
// //         //     )
// //         //         : null,
// //         //     validate: validator,
// //         //   ),
// //         // ),
// //       ],
// //     ),
// //   );
// // }
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:vision_law_skm/global_widgets/text_custom.dart';
//
// import '../uitls/app_colors.dart';
//
// class buildAddBox extends StatelessWidget {
//     String title;
//     TextEditingController controller;
//     Function()? onTapBox;
//     Function()? clickAdd;
//     bool showAdd;
//     FormFieldValidator<String>? validator;
//
//
//     buildAddBox({required this.title,required this.controller,required this.onTapBox,this.validator,this.clickAdd, this.showAdd=false});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsetsDirectional.only(bottom: 16.h),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextCustom(
//                 text: title,fontSize: 16,fontWeight: FontWeight.w500,
//               ),
//               Visibility(
//                 visible: showAdd,
//                 child: InkWell(
//                   onTap:clickAdd ,
//                   child: Padding(
//                     padding:  EdgeInsetsDirectional.only(start: 10.sp),
//                     child: Icon(Icons.add_box_outlined,size:20.sp,color: AppColors.grayColor,),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           SizedBox(height: 12.h),
//           Container(
//             // alignment: AlignmentDirectional.center,
//             // color: AppColors.mainYellow,
//             width: ScreenUtil().screenWidth,
//             height: 40.h,
//             //  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 0.w),
//             padding: EdgeInsetsDirectional.only(top: 10.h,bottom: 10.h,end: 15.w),
//             decoration: BoxDecoration(
//               color: AppColors.mainYellow,
//               boxShadow: [
//                 BoxShadow(
//                   color: AppColors.blackColor.withOpacity(0.16),
//                   offset: Offset(0,5),
//                   blurRadius: 5,
//                 ),
//               ],
//               borderRadius: BorderRadius.circular(24.r),
//             ),
//             child: Row(children: [
//               // TextCustom(text: controller.text,color: AppColors.darkBlack,fontSize: 14.sp),
//               SizedBox(width: 10.w,),
//               Container(
//                 width:ScreenUtil().screenWidth*0.74,
//                //  height: 40.h,
//                 child: TextFormField(
//                   readOnly: true,
//                   cursorColor: Colors.black,
//                   controller: controller,
//                   //keyboardType: inputType,
//                   decoration: new InputDecoration(
//                     border: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     enabledBorder: InputBorder.none,
//                     errorBorder: InputBorder.none,
//                     disabledBorder: InputBorder.none,
//                   //  contentPadding: EdgeInsets.only(left: 15.w, bottom: 11.h, top: 11.h, right: 15.w),
//                   ),
//                   validator: validator,
//                 ),
//               ),
//               Spacer(),
//               InkWell(
//                   onTap:onTapBox ,
//                   child: Icon(Icons.arrow_drop_down_rounded))
//             ],),
//           ),
//           // Container(
//           //   // alignment: AlignmentDirectional.center,
//           //   // color: AppColors.mainYellow,
//           //   width: ScreenUtil().screenWidth,
//           //   //height: 40.h,
//           //  // padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
//           //   decoration: BoxDecoration(
//           //     color: AppColors.mainYellow,
//           //     boxShadow: [
//           //       BoxShadow(
//           //         color: AppColors.blackColor.withOpacity(0.16),
//           //         offset: Offset(0,5),
//           //         blurRadius: 5,
//           //       ),
//           //     ],
//           //     borderRadius: BorderRadius.circular(24.r),
//           //   ),
//           //   child: TextFieldCustom(
//           //     onTap: onTapBox,
//           //     readOnly: read,
//           //     textInputType: textType,
//           //     controller: controller,
//           //     textHint: hintText,
//           //    // hPadding: 27,
//           //     suffixWid: showEndIcon
//           //         ? Icon(
//           //       iconData,
//           //       size: iconSize.sp,
//           //     )
//           //         : null,
//           //     validate: validator,
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
//
// InkWell buildSelectTitle({
//   required GestureTapCallback? onTap,
//   required String title,
//   required bool isSelected,
// }) {
//   return InkWell(
//     onTap: onTap,
//     child: Padding(
//       padding: EdgeInsets.symmetric(vertical: 8.h),
//       child: Row(
//         children: [
//           Container(
//             width: 22.sp,
//             height: 22.sp,
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: AppColors.whiteColor,
//                 border: Border.all(
//                   color: isSelected ? AppColors.mainYellow : AppColors.lGray,
//                   width: 2,
//                 )),
//             child: Container(
//               margin: EdgeInsets.all(2.sp),
//               decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: isSelected ? AppColors.mainYellow : AppColors.whiteColor),
//             ),
//           ),
//           SizedBox(width: 10.w),
//           Container(
//             width: 235.w,
//             child: TextCustom(
//               text: title,
//               color: AppColors.lGray,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
