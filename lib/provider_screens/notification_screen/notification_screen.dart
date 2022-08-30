import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../global_widgets/text_custom.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 70.h),
        itemBuilder: (context, index) => Container(
          color: index % 2 == 0 ? Color(0xffF6F6F6) : Colors.white,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  clipBehavior: Clip.antiAlias,
                  width: 51.w,
                  height: 51.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5VOlpbH2ioO8ZDv8vgKj3zvtmsGawgZ9k8g&usqp=CAU',
                    fit: BoxFit.cover,
                  )),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextCustom(
                      text: 'تم ارسال طلب جديد من',
                      fontSize: 15,
                      color: Color(0xffAFAFAF)),
                  SizedBox(
                    width: 3.w,
                  ),
                  TextCustom(
                    text: 'محمد السيد',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              TextCustom(
                text: 'منذ 3 دقائق',
                fontSize: 13,
                color: Color(0xffDDDADA),
              ),
            ],
          ),
        ),
        itemCount: 7,
        separatorBuilder: (context, index) => SizedBox(height: 7.h),
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(75.h),
      child: SafeArea(
        child: Container(
          height: 75.h,
          child: InkWell(
            onTap: () => Get.back(),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(width: 15.w),
              // Icon(
              //   Icons.arrow_back_ios,
              //   size: 20.sp,
              //   color: Color(0xffAFAFAF),
              // ),
              TextCustom(
                  text: 'الاشعارات', color: Color(0xffAFAFAF), fontSize: 15),
            ]),
          ),
        ),
      ),
    );
  }
}
