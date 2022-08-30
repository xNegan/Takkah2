import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';
import 'Login_dl.dart';
import 'createAcount_dl.dart';

class LginAS extends StatefulWidget {
  const LginAS({Key? key}) : super(key: key);

  @override
  State<LginAS> createState() => _LginASState();
}

class _LginASState extends State<LginAS> {
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
                    Color(0xFF6069E5),
                    Color(0xFFA5CCFF),
                  ],
                ),
              ),
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(
                      top: 45.h, bottom: 88.h, left: 77.w, right: 77.w),
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 53.h,
                      ),
                      Image.asset(
                        'images/signin.png',
                        width: 100.w,
                      ),
                      SizedBox(
                        height: 45.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => createAcountDl());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                                color: AppColors.maincolor, width: 2),
                          ),
                          padding: EdgeInsets.only(
                              top: 45.h,
                              bottom: 45.h,
                              left: 64.5.w,
                              right: 64.5.w),
                          child: Column(
                            children: [
                              Image.asset('images/store.png'),
                              SizedBox(
                                height: 12.h,
                              ),
                              TextCustom(
                                text: 'متاجر',
                                color: AppColors.maincolor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => createAcountDl());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.maincolor,
                          ),
                          padding: EdgeInsets.only(
                              top: 45.h,
                              bottom: 45.h,
                              left: 64.5.w,
                              right: 64.5.w),
                          child: Column(
                            children: [
                              Image.asset('images/package.png'),
                              SizedBox(
                                height: 12.h,
                              ),
                              TextCustom(
                                text: 'مناديب',
                                color: AppColors.whiteColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
