import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takkah/global_widgets/next_button.dart';
import 'package:takkah/global_widgets/text_custom.dart';
import 'package:takkah/provider_screens/register_screens/register_screen.dart';
import 'package:takkah/uitls/app_colors.dart';

import '../../global_widgets/border_button.dart';

class RegisterScreenMeals extends StatefulWidget {
  RegisterScreenMeals({Key? key}) : super(key: key);

  @override
  State<RegisterScreenMeals> createState() => _RegisterScreenMealsState();
}

class _RegisterScreenMealsState extends State<RegisterScreenMeals> {
  List<String> items = [
    'الدجاج',
    'الماكولات البحرية',
    'الاطباق الجانبية',
    'الحلويات',
  ];
  String selectedValue = 'الدجاج';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.h,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'images/beak.png',
                    height: 40.h,
                  ),
                  SizedBox(width: 10.w),
                  TextCustom(
                      text: 'مطعم البيك',
                      fontSize: 14,
                      color: AppColors.tkText,
                      fontWeight: FontWeight.bold),
                ],
              ),
              SizedBox(height: 17.h),
              TextCustom(
                text: 'اختر القسم ثم اضف الاطباق',
                fontSize: 14,
                color: AppColors.tkText,
              ),
              SizedBox(height: 15.h),
              _buildSectionListView(),
              SizedBox(height: 40.h),
              TextCustom(
                  text: 'الاطباق والوجبات',
                  fontSize: 14,
                  color: AppColors.tkText),
              SizedBox(height: 18.h),
              TextCustom(
                  text: 'اسم الطبق',
                  fontSize: 12,
                  color: AppColors.tkText,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 8.h),
              BorderTextField(hintText: 'ادخل اسم الطبق'),
              SizedBox(height: 15.h),
              TextCustom(
                  text: 'السعر',
                  fontSize: 12,
                  color: AppColors.tkText,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 8.h),
              BorderTextFieldExtraText(hintText: ' ادخل سعر الطبق'),
              SizedBox(height: 15.h),
              TextCustom(
                  text: 'اضف صورة',
                  fontSize: 12,
                  color: AppColors.tkText,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 8.h),
              imageButton(onPressed: () {}),
              SizedBox(height: 15.h),
              TextCustom(
                  text: 'تفاصيل الطبق',
                  fontSize: 12,
                  color: AppColors.tkText,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 8.h),
              _builldInfoContainer(),
              Divider(
                height: 50.h,
                thickness: 1,
                color: AppColors.tkborder,
              ),
              TextCustom(
                  text: 'المذاق المقترح',
                  fontSize: 12,
                  color: AppColors.tkText,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 8.h),
              BorderButton(
                  icon: Icons.add_box_outlined,
                  text: 'اضافة',
                  onPressed: () {}),
              Divider(
                height: 50.h,
                thickness: 1,
                color: AppColors.tkborder,
              ),
              TextCustom(
                  text: 'الحجم المقترح',
                  fontSize: 12,
                  color: AppColors.tkText,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 8.h),
              BorderButton(
                  icon: Icons.add_box_outlined,
                  text: 'اضافة',
                  onPressed: () {}),
              Divider(
                height: 50.h,
                thickness: 1,
                color: AppColors.tkborder,
              ),
              TextCustom(
                  text: 'المشروبات المقترحة',
                  fontSize: 12,
                  color: AppColors.tkText,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 8.h),
              BorderButton(
                  icon: Icons.add_box_outlined,
                  text: 'اضافة',
                  onPressed: () {}),
              Divider(
                height: 50.h,
                thickness: 1,
                color: AppColors.tkborder,
              ),
              TextCustom(
                  text: 'الاضافات المقترحة',
                  fontSize: 12,
                  color: AppColors.tkText,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 8.h),
              BorderButton(
                  icon: Icons.add_box_outlined,
                  text: 'اضافة',
                  onPressed: () {}),
              Divider(
                height: 50.h,
                thickness: 2,
                color: Colors.black.withOpacity(0.3),
              ),
              BorderButton(
                  borderColor: AppColors.maincolor,
                  icon: Icons.add_box_outlined,
                  text: 'اضف وجبة جديدة',
                  onPressed: () {}),
              /**/

              SizedBox(height: 25.h),
              NextButton(text: 'حفظ', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildSectionListView() {
    return SizedBox(
      height: 44.h,
      child: ListView.separated(
        separatorBuilder: ((context, index) => SizedBox(width: 5.w)),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: ((context, index) => InkWell(
              onTap: () {
                setState(() {
                  selectedValue = items[index];
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: items[index] == selectedValue
                      ? null
                      : Border.all(width: 1, color: AppColors.tkborder),
                  borderRadius: BorderRadius.circular(10.r),
                  color: items[index] == selectedValue
                      ? AppColors.maincolor
                      : Colors.transparent,
                ),
                child: TextCustom(
                  text: items[index],
                  color: items[index] == selectedValue
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            )),
      ),
    );
  }

  Container _builldInfoContainer() {
    return Container(
      height: 72.w,
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

class BorderTextField extends StatelessWidget {
  String hintText;

  BorderTextField({
    required this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      alignment: Alignment.center,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(color: AppColors.tkborder, width: 1),
        color: Colors.transparent,
      ),
      child: TextField(
        style: TextStyle(fontSize: 14.sp),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.tkborder,
          ),
          isCollapsed: true,
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          isDense: true,
        ),
      ),
    );
  }
}

Container _builldInfoContainer() {
  return Container(
    height: 72.w,
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

class BorderTextFieldExtraText extends StatelessWidget {
  String hintText;
  BorderTextFieldExtraText({
    required this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      alignment: Alignment.center,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(color: AppColors.tkborder, width: 1),
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(fontSize: 14.sp),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: AppColors.tkborder,
                ),
                isCollapsed: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          TextCustom(
              text: 'ريال سعودي',
              fontSize: 12,
              color: AppColors.tkText,
              fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}
