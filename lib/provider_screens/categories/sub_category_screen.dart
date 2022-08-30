import '../../provider_screens/categories/meals_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextCustom(
          text: "منيو القسم",
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
                  crossAxisCount: 3,
                  crossAxisSpacing: 14.w,
                  mainAxisSpacing: 20.h),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Get.to(MealsScreen()),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.maincolor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/grid1.png",
                          width: 76.w,
                          height: 76.h,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextCustom(
                          text: "برجر دجاج",
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
                      text: "اضف منيو جديد",
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
