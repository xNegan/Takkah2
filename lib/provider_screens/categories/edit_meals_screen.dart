
import '../../global_widgets/ButtonApp.dart';
import '../../global_widgets/next_button.dart';
import '../../global_widgets/text_custom.dart';
import '../../global_widgets/text_field.dart';
import '../../preferences/user_preferences.dart';
import '../../provider_screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../global_widgets/border_button.dart';
import '../../uitls/app_colors.dart';
import '../register_screens/controller/register_meals_controller.dart';
import '../restaurant/Model/Meals.dart';
import '../restaurant/Model/addtion.dart';

class EditMealsScreen extends StatefulWidget {

  Meals meals;

  // String tag;

  EditMealsScreen({required this.meals,});

  @override
  State<EditMealsScreen> createState() => _EditMealsScreenState();
}

class _EditMealsScreenState extends State<EditMealsScreen> {
  List<String> items = [
    'الدجاج',
    'الماكولات البحرية',
    'الاطباق الجانبية',
    'الحلويات',
  ];
  String selectedValue = 'الدجاج';
  bool _show = false;

  @override
  void initState() {
    // TODO: implement initState
  Get.put(RegisterMealsController());
  RegisterMealsController.to.extra.clear();
  RegisterMealsController.to.additions.clear();
  RegisterMealsController.to.drinks.clear();
  RegisterMealsController.to.flavors.clear();
  RegisterMealsController.to.sizes.clear();

  RegisterMealsController.to.mealNameController.text  = widget.meals.name ?? "";
  RegisterMealsController.to.priceMealController.text  = widget.meals.price ?? "";
  RegisterMealsController.to.descMealController.text  = widget.meals.text ?? "";
  RegisterMealsController.to.mealID = widget.meals.id;
  if(widget.meals.additions != null){
    for(int i = 0; i < widget.meals.additions!.length ; i++){
      Addition addition = Addition();
      addition.name = widget.meals.additions![i].name;
      addition.price = widget.meals.additions![i].price;
      addition.mealId = widget.meals.additions![i].mealId;
      addition.calories = widget.meals.additions![i].calories;
      addition.type = "additions";
      RegisterMealsController.to.extra.add(addition);
      RegisterMealsController.to.additions.add(addition);
      RegisterMealsController.to.extraIds.add(widget.meals.additions![i].id ?? -1);

    }
  }
  if(widget.meals.drinks != null){
    for(int i = 0; i < widget.meals.drinks!.length ; i++){
      Addition addition = Addition();

      addition.name = widget.meals.drinks![i].name;
      addition.price = widget.meals.drinks![i].price;
      addition.mealId = widget.meals.drinks![i].mealId;
      addition.calories = widget.meals.drinks![i].calories;
      addition.type = "drinks";
      RegisterMealsController.to.extra.add(addition);
      RegisterMealsController.to.drinks.add(addition);
      RegisterMealsController.to.extraIds.add(widget.meals.drinks![i].id ?? -1);

    }
  }

  if(widget.meals.flavors != null){
    for(int i = 0; i < widget.meals.flavors!.length ; i++){
      Addition addition = Addition();
      addition.name = widget.meals.flavors![i].name;
      addition.price = widget.meals.flavors![i].price;
      addition.mealId = widget.meals.flavors![i].mealId;
      addition.calories = widget.meals.flavors![i].calories;
      addition.type = "flavors";
      RegisterMealsController.to.extra.add(addition);
      RegisterMealsController.to.flavors.add(addition);
      RegisterMealsController.to.extraIds.add(widget.meals.flavors![i].id ?? -1);


    }
  }

  if(widget.meals.sizes != null){
    for(int i = 0; i < widget.meals.sizes!.length ; i++){
      Addition addition = Addition();
      addition.name = widget.meals.sizes![i].name;
      addition.price = widget.meals.sizes![i].price;
      addition.mealId = widget.meals.sizes![i].mealId;
      addition.calories = widget.meals.sizes![i].calories;
      addition.type = "sizes";
      RegisterMealsController.to.extra.add(addition);
      RegisterMealsController.to.sizes.add(addition);
      RegisterMealsController.to.extraIds.add(widget.meals.sizes![i].id ?? -1);

    }
  }

  for(int i = 0; i < RegisterMealsController.to.extra.length; i++){
    RegisterMealsController.to.extraIndexes.add(i);
  }

  print("Url:: ${widget.meals.image}");
  print("Sizes:: ${widget.meals.sizes}");
  print(RegisterMealsController.to.extra.length);
  print(RegisterMealsController.to.extraIndexes);
  print(RegisterMealsController.to.sizes.length);
  print(RegisterMealsController.to.additions.length);
  print(RegisterMealsController.to.flavors.length);
  print("IDS:: ${RegisterMealsController.to.extraIds}");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     setState(() {
       RegisterMealsController.to.selectedCategoryId = widget.meals.categoryId;
     });
     print("Cat:: ${RegisterMealsController.to.selectedCategoryId}");

     print("Lenth: ${widget.meals.id}");
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.h,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<RegisterMealsController>(

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
                    // Visibility(
                    //   visible: widget.categoryId == "",
                    //   child: Column(
                    //     children: [
                    //       TextCustom(
                    //         text: 'اختر القسم ثم اضف الاطباق',
                    //         fontSize: 14,
                    //         color: AppColors.tkText,
                    //       ),
                    //       SizedBox(height: 15.h),
                    //       _buildSectionListView(),
                    //       SizedBox(height: 40.h),
                    //     ],
                    //   ),
                    // ),

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
                   widget.meals.image  == "" ? imageButton(onPressed: () => controller.pickMealImage())
                       : Row(
                         children: [
                           Container(
                     width: 80,
                     height: 80,
                     decoration: BoxDecoration(
                           image: DecorationImage(
                             image: NetworkImage(widget.meals.image ?? ""),
                           )
                     ),
                   ),
                           ElevatedButton(onPressed: () => controller.pickMealImage(),
                             style: ElevatedButton.styleFrom(
                               primary: AppColors.maincolor
                             ),
                             child: TextCustom(text: "رفع صورة جديدة", color: Colors.white,),),

                         ],
                       ),
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
                      },
                    ),
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
                    ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: controller.flavors.length,
                        itemBuilder: (context , index){
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadiusDirectional.circular(7.r),

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextCustom(text:  controller.flavors[index].name ?? "",color: AppColors.tkTextPro,),
                            ),
                            Row(
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.delete, size: 16.w, color: AppColors.tkText,)),
                                IconButton(onPressed: (){
                                  openBottomSheet(extra: controller.flavors[index],extraId: widget.meals.flavors![index].id.toString(), index: index);
                                  setState(() {
                                    controller.section = 'المذاق المقترح';
                                  });
                                }, icon: Icon(Icons.edit, size: 16.w,color: AppColors.tkText,)),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
                    BorderButton(
                        icon: Icons.add_box_outlined,
                        text: 'اضافة',
                        onPressed:() {
                        setState(() {
                          controller.section = 'المذاق المقترح';
                        });
                        openBottomSheet(extra: null,extraId: null, index: -1);
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
                    ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: controller.sizes.length,
                        itemBuilder: (context , index){
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadiusDirectional.circular(7.r),

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextCustom(text:  controller.sizes[index].name ?? "",color: AppColors.tkTextPro,),
                                ),
                                Row(
                                  children: [
                                    IconButton(onPressed: (){}, icon: Icon(Icons.delete, size: 16.w, color: AppColors.tkText,)),
                                    IconButton(onPressed: (){
                                      openBottomSheet(extra: controller.sizes[index],extraId: widget.meals.sizes![index].id.toString(), index: index);
                                      setState(() {
                                        controller.section = 'الحجم المقترح';
                                      });
                                    }, icon: Icon(Icons.edit, size: 16.w,color: AppColors.tkText,)),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                    SizedBox(height: 8.h),

                    BorderButton(
                        icon: Icons.add_box_outlined,
                        text: 'اضافة',
                        onPressed: () {
                          setState(() {
                            controller.section = 'الحجم المقترح';
                          });
                          openBottomSheet(extra: null, extraId: null, index: -1);

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
                    ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: controller.drinks.length,
                        itemBuilder: (context , index){
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadiusDirectional.circular(7.r),

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextCustom(text:  controller.drinks[index].name ?? "",color: AppColors.tkTextPro,),
                                ),
                                Row(
                                  children: [
                                    IconButton(onPressed: (){}, icon: Icon(Icons.delete, size: 16.w, color: AppColors.tkText,)),
                                    IconButton(onPressed: (){
                                      openBottomSheet(extra: controller.drinks[index],extraId :widget.meals.drinks![index].id.toString(), index: index);
                                      setState(() {
                                        controller.section = 'المشروبات المقترحة';
                                      });
                                    }, icon: Icon(Icons.edit, size: 16.w,color: AppColors.tkText,)),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                    SizedBox(height: 8.h,),
                    BorderButton(
                        icon: Icons.add_box_outlined,
                        text: 'اضافة',
                        onPressed: () {
                          setState(() {
                            controller.section = 'المشروبات المقترحة';
                          });
                          openBottomSheet(extra: null,extraId: null, index: -1);

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
                    ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: controller.additions.length,
                        itemBuilder: (context , index){
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadiusDirectional.circular(7.r),

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextCustom(text:  controller.additions[index].name ?? "",color: AppColors.tkTextPro,),
                                ),
                                Row(
                                  children: [
                                    IconButton(onPressed: (){}, icon: Icon(Icons.delete, size: 16.w, color: AppColors.tkText,)),
                                    IconButton(onPressed: (){
                                      openBottomSheet(extra: controller.additions[index], extraId: widget.meals.additions![index].id.toString(), index: index);
                                      setState(() {
                                        controller.section = 'الاضافات المقترحة';
                                      });
                                    }, icon: Icon(Icons.edit, size: 16.w,color: AppColors.tkText,)),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                    SizedBox(height: 8.h),
                    BorderButton(
                        icon: Icons.add_box_outlined,
                        text: 'اضافة',
                        onPressed: () {
                          setState(() {
                            controller.section = 'الاضافات المقترحة';
                          });
                          openBottomSheet(extra: null, extraId: null, index: -1);

                        }),
                    Divider(
                      height: 50.h,
                      thickness: 2,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    BorderButton(
                        borderColor: AppColors.maincolor,
                        icon: Icons.add_box_outlined,
                        text: 'تعديل الوجبة',
                        onPressed: () => controller.editMelas()),
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

  openBottomSheet({required Addition? extra,  String? extraId, required int index}) {
    print(UserPreferences().getTokenStore());
    print("Index:: $index");
    print("Index:: $extraId");
    TextEditingController name = TextEditingController();
    TextEditingController price = TextEditingController();
    TextEditingController cal = TextEditingController();
    if(extra != null){
      name.text = extra.name ?? "";
      price.text = extra.price ?? "";
      cal.text = extra.calories ?? "";
    }

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
                    if(extraId != null){
                      RegisterMealsController.to.editAddition(name: name.text, price: price.text, calories: cal.text, extraId: extraId,index: index);
                    }else{
                      RegisterMealsController.to.createAddition(name: name.text, price: price.text, calories: cal.text,);

                    }
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
      child: TextFormField(
        controller: controller,
        validator: validate,
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
          suffix: suffix,
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
              controller: controller,
              validator: validate,
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




