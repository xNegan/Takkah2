import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takkah/global_widgets/next_button.dart';
import 'package:takkah/global_widgets/text_custom.dart';
import 'package:takkah/provider_screens/register_screens/register_screens_meals.dart';
import 'package:takkah/uitls/app_colors.dart';

import '../../global_widgets/ButtonApp.dart';
import '../../global_widgets/TitleBox.dart';
import '../../global_widgets/border_button.dart';
import '../../global_widgets/text_field.dart';
import '../../preferences/user_preferences.dart';
import 'controller/register_info_resturent_controller.dart';
import 'model/days.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // List<String> items = [
  //   'مأكولات سعودية',
  //   'مأكولات شامية',
  //   'مأكولات مصرية',
  //   'مأكولات بحرية',
  //   'مأكولات اسيوية',
  // ];
  // String? selectedItem = 'مأكولات سعودية';
  String tag = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, (){
      Get.put(RegisterInfoResturentController());
      RegisterInfoResturentController.to.selectedStartDay = RegisterInfoResturentController.to.days.first;
      RegisterInfoResturentController.to.selectedEndDay = RegisterInfoResturentController.to.days.first;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.h,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<RegisterInfoResturentController>(
        builder: (controller){
          print(controller.endTime);
          return  Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w),
            child: SingleChildScrollView(
              reverse: true,
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
                  // TextCustom(
                  //   text: 'التصنيف',
                  //   fontSize: 14,
                  //   color: AppColors.tkText,
                  // ),
                  // SizedBox(height: 15.h),
                  // _builddropDownMenu(),
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
                      onPressed: () {
                        setState(() {
                          openBottomSheetAddBranch();

                        });
                      },
                      icon: Icons.add_location_outlined,
                      text: 'اضف فرع'),
                  // CreateBranch(),
                  // buildBranchInfo(),
                  // ListView.builder(
                  //     shrinkWrap: true,
                  //     physics: ScrollPhysics(),
                  //     itemCount: addBranch.length,
                  //     itemBuilder: (context, index){
                  //       return addBranch[index];
                  //     }),

                  SizedBox(height: 10.h,),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: controller.branchesNames.length,
                      itemBuilder: (context , index){
                        return Container(
                          width: double.infinity,
                          height: 50.h,
                          child: TextCustom(text: controller.branchesNames[index],),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(5),
                              border: Border.all(
                                  color: AppColors.tkText
                              )
                          ),
                        );
                      }),

                  SizedBox(height: 15.h),
                  TextCustom(
                    text: 'صور المتجر',
                    fontSize: 14,
                    color: AppColors.tkText,
                  ),
                  SizedBox(height: 16.h),
                  imageButton( tag: "store" ,onPressed: () => controller.pickImageStore()),
                  SizedBox(height: 16.h),
                  TextCustom(
                    text: 'المنيو المصور (اختياري)',
                    fontSize: 14,
                    color: AppColors.tkText,
                  ),
                  SizedBox(height: 16.h),
                  imageButton( tag: "menu",onPressed: () => controller.pickImageMenu()),
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
                        openBottomSheetAddCategory();
                      }),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: controller.categoriesNames.length,
                      itemBuilder: (context , index){
                        return Container(
                          width: double.infinity,
                          height: 50.h,
                          child: TextCustom(text: controller.categoriesNames[index],),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(5),
                              border: Border.all(
                                  color: AppColors.tkText
                              )
                          ),
                        );
                      }),

                  SizedBox(height: 45.h),
                  NextButton(
                      text: 'التالي',
                      onPressed: () {
                        RegisterInfoResturentController.to.addBioToStore();
                        // Get.to(RegisterScreenMeals(categoryId: "", tag: "from zero",));

                      }),
                  SizedBox(height: 15.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  openBottomSheetAddCategory() {

    print(UserPreferences().store_id);
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
  openBottomSheetAddBranch() {
    TimeOfDay pickerStartTime = TimeOfDay(hour: 11, minute: 00);
    TimeOfDay pickerEndTime = TimeOfDay(hour: 8, minute: 00);

    // String startTime = "${pickerStartTime!.hour}" + ":" +"${pickerStartTime!.minute}";
    // String endTime = "${pickerEndTime!.hour}" + ":" +"${pickerEndTime!.minute}";
    String _currentSelection = "Wednesday";

    Get.bottomSheet(
      StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
        return GetX<RegisterInfoResturentController>(
            builder: (controller) {

              controller.startTime = "${pickerStartTime!.hour}" + ":" +"${pickerStartTime!.minute }";
              controller.endTime = "${pickerEndTime!.hour}" + ":" +"${pickerEndTime!.minute }";

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.h,),
                    TextFieldCustom(
                      controller: controller.nameController,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return "يرجى ادخال الحقل المطلوب";
                        }
                        // return ''; this is causing you the error you must return null
                        return null; // this is correct
                      },
                      textInputType: TextInputType.text,
                      textHint: 'اسم الفرع',
                      hintColor: AppColors.blackColor,
                    ),
                    SizedBox(height: 10.h,),

                    TextCustom(text: "الموقع"),
                    SizedBox(height: 10.h,),
                    Container(
                      width: double.infinity,
                      height: 49.h,
                      padding: EdgeInsetsDirectional.only(
                          start: 10.w,
                          end: 10.w
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextCustom(text: controller.address.value.isEmpty ? "حدد موقع الفرع على الخريطة" : controller.address.value),
                          IconButton(onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlacePicker(
                                  // apiKey:  "AIzaSyDrTiLARexSQDjbyPA1qwwDK-DCLu4l4mc",
                                  apiKey:
                                  "AIzaSyBw24W-zvipTztLpP14gibuLXrci-8ken0",
                                  onPlacePicked: (result) async{
                                    print(
                                        "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
                                    print(result.formattedAddress);
                                    print(
                                        "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
                                    // Navigator.of(context).pop();
                                    // Get.to(RegisterScreen());

                                    print("we are here::");
                                    List<Location> locations = await locationFromAddress(result.formattedAddress!);
                                    setState((){
                                      controller.address.value = result.formattedAddress!;
                                      controller.lat.value = locations.first.latitude;
                                      controller.lng.value = locations.first.longitude;
                                    });

                                    Get.back();
                                  },
                                  initialPosition: LatLng(0, 0),
                                  useCurrentLocation: true,
                                  usePlaceDetailSearch: true,
                                ),
                              ),
                            );
                          }, icon: Icon(Icons.location_pin))
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black
                          )
                      ),
                    ),
                    SizedBox(height: 10.h,),

                    TextCustom(text: "مواعيد العمل"),
                    SizedBox(height: 10.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustom(text: "الايام:"),
                        TextCustom(text: "من"),
                        Container(
                          width: 100.w,

                          height: 38.h,
                          decoration: BoxDecoration(
                              border: Border.all()
                          ),
                          child: GetBuilder<RegisterInfoResturentController>(
                              builder: (reg) {
                                return DropdownButton<Days>(
                                  // Initial Value
                                  value: reg.selectedStartDay,
                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  // Array list of items
                                  items: reg.days.map((Days day) {
                                    return DropdownMenuItem(
                                      value: day,
                                      child: Text(day.value ?? ""),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (Days? newValue) {
                                    setState(() {
                                      reg.selectStartDay(newValue!);
                                      print(reg.selectedStartDay.value);
                                    });
                                    // branch.startDay = startDay;
                                    // controller.branches.elementAt(0).startDay = startDay;

                                    // reg.startDay = startDay;
                                    // print(startDay);
                                    // print("From Controller:: ${reg.startDay}");
                                  },
                                );
                              }
                          ),
                        ),
                        TextCustom(text: "الى"),
                        Container(
                          width: 100.w,

                          height: 38.h,
                          decoration: BoxDecoration(
                              border: Border.all()
                          ),
                          child: GetBuilder<RegisterInfoResturentController>(
                              builder: (cont) {
                                return DropdownButton<Days>(
                                  // Initial Value
                                  value: cont.selectedEndDay,
                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  // Array list of items
                                  items: cont.days.map((Days day) {
                                    return DropdownMenuItem(
                                      value: day,
                                      child: Text(day.value ?? ""),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (Days? newValue) {
                                    setState(() {
                                      cont.selectEndDay(newValue!);
                                      // print(reg.selectedStartDay.value);
                                    });
                                  },
                                );
                              }
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 10.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustom(text: "الوقت:"),
                        TextCustom(text: "من"),
                        InkWell(
                          onTap: () async{
                            TimeOfDay? newTimeStart  =  await  showTimePicker(context: context,
                                initialTime: pickerStartTime);
                            setState(() {
                              pickerStartTime =  newTimeStart!;
                              controller.startTime = "${newTimeStart!.hour}" + ":" +"${newTimeStart!.minute }";
                              // controller.startTime = startTime;
                            });


                            // RegisterInfoResturentController.to.branches.insert(0, branch);

                          },
                          child: Container(
                            width: 100.w,
                            height: 38.h,
                            decoration: BoxDecoration(
                                border: Border.all()
                            ),
                            alignment: Alignment.center,
                            child: TextCustom(text: controller.startTime.isEmpty ? "10:00 am": "${controller.startTime} am",),
                          ),
                        ),
                        TextCustom(text: "الى"),
                        InkWell(
                          onTap: () async{
                            TimeOfDay? newTimeStart  =  await  showTimePicker(context: context,
                                initialTime: pickerEndTime);
                            setState(() {
                              pickerEndTime =  newTimeStart!;
                              controller.endTime = "${newTimeStart!.hour}" + ":" +"${newTimeStart!.minute}";
                              // endTime = branch.endTime!;


                            });

                          },
                          child: Container(
                              width: 100.w,

                              height: 38.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(),

                              ),
                              child:TextCustom(text: controller.endTime.isEmpty ? "10:00 pm": "${controller.endTime} pm",)
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 60.h,),
                    ElevatedButton(
                        onPressed: () async {
                          Get.back();
                          await controller.addBranch();
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 49.h),
                            primary: AppColors.maincolor
                        ),
                        child: TextCustom(text: "اضف فرع", color: Colors.white, fontWeight: FontWeight.w500, ))
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

  // Widget _builddropDownMenu() {
  //   return Container(
  //     height: 53.h,
  //     padding: EdgeInsets.symmetric(horizontal: 10.w),
  //     width: double.infinity,
  //     alignment: Alignment.centerRight,
  //     // color: Colors.amber,
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(7.r),
  //         border: Border.all(width: 1, color: AppColors.tkborder)),
  //     child: DropdownButtonFormField(
  //         // isExpanded: true,
  //         //isDense: true,
  //         decoration: InputDecoration(
  //           isCollapsed: true,
  //           contentPadding: EdgeInsets.zero,
  //           enabledBorder: InputBorder.none,
  //           focusedBorder: InputBorder.none,
  //           // enabledBorder: border,
  //           // focusedBorder: border,
  //         ),
  //         value: selectedItem,
  //         items: items
  //             .map((e) => DropdownMenuItem<String>(
  //                   value: e,
  //                   child: Text(e, style: TextStyle(fontSize: 10)),
  //                 ))
  //             .toList(),
  //         onChanged: (item) {
  //           setState(() {
  //             selectedItem = item.toString();
  //           });
  //         }),
  //   );
  // }
}

class imageButton extends StatelessWidget {
  Function() onPressed;
  String tag;
  imageButton({
    required this.onPressed,
    required this.tag,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    XFile? file;
    switch(tag){
      case "menu":
        file = RegisterInfoResturentController.to.menuImageFile;
        break;
      case "store":
        file = RegisterInfoResturentController.to.storeImageFile;
        break;
      case "category":
        file = RegisterInfoResturentController.to.categoryImageFile;
    }
    return GetBuilder<RegisterInfoResturentController>(
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
            child: file != null ? Stack(
              fit: tag == "category" ? StackFit.expand : StackFit.loose,
              children: [
                Image.file(File(file.path),fit: BoxFit.cover,),
                Row(
                  children: [
                    ElevatedButton(onPressed: onPressed,
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.maincolor,
                        ),
                        child: TextCustom(text: "تحميل صورة جديدة", color: Colors.white,)),
                    SizedBox(width: 10.w,),
                    // Visibility(
                    //   visible: tag != "category",
                    //   child: ElevatedButton(onPressed:(){
                    //     tag == "store" ? controller.addImageStore() : controller.addImageMenu();
                    //   },
                    //       style: ElevatedButton.styleFrom(
                    //         primary: Colors.white
                    //       ),
                    //       child: TextCustom(text: "رفع", color: AppColors.maincolor,)),
                    // ),
                  ],
                ),
              ],
            ) :  Icon(
              Icons.add_photo_alternate_outlined,
              color: AppColors.tkText.withOpacity(0.5),
            ));
      },
    );
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