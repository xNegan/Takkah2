import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:takkah/global_widgets/next_button.dart';
import 'package:takkah/global_widgets/text_custom.dart';
import 'package:takkah/uitls/app_colors.dart';

import '../../global_widgets/ButtonApp.dart';
import '../../global_widgets/TitleBox.dart';
import '../../global_widgets/border_button.dart';
import '../../global_widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  List<String> items = [
    'مأكولات سعودية',
    'مأكولات شامية',
    'مأكولات مصرية',
    'مأكولات بحرية',
    'مأكولات اسيوية',
  ];
  String? selectedItem = 'مأكولات سعودية';

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
                text: 'التصنيف',
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
              BorderButton(
                  onPressed: () {},
                  icon: Icons.add_location_outlined,
                  text: 'اضف فرع'),
              SizedBox(height: 15.h),
              TextCustom(
                text: 'صور المتجر',
                fontSize: 14,
                color: AppColors.tkText,
              ),
              SizedBox(height: 16.h),
              imageButton(onPressed: () {}),
              SizedBox(height: 16.h),
              TextCustom(
                text: 'المنيو المصور (اختياري)',
                fontSize: 14,
                color: AppColors.tkText,
              ),
              SizedBox(height: 16.h),
              imageButton(onPressed: () {}),
              SizedBox(height: 16.h),
              TextCustom(
                text: 'الاقسام',
                fontSize: 14,
                color: AppColors.tkText,
              ),
              BorderButton(
                  icon: Icons.add_box_outlined,
                  text: 'اضف قسم',
                  onPressed: () {
                    openBottomSheet();
                  }),
              SizedBox(height: 45.h),
              NextButton(text: 'التالي', onPressed: () {}),
            ],
          ),
        ),
      ),
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
}

class imageButton extends StatelessWidget {
  Function() onPressed;

  imageButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            minimumSize: Size(80.w, 80.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.r),
            ),
            side: BorderSide(color: AppColors.tkborder, width: 1),
            primary: Colors.transparent,
            elevation: 0),
        child: Icon(
          Icons.add_photo_alternate_outlined,
          color: AppColors.tkText.withOpacity(0.5),
        ));
  }
}

OutlineInputBorder get border {
  return OutlineInputBorder(
      gapPadding: 0,
      borderRadius: BorderRadius.circular(50.r),
      borderSide: const BorderSide(width: 2, color: AppColors.tkborder));
}
void openBottomSheet() {
  Get.bottomSheet(
    Padding(
      padding:  EdgeInsets.all(15.sp),
      child: SizedBox(
        height: 400.h,

        //k
        child: Column(
          children: [
            Row(children: [
              Spacer(),
              TextCustom(text: 'اضافة قسم',color: AppColors.blackColor,fontSize: 18.sp,fontWeight: FontWeight.bold,),
              Spacer(),
              InkWell(
                  onTap: (){ Get.back();},
                  child: Icon(Icons.close)),
            ],),
            SizedBox(height: 80.h,),
            TextFieldCustom(
              textInputType: TextInputType.text,
              textHint: 'اسم القسم',
              hintColor: AppColors.blackColor,
            ),
            SizedBox(height: 100.h,),
            ButtonApp(
              onTap: () {
               Get.back();
              },
              title: 'حفظ',
            )

          ],
        ),
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
    ),
  );
}