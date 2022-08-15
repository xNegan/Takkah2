// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:vision_law_skm/global_widgets/text_custom.dart';
//
// import '../screens/contracts_screen/Sandat_alqapad_screen.dart';
// import '../uitls/app_colors.dart';
//
// class columnMenu2 extends StatefulWidget {
//  late String labelName;
//  late String value;
//  final Function()? onPressed;
//  List<String>myList2;
//  columnMenu2({required this.labelName, required this.value, this.onPressed,required this.myList2});
//   @override
//   State<columnMenu2> createState() => _columnMenuState();
// }
//
// class _columnMenuState extends State<columnMenu2> {
//   List<String>myList= <String>['عميل 1', 'سند القبض', 'شيك', 'نقدا','Two','kkk'];
//   List<String>myList3= <String>[];
//   @override
//   Widget build(BuildContext context) {
//     myList3.add('عميل 1');
//     myList3.add('454');
//     myList3.add('454');
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextCustom(
//           text: widget.labelName,
//           fontSize: 16,fontWeight: FontWeight.w500,
//           //color: AppColors.lightBlack,
//         ),
//         SizedBox(height: 11.h,),
//         Container(
//           width: ScreenUtil().screenWidth,
//           height: 40.h,
//           padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
//           decoration: BoxDecoration(
//             color: AppColors.mainYellow,
//             boxShadow: [
//               BoxShadow(
//                 color: AppColors.blackColor.withOpacity(0.16),
//                 offset: Offset(0,5),
//                 blurRadius: 5,
//               ),
//             ],
//             borderRadius: BorderRadius.circular(24.r),
//           ),
//           child: DropdownButton<String>(
//             value: widget.value,
//             icon: const Icon(Icons.arrow_drop_down_sharp,color: AppColors.darkBlack,size: 25,),
//             underline: Container(),
//             isExpanded: true,
//             elevation: 16,
//             style:  TextStyle(color: AppColors.darkBlack,fontFamily: 'Tajawal',fontSize: 14.sp),
//              onChanged: (String? newValue){
//               widget.onPressed;
//               setState(() {
//                 SandatAlqapadScreen.newValue=newValue!;
//                 widget.value = newValue;
//                 print('*******************************');
//                 print(widget.value);
//                 print('*******************************');
//               });
//     },
//             // (String? newValue) {
//             //
//             //   setState(() {
//             //     widget.value = newValue!;
//             //     print('*******************************');
//             //     print(widget.value);
//             //     print('*******************************');
//             //   });
//             // },
//             items: widget.myList2
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//           ),
//         ),
//         SizedBox(height: 20.h,)
//       ],
//     );
//   }
// }
