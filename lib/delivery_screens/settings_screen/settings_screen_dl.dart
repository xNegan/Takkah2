import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';
import '../order_log/orders_log_screen_dl.dart';

class SettingsScreenDl extends StatelessWidget {
  const SettingsScreenDl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 83,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: TextCustom(
          text: 'الاعدادات',
          fontSize: 18,
          color: AppColors.drInActiveBnbIcon,
        ),
        iconTheme: IconThemeData(
          color: AppColors.drInActiveBnbIcon,
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: 21.h, end: 13.w),
            child: Column(
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.near_me_outlined)),
                TextCustom(
                  text: 'الدعم الفني',
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF707070),
                ),
              ],
            ),
          )
        ],
        automaticallyImplyLeading: false,
        // leading: InkWell(
        //   onTap: () => {},
        //   child: Icon(
        //     Icons.arrow_back_ios,
        //     color: AppColors.drInActiveBnbIcon,
        //   ),
        // )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _infoContainer(),
            SizedBox(height: 72.h),
            _settingsItem(
                startText: 'عدد الطلبات',
                endText: '266',
                icon: Icons.shopping_bag_outlined),
            SizedBox(height: 23.h),
            InkWell(
              onTap: () => Get.to(OrdersLogScreenDl()),
              child: _settingsItem(
                  startText: 'سجل الطلبات', endText: '', icon: null),
            ),
            SizedBox(height: 23.h),
            _settingsItem(
                startText: 'الشروط والاحكام',
                endText: '',
                icon: Icons.info_outline),
            SizedBox(height: 23.h),
            _settingsItem(
                startText: 'الدعم الفني',
                endText: '',
                icon: Icons.support_agent_rounded),
            SizedBox(height: 23.h),
            _settingsItem(
                startText: 'الشكاوي والمقترحات',
                endText: '',
                icon: Icons.message),
            SizedBox(height: 23.h),
            _settingsItem(
                startText: 'مشاركة التطبيق', endText: '', icon: Icons.share),
            SizedBox(height: 23.h),
            _settingsItem(
                startText: 'تسجيل خروج', endText: '', icon: Icons.logout),
            SizedBox(
              height: 31.h,
            ),
            TextCustom(
              text: "تابعونا علي وسائل التواصل الاجتماعي",
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 31.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("images/tik-tok.png"),
                SizedBox(
                  width: 40.w,
                ),
                Image.asset("images/snapchat.png"),
                SizedBox(
                  width: 40.w,
                ),
                Image.asset("images/instagram.png"),
                SizedBox(
                  width: 40.w,
                ),
                Image.asset("images/twitter.png"),
              ],
            ),
            SizedBox(
              height: 52.h,
            ),
          ],
        ),
      ),
    );
  }

  Container _infoContainer() {
    return Container(
      padding: EdgeInsets.only(
        top: 25.h,
        bottom: 25.h,
        left: 25.w,
        right: 45.w,
      ),
      color: AppColors.drNotificationContainer,
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Image.asset(
              'images/pin.png',
              width: 16.w,
              height: 16.h,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoItem(text: 'عبد الرحمن علي محمد'),
                  SizedBox(height: 16.h),
                  _infoItem(text: 'Abdelrahman@gmail.com'),
                ],
              ),
              Container(
                width: 95.w,
                height: 95.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkmZAGvHdFUNOD4SKLrl9QcfsBGgz-LYvJPA&usqp=CAU',
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _settingsItem(
      {required String startText,
      required String endText,
      required IconData? icon}) {
    return Container(
      color: AppColors.drNotificationContainer,
      padding: EdgeInsets.only(
        left: 26.w,
        top: 18.h,
        bottom: 18.h,
        right: 45.w,
      ),
      child: Row(
        children: [
          TextCustom(
            text: startText,
            fontSize: 18,
            color: Color(0xFF707070),
          ),
          Spacer(),
          endText == ""
              ? Icon(
                  icon,
                  color: AppColors.drSettingText,
                  size: 20.sp,
                )
              : Container(
                  decoration: BoxDecoration(
                      color: AppColors.maincolor,
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsetsDirectional.only(
                      start: 18.w, end: 18.w, top: 6.h, bottom: 6.h),
                  child: TextCustom(
                    text: endText,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
          // TextCustom(
          //   text: endText,
          //   fontSize: 15,
          //   color: AppColors.drSettingText,
          // ),
        ],
      ),
    );
  }

  Widget _infoItem({required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextCustom(
          text: text,
        ),
        //SizedBox(width: 8.w),
        // Image.asset(
        //   'images/pin.png',
        //   width: 10.w,
        //   height: 10.h,
        // )
      ],
    );
  }
}
