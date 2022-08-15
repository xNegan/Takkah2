import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:takkah/global_widgets/text_custom.dart';


import '../uitls/app_colors.dart';

class LoadingData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation(AppColors.purple),
          strokeWidth: 2,
          backgroundColor: AppColors.bg,
        ),
        SizedBox(height: 16.h),
        TextCustom(text: 'loading'.tr, fontSize: 14.sp),
      ],
    ));
  }
}
