import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';

class OrdersLogScreenDl extends StatefulWidget {
  const OrdersLogScreenDl({Key? key}) : super(key: key);

  @override
  State<OrdersLogScreenDl> createState() => _OrdersLogScreenDlState();
}

class _OrdersLogScreenDlState extends State<OrdersLogScreenDl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextCustom(
          text: "سجل الطلبات",
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColors.tkTextPro,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.tkTextPro,
            size: 12.w,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              color: Color(0xFFF6F6F6),
              padding: EdgeInsetsDirectional.only(
                  start: 17.w, end: 13.w, bottom: 17.h),
              margin: EdgeInsetsDirectional.only(bottom: 9.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(top: 12.h),
                    child: Container(
                      width: 51.w,
                      height: 51.h,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset("images/person1.png"),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 28.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustom(
                          text: "أحمد السيد",
                          color: Color(0xFF707070),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        TextCustom(
                          text: " #74380",
                          color: AppColors.tkTextPro,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        TextCustom(
                          text: "5.6 كم",
                          color: Color(0xFFBDBDBD),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        TextCustom(
                          text: "تم التوصيل",
                          color: Color(0xFF00BA00),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(width: 20.w,),
                  Padding(
                    padding: EdgeInsetsDirectional.only(top: 28.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextCustom(
                              text: "من",
                              color: Color(0xFFBDBDBD),
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextCustom(
                                  text: "مطعم كنتاكي",
                                  color: Color(0xFF7C7C7C),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                                TextCustom(
                                  text: "شارع الملك عبدالله - المدينه المنوره",
                                  color: AppColors.tkTextPro,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            )

                            // SizedBox(width: 26.w,),
                          ],
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextCustom(
                              text: "الي",
                              color: Color(0xFFBDBDBD),
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            TextCustom(
                              text:
                                  "طریق المسجد الحرام - العزيزية - مكة المكرمة",
                              color: AppColors.tkTextPro,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            )
                            // SizedBox(width: 26.w,),
                          ],
                        )
                      ],
                    ),
                  ),

                  Expanded(
                    // flex: 1,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(top: 19.h),
                      child: TextCustom(
                        text: "منذ 3 ساعات",
                        color: Color(0xFF707070),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
