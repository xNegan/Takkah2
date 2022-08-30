import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../uitls/app_consts.dart';

class BranchsScreen extends StatelessWidget {
  BranchsScreen({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: (() => Get.back()),
            icon: Icon(
              Icons.arrow_back_ios,
              size: 25.sp,
              color: Color(0xffAFAFAF),
            )),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.w),
          child: ListView.separated(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => _branchContainer(),
              separatorBuilder: (context, index) => Divider(
                    height: 80.h,
                  ),
              itemCount: 3)),
    );
  }

  Container _branchContainer() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextCustom(
                text: 'فرع 1',
                color: Color(0xff828282),
                fontSize: 13,
              ),
              Spacer(),
              TextButton(
                  style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  onPressed: () {},
                  child: TextCustom(
                    text: 'تعديل الفرع',
                    color: Color(0xff707070),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(width: 28.w),
              TextButton(
                  style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  onPressed: () {
                    showDialogConform(
                        Title: 'هل أنت متأكد من حذف الفرع',
                        cancel: () {
                          Get.back();
                        });
                  },
                  child: TextCustom(
                    text: 'حذف الفرع',
                    color: Color(0xff707070),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
          TextCustom(
            text: 'الموقع',
            color: Color(0xffBBBBBB),
            fontSize: 14,
          ),
          SizedBox(height: 8.h),

          // SizedBox(
          //   height: 47.h,
          //   child: TextField(
          //     style: TextStyle(fontSize: 14.sp, color: Color(0xff707070)),
          //     decoration: InputDecoration(
          //       contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
          //       suffixIcon: Icon(
          //         Icons.add_location_outlined,
          //         color: Color(0xffB9B9B9),
          //         size: 25.sp,
          //       ),
          //       focusedBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(7.r),
          //         borderSide: BorderSide(
          //           color: Color(0xffEBEBEB),
          //         ),
          //       ),
          //       enabledBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(7.r),
          //         borderSide: BorderSide(
          //           color: Color(0xffEBEBEB),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.r),
              border: Border.all(
                color: Color(0xffEBEBEB),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustom(
                  text: 'شارع الملك عبد الله - المدينة المنورة',
                  color: Color(0xff707070),
                  fontSize: 14,
                ),
                Icon(
                  Icons.add_location_outlined,
                  color: Color(0xffB9B9B9),
                  size: 25.sp,
                ),
              ],
            ),
          ),
          SizedBox(height: 18.h),

          TextCustom(
            text: 'مواعيد العمل',
            color: Color(0xffBBBBBB),
            fontSize: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextCustom(
                text: ':الايام',
                color: Color(0xff828282),
                fontSize: 13,
              ),
              TextCustom(
                text: 'من',
                color: Color(0xff828282),
                fontSize: 13,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(
                    color: Color(0xffEBEBEB),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(
                      text: 'السبت',
                      color: Color(0xff828282),
                      fontSize: 13,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xff7C7C7C),
                    )
                  ],
                ),
              ),
              TextCustom(
                text: 'الى',
                color: Color(0xff828282),
                fontSize: 13,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(
                    color: Color(0xffEBEBEB),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(
                      text: 'الخميس',
                      color: Color(0xff828282),
                      fontSize: 13,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xff7C7C7C),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextCustom(
                text: ':الايام',
                color: Color(0xff828282),
                fontSize: 13,
              ),
              TextCustom(
                text: 'من',
                color: Color(0xff828282),
                fontSize: 13,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(
                    color: Color(0xffEBEBEB),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(
                      text: 'السبت',
                      color: Color(0xff828282),
                      fontSize: 13,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xff7C7C7C),
                    )
                  ],
                ),
              ),
              TextCustom(
                text: 'الى',
                color: Color(0xff828282),
                fontSize: 13,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(
                    color: Color(0xffEBEBEB),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(
                      text: 'الخميس',
                      color: Color(0xff828282),
                      fontSize: 13,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xff7C7C7C),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
