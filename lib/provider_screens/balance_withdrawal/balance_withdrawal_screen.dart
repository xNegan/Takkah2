import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';
import '../add_new_bank/add_new_bank_screen.dart';

class BalanceWithdrawalScreen extends StatefulWidget {
  const BalanceWithdrawalScreen({Key? key}) : super(key: key);

  @override
  State<BalanceWithdrawalScreen> createState() =>
      _BalanceWithdrawalScreenState();
}

class _BalanceWithdrawalScreenState extends State<BalanceWithdrawalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFFAFAFAF),
            size: 12.h,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 24.w,
          end: 24.w,
        ),
        child: Column(
          children: [
            TextCustom(
              text: "المبلغ المتاح للسحب",
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xFFAFAFAF),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextCustom(
                  text: "200",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFAFAFAF),
                ),
                TextCustom(
                  text: "ريال سعودي",
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFAFAFAF),
                ),
              ],
            ),
            SizedBox(
              height: 42.h,
            ),
            Row(
              children: [
                Container(
                  height: 48.h,
                  padding: EdgeInsetsDirectional.only(
                      start: 9.w, end: 9.w, top: 10.h, bottom: 10.h),
                  decoration: BoxDecoration(
                      color: AppColors.maincolor,
                      borderRadius: BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(5),
                          topStart: Radius.circular(5))),
                  clipBehavior: Clip.antiAlias,
                  child: Center(
                      child: TextCustom(
                    text: "سحب الرصيد",
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  )),
                ),
                SizedBox(
                  width: 250.w,
                  height: 48.h,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsetsDirectional.only(
                          start: 44.w, end: 55.w, top: 4.h, bottom: 4.h),
                      hintStyle: TextStyle(
                          color: Color(0xFFB9B9B9),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp),
                      hintText: "أدخل المبلغ الذي تريد سحبه",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5)),
                        borderSide: BorderSide(
                          color: Color(0xFFE8E8E8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5)),
                        borderSide: BorderSide(
                          color: Color(0xFFE8E8E8),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5)),
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5)),
                        borderSide: BorderSide(
                          color: Color(0xFFE8E8E8),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 36.h,
            ),
            Align(
                alignment: AlignmentDirectional.topStart,
                child: TextCustom(
                  text: "اختر الحساب البنكي الذي تريد إرسال الأموال إليه",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                )),
            SizedBox(
              height: 16.h,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                padding: EdgeInsetsDirectional.only(top: 16.h, bottom: 75.h),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              offset: Offset(0, 4),
                              blurRadius: 4)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 10.w, top: 10.h, bottom: 7.h),
                          child: TextCustom(
                            text: "اسم البنك",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 24.w, end: 24.w, bottom: 24.h),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  TextCustom(
                                    text: "اسم المستخدم :  ",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF7C7C7C),
                                  ),
                                  TextCustom(
                                    text: "أحمد خالد",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              Row(
                                children: [
                                  TextCustom(
                                    text: "رقم الحساب :  ",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF7C7C7C),
                                  ),
                                  TextCustom(
                                    text: "1234 5678 9123 4565",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 26.h,
                              ),
                              Row(
                                children: [
                                  TextCustom(
                                    text: "رقم الجوال :  ",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF7C7C7C),
                                  ),
                                  TextCustom(
                                    text: "1234 5678 9123 4565",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
            ElevatedButton(
              onPressed: () {
                Get.to(AddNewBankScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 20.w,
                    height: 20.h,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.maincolor,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.add,
                      size: 12.h,
                      color: AppColors.maincolor,
                    ),
                  ),
                  SizedBox(
                    width: 37.w,
                  ),
                  TextCustom(
                      text: "اضافة بنك",
                      fontSize: 14.h,
                      color: AppColors.maincolor),
                ],
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  side: BorderSide(color: AppColors.maincolor),
                  elevation: 0),
            )
          ],
        ),
      ),
    );
  }
}
