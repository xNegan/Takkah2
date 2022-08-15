import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../uitls/app_colors.dart';


class IndicatorView extends StatelessWidget {
  final bool selected;

  IndicatorView({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.w,
      height: 12.h,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: selected ? AppColors.green: AppColors.whiteColor,
        // color: selected ? Colors.white: Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
