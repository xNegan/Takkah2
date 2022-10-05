import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:takkah/global_widgets/next_button.dart';
import 'package:takkah/global_widgets/text_custom.dart';
import 'package:takkah/provider_screens/register_screens/register_screen.dart';
import 'package:takkah/uitls/app_colors.dart';

import '../../global_widgets/ButtonApp.dart';
import '../../global_widgets/border_button.dart';
import '../../global_widgets/text_field.dart';
import '../main_screen.dart';
import 'controller/register_meals_controller.dart';

class RegisterScreenMeals extends StatefulWidget {
  String categoryId;

  String tag;

  RegisterScreenMeals({required this.categoryId, required this.tag});

  @override
  State<RegisterScreenMeals> createState() => _RegisterScreenMealsState();
}

class _RegisterScreenMealsState extends State<RegisterScreenMeals> {
  // List<String> items = [
  //   'الدجاج',
  //   'الماكولات البحرية',
  //   'الاطباق الجانبية',
  //   'الحلويات',
  // ];
  // String selectedValue = 'الدجاج';

  @override
  Widget build(BuildContext context) {
    if(widget.tag == ""){
      setState(() {
        RegisterMealsController.to.selectedCategoryId = int.parse(widget.categoryId);
      });
      print("Cat:: ${RegisterMealsController.to.selectedCategoryId}");
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.h,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<RegisterMealsController>(
          init: RegisterMealsController(),
          builder: (controller) {

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.w),
              child: SingleChildScrollView(
                reverse: true,
                child: Form(
                  key: controller.key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            'https://upload.wikimedia.org/wikipedia/ar/thumb/a/a1/Albaik_logo.svg/1200px-Albaik_logo.svg.png',
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
                      Visibility(
                        visible: widget.tag != "" && widget.categoryId == "",
                        child: Column(
                          children: [
                            TextCustom(
                              text: 'اختر القسم ثم اضف الاطباق',
                              fontSize: 14,
                              color: AppColors.tkText,
                            ),
                            SizedBox(height: 15.h),
                            _buildSectionListView(),
                            SizedBox(height: 40.h),
                          ],
                        ),
                      ),

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
                      BorderTextField(
                          controller: controller.mealNameController,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return "يرجى ادخال الحقل المطلوب";
                            }
                            // return ''; this is causing you the error you must return null
                            return null; // this is correct
                          },
                          hintText: 'ادخل اسم الطبق'),
                      SizedBox(height: 15.h),
                      TextCustom(
                          text: 'السعر',
                          fontSize: 12,
                          color: AppColors.tkText,
                          fontWeight: FontWeight.bold),
                      SizedBox(height: 8.h),
                      BorderTextFieldExtraText(
                          controller: controller.priceMealController,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return "يرجى ادخال الحقل المطلوب";
                            }
                            // return ''; this is causing you the error you must return null
                            return null; // this is correct
                          },
                          hintText: ' ادخل سعر الطبق'),
                      SizedBox(height: 15.h),
                      TextCustom(
                          text: 'اضف صورة',
                          fontSize: 12,
                          color: AppColors.tkText,
                          fontWeight: FontWeight.bold),
                      SizedBox(height: 8.h),
                      imageButton(onPressed: () => controller.pickMealImage()),
                      SizedBox(height: 15.h),
                      TextCustom(
                          text: 'تفاصيل الطبق',
                          fontSize: 12,
                          color: AppColors.tkText,
                          fontWeight: FontWeight.bold),
                      SizedBox(height: 8.h),
                      _builldInfoContainer(
                        controller: controller.descMealController,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return "يرجى ادخال الحقل المطلوب";
                          }
                          // return ''; this is causing you the error you must return null
                          return null; // this is correct
                        },                    ),
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
                          onPressed:() {
                            setState(() {
                              controller.section = 'المذاق المقترح';
                            });
                            openBottomSheet();
                          }),
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
                          onPressed: () {
                            setState(() {
                              controller.section = 'الحجم المقترح';
                            });
                            openBottomSheet();

                          }),
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
                          onPressed: () {
                            setState(() {
                              controller.section = 'المشروبات المقترحة';
                            });
                            openBottomSheet();

                          }),
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
                          onPressed: () {
                            setState(() {
                              controller.section = 'الاضافات المقترحة';
                            });
                            openBottomSheet();

                          }),
                      Divider(
                        height: 50.h,
                        thickness: 2,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      BorderButton(
                          borderColor: AppColors.maincolor,
                          icon: Icons.add_box_outlined,
                          text: 'اضف وجبة جديدة',
                          onPressed: () => controller.createMelas()),
                      /**/

                      SizedBox(height: 25.h),
                      NextButton(
                          text: 'حفظ',
                          onPressed: () {
                            Get.to(MainScreen());
                          }),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            );
          }
      ),

    );

  }

  openBottomSheet() {
    TextEditingController name = TextEditingController();
    TextEditingController price = TextEditingController();
    TextEditingController cal = TextEditingController();
    Get.bottomSheet(
      Padding(
        padding: EdgeInsets.all(15.sp),
        child: SingleChildScrollView(
          child: Form(
            key: RegisterMealsController.to.keyAddition,
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    TextCustom(
                      text: RegisterMealsController.to.section,
                      color: AppColors.blackColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.close)),
                  ],
                ),
                SizedBox(
                  height: 80.h,
                ),
                TextFieldCustom(
                  controller: name,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "يرجى ادخال الحقل المطلوب";
                    }
                    // return ''; this is causing you the error you must return null
                    return null; // this is correct
                  },
                  textInputType: TextInputType.text,
                  textHint: 'الاسم',
                  hintColor: AppColors.blackColor,
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFieldCustom(
                  controller: price,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "يرجى ادخال الحقل المطلوب";
                    }
                    // return ''; this is causing you the error you must return null
                    return null; // this is correct
                  },
                  textInputType: TextInputType.text,
                  textHint: 'السعر',
                  hintColor: AppColors.blackColor,
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFieldCustom(
                  controller: cal,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "يرجى ادخال الحقل المطلوب";
                    }
                    // return ''; this is causing you the error you must return null
                    return null; // this is correct
                  },
                  textInputType: TextInputType.text,
                  textHint: 'السعرات الحرارية',
                  hintColor: AppColors.blackColor,
                ),
                SizedBox(
                  height: 100.h,
                ),
                ButtonApp(
                  onTap: () {
                    RegisterMealsController.to.checkFormAddition(name: name.text, price: price.text, cal: cal.text,);
                  },
                  title: 'حفظ',
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );



  }

  // SizedBox _buildSectionListView() {
  //   return SizedBox(
  //     height: 44.h,
  //     child: ListView.separated(
  //       separatorBuilder: ((context, index) => SizedBox(width: 5.w)),
  //       shrinkWrap: true,
  //       scrollDirection: Axis.horizontal,
  //       itemCount: items.length,
  //       itemBuilder: ((context, index) => InkWell(
  //             onTap: () {
  //               setState(() {
  //                 selectedValue = items[index];
  //               });
  //             },
  //             child: Container(
  //               padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
  //               alignment: Alignment.center,
  //               decoration: BoxDecoration(
  //                 border: items[index] == selectedValue
  //                     ? null
  //                     : Border.all(width: 1, color: AppColors.tkborder),
  //                 borderRadius: BorderRadius.circular(10.r),
  //                 color: items[index] == selectedValue
  //                     ? AppColors.maincolor
  //                     : Colors.transparent,
  //               ),
  //               child: TextCustom(
  //                 text: items[index],
  //                 color: items[index] == selectedValue
  //                     ? Colors.white
  //                     : Colors.black,
  //               ),
  //             ),
  //           )),
  //     ),
  //   );
  // }
  _buildSectionListView() {
    return GetBuilder<RegisterMealsController>(
        builder: (controller) {
          return SizedBox(
            height: 44.h,
            child: ListView.separated(
              separatorBuilder: ((context, index) => SizedBox(width: 5.w)),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: RegisterMealsController.to.categories.length,
              itemBuilder: ((context, index) => InkWell(
                onTap: () {
                  setState(() {
                    RegisterMealsController.to.selectedCategoryId = RegisterMealsController.to.categories[index].id;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: RegisterMealsController.to.categories[index].id == RegisterMealsController.to.selectedCategoryId
                        ? null
                        : Border.all(width: 1, color: AppColors.tkborder),
                    borderRadius: BorderRadius.circular(10.r),
                    color: RegisterMealsController.to.categories[index].id == RegisterMealsController.to.selectedCategoryId
                        ? AppColors.maincolor
                        : Colors.transparent,
                  ),
                  child: TextCustom(
                    text: RegisterMealsController.to.categories[index].name ?? "",
                    color: RegisterMealsController.to.categories[index].id == RegisterMealsController.to.selectedCategoryId
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              )),
            ),
          );
        }
    );
  }
  Container _builldInfoContainer({required TextEditingController controller, FormFieldValidator<String>? validate}) {
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
  Widget? suffix;
  TextEditingController controller;
  FormFieldValidator<String>? validate;

  BorderTextField({
    required this.hintText,
    this.suffix,
    required  this.controller,
    this.validate,
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
      child: TextFormField(
        controller: controller,
        validator: validate,
        style: TextStyle(fontSize: 14.sp),
        decoration: InputDecoration(
          hintText: hintText,
          suffix: suffix,
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
  TextEditingController controller;
  FormFieldValidator<String>? validate;
  BorderTextFieldExtraText({
    required this.hintText,
    required this.controller,
    this.validate,
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
            child: TextFormField(
              style: TextStyle(fontSize: 14.sp),
              controller: controller,
              validator: validate,
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

class imageButton extends StatelessWidget {
  Function() onPressed;
  imageButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return GetBuilder<RegisterMealsController>(
      builder: (controller){
        return ElevatedButton(
            onPressed:  onPressed,
            style: ElevatedButton.styleFrom(
                minimumSize: Size(80.w, 85.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.r),
                ),
                side: BorderSide(color: AppColors.tkborder, width: 1),
                primary: Colors.transparent,
                elevation: 0),
            child:  Icon(
              Icons.add_photo_alternate_outlined,
              color: AppColors.tkText.withOpacity(0.5),
            ));
      },
    );
  }
}
