import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:takkah/provider_screens/Auth/valditeScreen.dart';

import '../../global_widgets/ButtonApp.dart';
import '../../global_widgets/Custom app_bar_simple.dart';
import '../../global_widgets/PasswordTexetField.dart';
import '../../global_widgets/TitleBox.dart';
import '../../global_widgets/text_custom.dart';
import '../../global_widgets/text_field.dart';
import '../../uitls/app_colors.dart';

import 'createAcount.dart';
import 'createAcount2.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextCustom(
                                  text: 'دخول',
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
                                        Get.to(createAcount());
                                      },
                                      child: TextCustom(
                                        text: 'انشاء حساب! ',
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
                                  textHint: 'ادخل رقم الجوال',
                                  hintColor: AppColors.blackColor,
                                ),
                                SizedBox(
                                  height: 45.h,
                                ),
                                ButtonApp(
                                  onTap: () {
                                    Get.to(valditeScreen());
                                  },
                                  title: 'دخول',
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

class textFieldLogin extends StatelessWidget {
  final TextEditingController controller;
  final String Title;
  final String hintText;
  final bool isShow;
  final bool isPassword;
  final Function() onshow;

  textFieldLogin(
      {required this.controller,
      required this.Title,
      required this.hintText,
      required this.isShow,
      required this.isPassword,
      required this.onshow});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(bottom: 10.h),
          child: TextCustom(
              text: Title,
              fontSize: 16,
              color: AppColors.fontColor,
              fontWeight: FontWeight.w400),
        ),
        Container(
          // height: 40.h,
          padding: EdgeInsets.all(1),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: AppColors.fontColor.withOpacity(0.5))),
          child: Row(
            children: [
              SizedBox(width: 40.w, child: Image.asset('images/phone.png')),
              Container(
                width: ScreenUtil().screenWidth - 80.w,
                child: TextFormField(
                  //  validator: validator,
                  controller: controller,
                  readOnly: false,
                  toolbarOptions: const ToolbarOptions(
                    copy: true,
                    cut: true,
                    paste: true,
                    selectAll: true,
                  ),
                  keyboardType:
                      isPassword ? TextInputType.text : TextInputType.number,
                  obscureText: isShow,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.sp,
                    color: AppColors.fontColor.withOpacity(0.5),
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: isPassword
                        ? InkWell(
                            onTap: onshow,
                            child: Icon(
                              Icons.remove_red_eye,
                              color: AppColors.fontColor,
                            ))
                        : SizedBox(),
                    hintText: hintText,
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13.sp,
                      color: AppColors.lGray,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.r),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.r),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
