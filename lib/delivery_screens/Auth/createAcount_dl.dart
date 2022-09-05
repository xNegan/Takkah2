import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global_widgets/ButtonApp.dart';

import '../../global_widgets/TitleBox.dart';
import '../../global_widgets/text_custom.dart';
import '../../global_widgets/text_field.dart';
import '../../uitls/app_colors.dart';

import 'Login_dl.dart';
import 'createAcount_dl.dart';

class createAcountDl extends StatefulWidget {
  @override
  _createAcountDlState createState() => _createAcountDlState();
}

class _createAcountDlState extends State<createAcountDl> {
  final TextEditingController link = TextEditingController();
  bool value = false;
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
                            width: 180.w,
                            height: 180.h,
                          ),
                          Container(
                            width: context.width,
                            height: 600.h,
                            margin: EdgeInsets.only(
                                bottom: 10.h,
                                left: 10.w,
                                right: 10.w,
                                top: 50.h),
                            padding: EdgeInsets.only(
                                top: 30.h,
                                left: 30.w,
                                right: 30.w,
                                bottom: 30.h),
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
                                        Get.to(LoginDl());
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
                                TextCustom(text: 'نوع المركبه'),
                                Row(
                                  children: [
                                    Checkbox(
                                      checkColor: AppColors.maincolor,
                                      shape: CircleBorder(),
                                      activeColor: AppColors.hintText,
                                      value: this.value,
                                      onChanged: (var Value) {
                                        setState(() {
                                          this.value = Value!;
                                        });
                                      },
                                    ),
                                    TextCustom(text: 'سياره'),
                                    SizedBox(
                                      width: 50.w,
                                    ),
                                    Checkbox(
                                      checkColor: AppColors.maincolor,
                                      shape: CircleBorder(),
                                      activeColor: AppColors.hintText,
                                      value: this.value,
                                      onChanged: (var Value) {
                                        setState(() {
                                          this.value = Value!;
                                        });
                                      },
                                    ),
                                    TextCustom(text: 'دباب'),
                                  ],
                                ),
                                TextFieldCustom(
                                  textInputType: TextInputType.text,
                                  textHint: 'الإسم بالكامل',
                                  hintColor: AppColors.blackColor,
                                ),

                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFieldCustom(
                                        textInputType: TextInputType.number,
                                        textHint: 'الجنسية',
                                        hintColor: AppColors.blackColor,
                                        suffixWid: Icon(Icons.arrow_drop_down),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextFieldCustom(
                                        textInputType: TextInputType.number,
                                        textHint: 'العمر',
                                        hintColor: AppColors.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFieldCustom(
                                  textInputType: TextInputType.number,
                                  textHint: 'رقم الجوال',
                                  hintColor: AppColors.blackColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFieldCustom(
                                  textInputType: TextInputType.number,
                                  textHint: 'رقم الهويه',
                                  hintColor: AppColors.blackColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFieldCustom(
                                  textInputType: TextInputType.text,
                                  textHint: 'البريد الألكتروني',
                                  hintColor: AppColors.blackColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFieldCustom(
                                  textInputType: TextInputType.text,
                                  textHint: 'رانشاء رقم سري',
                                  hintColor: AppColors.blackColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ////////////////////////////////////////
                                TextFieldCustom(
                                  onTap: () {
                                    print("object");
                                  },
                                  readOnly: true,
                                  textInputType: TextInputType.text,
                                  textHint: 'رفع صوره شخصية',
                                  hintColor: AppColors.blackColor,
                                  suffixWid: Icon(Icons.add_a_photo),
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
                                  textHint: 'صورة الهوية من الأمام',
                                  hintColor: AppColors.blackColor,
                                  suffixWid: Icon(Icons.add_a_photo),
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
                                  textHint: 'اصورة رخصة القيادة',
                                  hintColor: AppColors.blackColor,
                                  suffixWid: Icon(Icons.add_a_photo),
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
                                  textHint: 'صورة استماره المركبه',
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
                                  colorButton: Colors.black,
                                  isblack: true,
                                  onTap: () {
                                    Get.to(LoginDl());
                                  },
                                  title: 'ارسال',
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
