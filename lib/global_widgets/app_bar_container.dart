import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../uitls/app_colors.dart';

class AppBarContainer extends StatelessWidget {
  Widget childWidget;
  AppBarContainer({
    required this.childWidget,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
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
      child: childWidget,
    );
  }
}
