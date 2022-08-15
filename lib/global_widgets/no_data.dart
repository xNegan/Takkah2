

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takkah/global_widgets/text_custom.dart';

import '../uitls/app_colors.dart';

class NoData extends StatelessWidget {
  const NoData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
        alignment: Alignment.center,
        height: 150.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextCustom(text: 'Oops! No data found.',fontSize: 14.sp, color: AppColors.purple,fontWeight: FontWeight.w400,),
          ],
        )));
  }



}
