import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:takkah/uitls/app_colors.dart';

import '../../global_widgets/ButtonApp.dart';
import '../../global_widgets/text_field.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xFFAFAFAF),
              ))),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
            bottom: 60.h, top: 20.h, start: 35.w, end: 35.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    width: 144.w,
                    height: 144.h,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Material(
                        elevation: 10,
                        shape: CircleBorder(),
                        child: Image.network(
                          'https://www.fekera.com/wp-content/uploads/2021/04/1261021200px-kfc_logo.svg_.png',
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
                Center(
                  child: Container(
                    width: 144.w,
                    height: 144.h,
                    decoration: BoxDecoration(
                        color: Colors.black.withAlpha(130),
                        shape: BoxShape.circle),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60.h),
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.add_box_outlined,
                          color: AppColors.whiteColor,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70.h,
            ),
            TextFieldCustom(
              textInputType: TextInputType.text,
              textHint: 'مطعم كنتاكي',
              hintColor: AppColors.blackColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFieldCustom(
              textInputType: TextInputType.text,
              textHint: 'KFC.Gada@gmail.com',
              hintColor: AppColors.blackColor,
            ),
            Spacer(),
            ButtonApp(
              isblack: true,
              onTap: () {
                Get.back();
                // showDialogConform(Title: 'هل أنت متأكد من حذف الوجبة');
              },
              title: 'حفظ',
            )
          ],
        ),
      ),
    );
  }
}
