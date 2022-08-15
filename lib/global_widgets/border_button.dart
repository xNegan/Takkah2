import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takkah/global_widgets/text_custom.dart';

import '../uitls/app_colors.dart';

class BorderButton extends StatelessWidget {
  IconData icon;
  String text;
  Function() onPressed;

  BorderButton(
      {required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 49.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.r),
            ),
            side: BorderSide(color: AppColors.tkborder, width: 1),
            primary: Colors.transparent,
            onPrimary: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 10.w,
              child: Icon(
                icon,
                color: AppColors.tkText.withOpacity(0.5),
                size: 24.sp,
              ),
            ),
            SizedBox(width: 5.w),
            TextCustom(
              text: text,
              fontSize: 14,
              color: AppColors.tkText,
            ),
            SizedBox(width: 10.w),
          ],
        ));
  }
}
