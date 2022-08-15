import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:takkah/screens/Auth/statusAcoount.dart';
import '../../global_widgets/ButtonApp.dart';
import '../../global_widgets/text_custom.dart';
import '../../global_widgets/text_field.dart';
import '../../uitls/app_colors.dart';
import 'Login.dart';

class valditeScreen extends StatefulWidget {
  const valditeScreen({Key? key}) : super(key: key);

  @override
  State<valditeScreen> createState() => _valditeScreenState();
}

class _valditeScreenState extends State<valditeScreen> {
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
                      reverse: true,
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
                                  text: 'أدخل رمز التحقق',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: 41.h,
                                ),
                                SizedBox(
                                  height: 100.h,
                                ),
                                ButtonApp(
                                  onTap: () {
                                    Get.to(StatusAcount());
                                  },
                                  title: 'تحقق',
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
