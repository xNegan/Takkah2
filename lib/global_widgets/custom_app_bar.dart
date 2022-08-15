import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../uitls/app_colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  Widget child;
  double paddingBottom;
  CustomAppBar({required this.child, this.paddingBottom = 15});
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(120.h),
        child: Container(
          alignment: Alignment.bottomCenter,
          padding:
              EdgeInsets.only(left: 16.w, right: 16.w, bottom: paddingBottom.h),
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            colors: [
              AppColors.purpleBasic,
              AppColors.gradientAppbarSecondColor,
            ],
          )),
          child: child,
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(120.h);
}
