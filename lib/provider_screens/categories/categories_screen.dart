import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global_widgets/text_custom.dart';
import '../../provider_screens/categories/sub_category_screen.dart';
import '../../uitls/app_colors.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextCustom(
          text: "الأقسام",
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Color(0xFFAFAFAF),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFFAFAFAF),
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: 6,
              padding: EdgeInsetsDirectional.only(
                  start: 24.w, end: 24.w, top: 40.h, bottom: 144.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 48.w,
                  mainAxisSpacing: 20.h),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Get.to(SubCategoryScreen()),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.maincolor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("images/grid1.png"),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextCustom(
                          text: "سلطات",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                );
              }),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 24.w, end: 49.w),
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 20.w,
                    height: 20.h,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.maincolor,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.add,
                      size: 12.h,
                      color: AppColors.maincolor,
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  TextCustom(
                      text: "اضف قسم جديد",
                      fontSize: 14.h,
                      color: AppColors.maincolor),
                ],
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  side: BorderSide(color: AppColors.maincolor),
                  elevation: 0),
            ),
          )
        ],
      ),
    );
  }
}
