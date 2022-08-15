import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:takkah/global_widgets/text_custom.dart';

import '../uitls/app_colors.dart';

class CustomAppbarSimple extends StatelessWidget with PreferredSizeWidget {
  String Title;
  int width;

  CustomAppbarSimple({required this.Title,required this.width});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(200.h),
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 100.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back)),
            SizedBox(width: width.w,),
            TextCustom(
              text: Title,
              color: AppColors.fontColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(200.h);
}
