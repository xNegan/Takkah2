import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../global_widgets/ButtonApp.dart';
import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';
import 'Login.dart';

class statusSucsess extends StatefulWidget {
  const statusSucsess({Key? key}) : super(key: key);

  @override
  State<statusSucsess> createState() => _statusSucsessState();
}

class _statusSucsessState extends State<statusSucsess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding:
                      EdgeInsets.only(bottom: 55.h, left: 20.w, right: 20.w),
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      Image.asset(
                        'images/check.png',
                        width: 100.w,
                      ),
                      SizedBox(height: 48.h,),
                      Center(
                        child: TextCustom(
                          textAlign: TextAlign.center,
                          text:
                              'تمت مراجعة بياناتك بنجاح يمكنك الآن اكمال البيانات',
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColors.fontTitleColor,
                        ),
                      ),
                      Spacer(),
                      ButtonApp(
                        onTap: () {
                          Get.back();
                        },
                        title: 'اختيار الموقع الجغرافي',
                      )
                    ],
                  ),
                ),
              )),
        ));
  }
}
