import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takkah/global_widgets/text_custom.dart';

import '../uitls/app_colors.dart';

class NextButton extends StatelessWidget {
  String text;
  Function() onPressed;

  NextButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 60.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.r),
            ),
            primary: AppColors.maincolor,
            elevation: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextCustom(
              text: text,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ],
        ));
  }
}
