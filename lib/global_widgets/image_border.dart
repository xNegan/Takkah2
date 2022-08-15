import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageBorder extends StatelessWidget {
  final String imageUrl;
  final BoxFit boxFit;
  ImageBorder({required this.imageUrl, this.boxFit = BoxFit.fill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        // color: AppColors.green,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(50.r),
          topEnd: Radius.circular(50.r),
        ),
      ),
      child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(50.r),
          child: Image.asset(imageUrl,width: double.infinity,height: double.infinity,fit: boxFit,)),
    );
  }
}