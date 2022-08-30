import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global_widgets/ButtonApp.dart';
import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';

class Problem extends StatefulWidget {
  const Problem({Key? key}) : super(key: key);

  @override
  State<Problem> createState() => _ProblemState();
}

class _ProblemState extends State<Problem> {
  List<String> items = [
    'المندوب تاخر',
    'المندوب لا يرد على رسائلي',
    'استلمت الطلب الغلط',
    'الطلب ناقص',
    'سبب اخر',
  ];
  String? selectedItem = 'المندوب تاخر';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: TextCustom(
          text: 'رفع شكوي',
          fontSize: 18.sp,
          color: AppColors.midGray,
        ),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.hintText,
            )),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 25.w, end: 25.w, top: 35.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextCustom(
              text: 'اختر السبب',
              fontSize: 14,
              color: AppColors.tkText,
            ),
            SizedBox(height: 15.h),
            _builddropDownMenu(),
            SizedBox(height: 15.h),
            TextCustom(
              text: 'معلومات عن المتجر',
              fontSize: 14,
              color: AppColors.tkText,
            ),
            SizedBox(height: 16.h),
            _builldInfoContainer(),
            SizedBox(height: 16.h),
            Divider(
              color: AppColors.blackColor,
            ),
            Row(
              children: [
                Icon(
                  Icons.file_open_sharp,
                  color: AppColors.midGray,
                ),
                SizedBox(
                  width: 16.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustom(
                      text: 'المرفقات',
                      color: AppColors.midGray,
                    ),
                    TextCustom(
                        text: 'يمكنك رفع ٣ صور', color: AppColors.hintText),
                  ],
                )
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                Expanded(
                    child: addImageWidget(
                  onTap: () {},
                )),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                    child: addImageWidget(
                  onTap: () {},
                )),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                    child: addImageWidget(
                  onTap: () {},
                )),
              ],
            ),
            SizedBox(height: 60.h),
            Center(child: ButtonApp(title: 'ارسال', onTap: () {}))
          ],
        ),
      ),
    );
  }

  Widget _builddropDownMenu() {
    return Container(
      height: 53.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      width: double.infinity,
      alignment: Alignment.centerRight,
      // color: Colors.amber,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          border: Border.all(width: 1, color: AppColors.tkborder)),
      child: DropdownButtonFormField(
          // isExpanded: true,
          //isDense: true,
          decoration: InputDecoration(
            isCollapsed: true,
            contentPadding: EdgeInsets.zero,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            // enabledBorder: border,
            // focusedBorder: border,
          ),
          value: selectedItem,
          items: items
              .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e, style: TextStyle(fontSize: 10)),
                  ))
              .toList(),
          onChanged: (item) {
            setState(() {
              selectedItem = item.toString();
            });
          }),
    );
  }

  Container _builldInfoContainer() {
    return Container(
      height: 145.w,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          border: Border.all(width: 1, color: AppColors.tkborder)),
      child: TextField(
        style: TextStyle(
          fontSize: 14.sp,
        ),
        decoration: InputDecoration(border: InputBorder.none),
        maxLines: null,
        minLines: null,
        expands: true,
      ),
    );
  }
}

class addImageWidget extends StatelessWidget {
  late Function() onTap;

  addImageWidget({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            border: Border.all(color: AppColors.hintText)),
        padding: EdgeInsets.all(35.sp),
        child: Image.asset('images/add.png'),
      ),
    );
  }
}
