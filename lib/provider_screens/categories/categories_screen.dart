import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global_widgets/text_custom.dart';
import '../../global_widgets/text_field.dart';
import '../../provider_screens/categories/sub_category_screen.dart';
import '../../uitls/app_colors.dart';
import '../register_screens/controller/register_info_resturent_controller.dart';
import '../register_screens/register_screen.dart';
import '../restaurant/Model/RestModel.dart';
import '../restaurant/restaurantGetx.dart';
import 'meals_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  openBottomSheetAddCategory() {

    Get.bottomSheet(
      StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
        return GetBuilder<RegisterInfoResturentController>(
            builder: (controller) {

              print(controller.days);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.h,),
                    TextFieldCustom(
                      controller: controller.categoryNameController,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return "يرجى ادخال الحقل المطلوب";
                        }
                        // return ''; this is causing you the error you must return null
                        return null; // this is correct
                      },
                      textInputType: TextInputType.text,
                      textHint: 'اسم القسم',
                      hintColor: AppColors.blackColor,
                    ),
                    SizedBox(height: 10.h,),
                    TextCustom(
                      text: 'صورة القسم',
                      fontSize: 14,
                      color: AppColors.tkText,
                    ),
                    SizedBox(height: 10.h,),

                    SizedBox(
                        width: 80.w,
                        height: 120.h,
                        child: imageButton(tag: "category" ,onPressed: ()=> controller.pickImageCategory())),
                    SizedBox(height: 60.h,),
                    ElevatedButton(
                        onPressed: () async {
                          Get.back();
                          await controller.addCategory();

                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 49.h),
                            primary: AppColors.maincolor
                        ),
                        child: TextCustom(text: "اضف قسم", color: Colors.white, fontWeight: FontWeight.w500, ))
                  ],
                ),
              );
            }
        );
      },),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );



  }
  openBottomSheetEditCategory({required String name,required String img, required String id}) {


    Get.bottomSheet(
      StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
        return GetBuilder<RegisterInfoResturentController>(
            builder: (controller) {
              controller.categoryNameController.text = name;
              print(controller.days);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.h,),
                    TextFieldCustom(
                      controller: controller.categoryNameController,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return "يرجى ادخال الحقل المطلوب";
                        }
                        // return ''; this is causing you the error you must return null
                        return null; // this is correct
                      },
                      textInputType: TextInputType.text,
                      textHint: 'اسم القسم',
                      hintColor: AppColors.blackColor,
                    ),
                    SizedBox(height: 10.h,),
                    TextCustom(
                      text: 'صورة القسم',
                      fontSize: 14,
                      color: AppColors.tkText,
                    ),
                    SizedBox(height: 10.h,),

                   img != null ? SizedBox(
                       height: 120.h,
                       child: Row(
                         children: [
                           Image.network(img),
                           SizedBox(width: 20.w,),
                           ElevatedButton(onPressed: () =>controller.pickImageCategory(),
                               style: ElevatedButton.styleFrom(
                                 primary: AppColors.maincolor
                               ),
                               child: TextCustom(text: "تعديل الصورة",color: Colors.white,)),

                         ],
                       )) : SizedBox(
                        width: 80.w,
                        height: 120.h,
                        child: imageButton(tag: "category" ,onPressed: ()=> controller.pickImageCategory())),
                    SizedBox(height: 60.h,),
                    ElevatedButton(
                        onPressed: () async {
                          Get.back();
                          await controller.editCategory(catId: int.parse(id));

                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 49.h),
                            primary: AppColors.maincolor
                        ),
                        child: TextCustom(text: "حفط التعديلات", color: Colors.white, fontWeight: FontWeight.w500, ))
                  ],
                ),
              );
            }
        );
      },),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );



  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<restaurantGetx>(
      builder: (controller)=>Scaffold(
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
        body: controller.myRestaurant?.categories==null?
        Center(child: TextCustom(text: "لا يوجد اقسام مضافة"),)
            : Column(
          children: [
            GetBuilder<restaurantGetx>(
              builder: (controller1) {
                return GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: controller1.myRestaurant?.categories?.length,
                    padding: EdgeInsetsDirectional.only(
                        start: 24.w, end: 24.w, top: 40.h, bottom: 144.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 48.w,
                        mainAxisSpacing: 20.h),
                    itemBuilder: (context, index) {
                      var catogery =controller1.myRestaurant?.categories?.elementAt(index);
                      return InkWell(
                        onTap: () => Get.to(MealsScreen(idCatogery:catogery!.id.toString() ,)),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.maincolor),
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(onPressed: ()=> openBottomSheetEditCategory(name:controller.myRestaurant!.categories![index].name!, img: controller.myRestaurant!.categories![index].image!, id: controller.myRestaurant!.categories![index].id.toString(), ), icon: Icon(Icons.edit, size: 18.h,)),
                                  IconButton(onPressed: ()=> RegisterInfoResturentController.to.deleteCategory(catId: controller.myRestaurant!.categories![index].id!), icon: Icon(Icons.delete, size: 18.h,)),
                                ],
                              ),
                              PositionedDirectional(
                                start: 0,
                                end: 0,
                              top: 40.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    SizedBox(height: 10.h,),
                                    CachedNetworkImage(
                                        width: 100.w,height: 100.h,fit: BoxFit.cover,
                                      imageUrl: catogery!.image.toString(),
                                      placeholder: (context, url) =>Image.asset('images/loading.gif'),
                                      errorWidget: (context, url, error) => Image.asset('images/loading.gif')
                                    ),
                                //    Image.network(catogery!.image.toString(),width: 100.w,height: 100.h,fit: BoxFit.cover,),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    TextCustom(
                                      text: catogery!.name.toString(),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 24.w, end: 49.w),
              child: ElevatedButton(
                onPressed: () => openBottomSheetAddCategory(),
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
      ),
    );
  }
}
