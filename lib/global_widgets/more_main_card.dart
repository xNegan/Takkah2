import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:takkah/global_widgets/text_custom.dart';

import '../uitls/app_colors.dart';


class MainMoreCard extends StatelessWidget {
  final String title1, title2, text1, text2, title3, text3;
  final String? lastDate, textLastDate,NumAtt;
  Function()? Funremovejalsa;
  Function()? FunEdit;
  Function()? goAtt;
  MainMoreCard({
    required this.title1,
    required this.title2,
    required this.text1,
    required this.text2,
    required this.title3,
    required this.text3,
    this.Funremovejalsa,
   required this.goAtt,
    this.FunEdit,
    this.lastDate,
    this.NumAtt,
    this.textLastDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      margin: EdgeInsetsDirectional.only(bottom: 16.h),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withOpacity(0.16),
              offset: Offset(0, 2),
              blurRadius: 12,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Row(
          //       children: [
          //         Container(
          //           padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
          //           decoration: BoxDecoration(
          //             color: AppColors.darkBlack,
          //             borderRadius: BorderRadius.circular(8.r),
          //           ),
          //           child: Image.asset('images/jalsat.png')
          //           ),
          //
          //         SizedBox(width: 13.w),
          //         Container(
          //           width: 350.w,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Row(
          //                 children: [
          //                   TextCustom(text: '$title1 : ', fontWeight: FontWeight.w500),
          //                   TextCustom(text: text1, fontWeight: FontWeight.w500,),
          //                 ],
          //               ),
          //               SizedBox(height: 16.h),
          //               Row(
          //                 children: [
          //                   TextCustom(text: '$title2 : ', fontWeight: FontWeight.w500,),
          //                   TextCustom(text: text2, fontWeight: FontWeight.w500,),
          //
          //                 ],
          //               ),
          //               SizedBox(height: 16.h),
          //               Row(
          //                 children: [
          //                   TextCustom(text: '$title3 : ', fontWeight: FontWeight.w500,),
          //                   TextCustom(text: text3, fontWeight: FontWeight.w500,),
          //
          //                 ],
          //               ),
          //
          //             ],
          //           ),
          //         ),
          //
          //
          //       ],
          //     ),
          //
          //   ],
          // ),
          Row(
            children: [
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: AppColors.darkBlack,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Image.asset('images/jalsat.png')),
              SizedBox(width: 13.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(
                          text: '$title1 : ', fontWeight: FontWeight.w500),
                      SizedBox(
                        width: 30.w,
                      ),
                      Container(
                          width: 150.w,
                          child: TextCustom(
                            text: text1,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(
                        text: '$title2 : ',
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        width: 45.w,
                      ),
                      Container(
                          width: 135.w,
                          child: TextCustom(
                            text: text2,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(
                        text: '$title3 : ',
                        fontWeight: FontWeight.w500,
                      ),
                      Container(
                          width: 150.w,
                          child: TextCustom(
                            text: text3,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),

          Row(
            children: [
              Spacer(),
              Visibility(
                visible: NumAtt!='0',
                child: InkWell(
                    onTap:goAtt ,
                    child: Icon(Icons.attach_file)),
              ),
              SizedBox(
                width: 30.w,
              ),
              InkWell(
                  onTap: FunEdit,
                  child: Icon(
                    Icons.edit_outlined,
                    color: Colors.green,
                  )),
              SizedBox(
                width: 30.w,
              ),
              InkWell(
                  onTap: Funremovejalsa,
                  child: Icon(
                    Icons.delete_outlined,
                    color: Colors.red.shade900,
                  )),
            ],
          )
        ],
      ),
    );
  }
}

class MainMoreCardmoaeed extends StatelessWidget {
  final String title1, title2, text1, text2, title3, text3;
  final String? lastDate, textLastDate;
  Function()? Funremovejalsa;
  Function()? FunEdit;
  Function() attachmentOnPressed;
  MainMoreCardmoaeed({
    required this.title1,
    required this.title2,
    required this.text1,
    required this.text2,
    required this.title3,
    required this.text3,
    this.Funremovejalsa,
    this.FunEdit,
    required this.attachmentOnPressed,
    this.lastDate,
    this.textLastDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      margin: EdgeInsetsDirectional.only(bottom: 16.h),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withOpacity(0.16),
              offset: Offset(0, 2),
              blurRadius: 12,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: AppColors.darkBlack,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Image.asset('images/moaeed.png')),
              SizedBox(width: 13.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(text: '$title1 : ', fontWeight: FontWeight.w500),
                      Container(
                          width: 115.w,
                          child: TextCustom(text: text1, fontWeight: FontWeight.w500,)),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(text: '$title2 : ', fontWeight: FontWeight.w500),
                      Container(
                          width: 115.w,
                          child: TextCustom(text: text2, fontWeight: FontWeight.w500,)),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(text: '$title3 : ', fontWeight: FontWeight.w500),
                      Container(
                          width: 115.w,
                          child: TextCustom(text: text3, fontWeight: FontWeight.w500,)),
                    ],
                  ),
                ],
              ),
            //  SizedBox(width: 24.w),
            //   Container(
            //     width: 130.w,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         TextCustom(text: text1, fontWeight: FontWeight.w500,),
            //         SizedBox(height: 16.h),
            //         TextCustom(text: text2, fontWeight: FontWeight.w500,),
            //         SizedBox(height: 16.h),
            //         TextCustom(text: text3, fontWeight: FontWeight.w500,),
            //       ],
            //     ),
            //   ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Row(
          //       children: [
          //         TextCustom(text: title3,),
          //         TextCustom(text: text3,),
          //
          //       ],
          //     ),
          //     ButtonApp(
          //       onPressed: () {Get.to(()=>JalssatFileNumber());},
          //       text: 'المزيد',
          //       fontSize: 14,
          //     ),
          //   ],
          //
          // ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [

              // ButtonApp(
              //     text: 'attachments'.tr,
              //     fontWeight: FontWeight.w500,
              //     widthSize: 50.w,
              //     heightSize: 30.h,
              //     buttonBgColor: Colors.amber.shade200,
              //     textColor: AppColors.darkBlack,
              //     fontSize: 16,
              //     bRadius: 10.r,
              //     onPressed: (){}),
              Spacer(),
              InkWell(
                  onTap:attachmentOnPressed ,
                  child: Icon(Icons.attach_file)),
              SizedBox(
                width: 30.w,
              ),
              InkWell(
                  onTap: FunEdit,
                  child: Icon(
                    Icons.edit_outlined,
                    color: Colors.green,
                  )),
              SizedBox(
                width: 30.w,
              ),
              InkWell(
                  onTap: Funremovejalsa,
                  child: Icon(
                    Icons.delete_outlined,
                    color: Colors.red.shade900,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
