import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:takkah/screens/Auth/valditeScreen.dart';

import '../../global_widgets/ButtonApp.dart';

import '../../global_widgets/TitleBox.dart';
import '../../global_widgets/text_custom.dart';
import '../../global_widgets/text_field.dart';
import '../../uitls/app_colors.dart';

import 'createAcount2.dart';

class createAcount2 extends StatefulWidget {
  @override
  _createAcount2State createState() => _createAcount2State();
}

class _createAcount2State extends State<createAcount2> {
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextCustom(
                                      text: 'إنشاء حساب',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    InkWell(
                                      onTap:(){
                                        Get.back();
                                      },
                                      child: TextCustom(
                                        text: 'رجوع',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 41.h,
                                ),
                                TextFieldCustom(
                                  textInputType: TextInputType.text,
                                  textHint: 'تاريخ بداية السجل التجاري',
                                  hintColor: AppColors.blackColor,
                                ),
                                SizedBox(height: 10,),
                                TextFieldCustom(
                                  textInputType: TextInputType.text,
                                  textHint: 'تاريخ نهاية السجل التجاري',
                                  hintColor: AppColors.blackColor,
                                ),
                                SizedBox(height: 10,),
                                TextFieldCustom(
                                  onTap: (){
                                    print("object");
                                  },
                                  readOnly: true,
                                  textInputType: TextInputType.text,
                                  textHint: 'صورة السجل التجاري',
                                  hintColor: AppColors.blackColor,
                                  suffixWid: Icon(Icons.add_a_photo),
                                ),
                                SizedBox(height: 10,),
                                Divider(),
                                TitleBoxRow(isNote: false,title: 'نوع المتجر',ontap: (){print("object");}),
                                CheckboxListTile(
                                  value: false,
                                  activeColor: AppColors.blackColor,
                                  contentPadding: EdgeInsets.zero,
                                  controlAffinity:
                                  ListTileControlAffinity.leading,
                                  onChanged: (value) {

                                  },
                                  title: Wrap(
                                    children: [
                                      TextCustom(
                                        text:
                                        'لقد قرأت',
                                        fontSize: 12,
                                        color: AppColors.fontColor,
                                      ),
                                      InkWell(
                                        onTap: (){},
                                        child: TextCustom(
                                          text:
                                          'الشروط',
                                          fontSize: 12,
                                          color: AppColors.fontColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){},
                                        child: TextCustom(
                                          text:
                                          'والأحكام',
                                          fontSize: 12,
                                          color: AppColors.fontColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 45.h,
                                ),
                                ButtonApp(
                                  onTap: () {
                                    Get.to(valditeScreen());
                                  },
                                  title: 'ارسل',
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

