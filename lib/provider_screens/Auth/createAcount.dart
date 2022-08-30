import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:takkah/provider_screens/Auth/valditeScreen.dart';

import '../../global_widgets/ButtonApp.dart';

import '../../global_widgets/TitleBox.dart';
import '../../global_widgets/text_custom.dart';
import '../../global_widgets/text_field.dart';
import '../../uitls/app_colors.dart';

import 'Login.dart';
import 'createAcount.dart';
import 'createAcount2.dart';

class createAcount extends StatefulWidget {
  @override
  _createAcountState createState() => _createAcountState();
}

class _createAcountState extends State<createAcount> {
  final TextEditingController link = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFFFA9C21),
                        Color(0xFFC05501),
                      ],
                    ),
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            "images/splachicon.png",
                          ),
                          Container(
                            width: context.width,
                            height: 800.h,
                            margin: EdgeInsets.only(
                                bottom: 10.h,
                                left: 10.w,
                                right: 10.w,
                                top: 50.h),
                            padding: EdgeInsets.only(
                                top: 77.h,
                                left: 30.w,
                                right: 30.w,
                                bottom: 50.h),
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: ListView(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextCustom(
                                  text: 'إنشاء حساب',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: 21.h,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(Login());
                                      },
                                      child: TextCustom(
                                        text: 'تسجيل دخول!',
                                        fontSize: 12,
                                        color: AppColors.maincolor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextCustom(
                                      text: 'ليس لديك حساب؟',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 41.h,
                                ),
                                TextFieldCustom(
                                  textInputType: TextInputType.text,
                                  textHint: 'اسم صاحب المؤسسه',
                                  hintColor: AppColors.blackColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFieldCustom(
                                  textInputType: TextInputType.text,
                                  textHint: 'اسم المتجر',
                                  hintColor: AppColors.blackColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFieldCustom(
                                  textInputType: TextInputType.text,
                                  textHint: 'البريد الألكتروني للمتجر',
                                  hintColor: AppColors.blackColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFieldCustom(
                                  textInputType: TextInputType.text,
                                  textHint: 'رقم الجوال',
                                  hintColor: AppColors.blackColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFieldCustom(
                                  onTap: () {
                                    print("object");
                                  },
                                  readOnly: true,
                                  textInputType: TextInputType.text,
                                  textHint: 'الشعار',
                                  hintColor: AppColors.blackColor,
                                  suffixWid: Icon(Icons.add_a_photo),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                ButtonApp(
                                  onTap: () {
                                    Get.to(createAcount2());
                                  },
                                  title: 'التالي',
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            )));
  }
}
