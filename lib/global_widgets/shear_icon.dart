import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../uitls/app_colors.dart';

class ShearIcon extends StatelessWidget {
  final GestureTapCallback? onTap;
  final double wSize;
  final double hSize;
  final double iconSize;

  ShearIcon({
    required this.onTap,
    this.wSize = 24,
    this.hSize = 24,
    this.iconSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: wSize.w,
        height: hSize.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.darkBlack,
            )
        ),
        child: Icon(Icons.share,size: iconSize.sp,),
      ),
    );
  }
}