import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global_widgets/Custom app_bar_simple.dart';
import '../../global_widgets/PasswordTexetField.dart';
import '../../global_widgets/TitleBox.dart';
import '../../global_widgets/text_custom.dart';
import '../../global_widgets/text_field.dart';
import '../../uitls/app_colors.dart';
import 'Login.dart';

class CreateAcount extends StatefulWidget {



  @override
  _CreateAcountState createState() => _CreateAcountState();
}

class _CreateAcountState extends State<CreateAcount> {
  final TextEditingController link = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image:DecorationImage(
                image: AssetImage('images/backroundCapon.png'),
                fit: BoxFit.fill
            )
        ),
        child: Scaffold(
          backgroundColor: AppColors.noColor,
          appBar: CustomAppbarSimple(Title:  'التسجيل',width: 100),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: ScreenUtil().screenHeight-ScreenUtil().screenHeight*0.4,
                child: ListView(
                  padding: EdgeInsetsDirectional.only(start: 48.w,end: 48.w,top: 10.h,bottom: 10.h),
                  children: [
                    TitleBoxRow(
                      isNote: false,
                      title: 'الاسم',
                      isReadOnly: false,
                      controllerText: link,
                    ),
                    SizedBox(height: 10,),
                    TitleBoxRow(
                      isNote: false,
                      title: 'الايميل',
                      isReadOnly: false,
                      isEmail: true,
                      controllerText: link,
                    ),
                    SizedBox(height: 10,),
                    TitleBoxRow(
                      isNote: false,
                      title: 'رقم الجوال',
                      isReadOnly: false,
                      isNum: true,
                      controllerText: link,
                    ),
                    TitleBoxRow(
                      isNote: false,
                      title: 'رقم الهوية',
                      isReadOnly: false,
                      isNum: true,
                      controllerText: link,
                    ),
                    passwordTextField(icon: Icon(Icons.keyboard_arrow_down_rounded),isread: false,isShow: false,controller: link,Title: 'المدينة',
                      onshow: (){},),
                    passwordTextField(icon: Icon(Icons.remove_red_eye),isread: false,isShow: false,controller: link,Title: 'اكلمة المرور',
                        onshow: (){},),
                    passwordTextField(icon: Icon(Icons.remove_red_eye),isread: false,isShow: false,controller: link,Title: 'تأكيد كلمة المرور',
                      onshow: (){},),
                  ],
                ),
              ),
              CheckboxListTile(
                value: true,
                activeColor: AppColors.purple,
                contentPadding: EdgeInsets.zero,
                controlAffinity:
                ListTileControlAffinity.leading,
                onChanged: (value) {

                },
                title: Wrap(
                  children: [
                    TextCustom(
                      text:
                      'لقد قرأت ووافقت على ',
                      fontSize: 12,
                      color: AppColors.fontColor,
                    ),
                    InkWell(
                      onTap: (){},
                      child: TextCustom(
                        text:
                        'شروط الاستخدام ',
                        fontSize: 12,
                        color: AppColors.fontColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: TextCustom(
                        text:
                        'و سياسة الخصوصية',
                        fontSize: 12,
                        color: AppColors.fontColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Wrap(
                children: [
                  TextCustom(
                    text:
                    'لدي حساب ',
                    fontSize: 16,
                    color: AppColors.fontColor,
                  ),
                  InkWell(
                    onTap: (){Get.to(Login());},
                    child: TextCustom(
                      text:
                      'تسجيل دخول',
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10.h,),
              InkWell(
                child: Container(
                  width: ScreenUtil().screenWidth,
                  height: 50.h,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 1.0],
                        colors: [
                          AppColors.purpleBasic,
                          AppColors.gradientButtonSecondColor,
                        ],
                      )),
                  child: Center(child: TextCustom(text: 'تسجيل الأن',color: AppColors.whiteColor,fontWeight: FontWeight.bold,fontSize: 16.sp,)),
                ),
                onTap: (){},
              )
            //  ButtonApp(title: 'حفظ التعديلات', onTap:(){} )
            ],
          ),

        ),),
    );
  }
}


