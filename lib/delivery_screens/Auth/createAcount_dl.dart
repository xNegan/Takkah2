import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global_widgets/ButtonApp.dart';

import '../../global_widgets/TitleBox.dart';
import '../../global_widgets/text_custom.dart';
import '../../global_widgets/text_field.dart';
import '../../provider_screens/Auth/controller/create_account_controller.dart';
import '../../provider_screens/Auth/models/nationality.dart';
import '../../uitls/app_colors.dart';

import 'Login_dl.dart';
import 'createAcount_dl.dart';

class createAcountDl extends StatefulWidget {
  @override
  _createAcountDlState createState() => _createAcountDlState();
}

class _createAcountDlState extends State<createAcountDl> {
  final TextEditingController link = TextEditingController();
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: GetBuilder<CreateAccountController>(
              init: CreateAccountController(),
              builder: (controller) {
                return SafeArea(
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFFFA9C21),
                            Color(0xFFC05501),
                          ],
                        ),
                      ),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Form(
                            key: controller.keyFormDelivery,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  "images/splachicon.png",
                                  width: 180.w,
                                  height: 180.h,
                                ),
                                Container(
                                  width: context.width,
                                  height: 600.h,
                                  margin: EdgeInsets.only(
                                      bottom: 10.h,
                                      left: 10.w,
                                      right: 10.w,
                                      top: 50.h),
                                  padding: EdgeInsets.only(
                                      top: 30.h,
                                      left: 30.w,
                                      right: 30.w,
                                      bottom: 30.h),
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  child: ListView(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextCustom(
                                        text: 'إنشاء حساب',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      SizedBox(
                                        height: 21.h,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.to(LoginDl());
                                            },
                                            child: TextCustom(
                                              text: 'تسجيل دخول!',
                                              fontSize: 12,
                                              color: AppColors.maincolor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          TextCustom(
                                            text: 'ليس لديك حساب؟',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 41.h,
                                      ),
                                      TextCustom(text: 'نوع المركبه'),
                                      Row(
                                        children: [
                                          Radio(
                                            // checkkColor: AppColors.maincolor,
                                            // shape: CircleBorder(),
                                            activeColor: AppColors.hintText,
                                            value: "car",
                                            onChanged: (String? value) {
                                              setState(() {
                                                controller.carTypeSelected =
                                                value!;
                                              });
                                            },
                                            groupValue:
                                            controller.carTypeSelected,
                                          ),
                                          TextCustom(text: 'سياره'),
                                          SizedBox(
                                            width: 50.w,
                                          ),
                                          Radio(
                                            // checkColor: AppColors.maincolor,
                                            // shape: CircleBorder(),
                                            activeColor: AppColors.hintText,
                                            value: "bus",
                                            onChanged: (String? value) {
                                              setState(() {
                                                controller.carTypeSelected =
                                                value!;
                                              });
                                            },
                                            groupValue:
                                            controller.carTypeSelected,
                                          ),
                                          TextCustom(text: 'دباب'),
                                        ],
                                      ),
                                      TextFieldCustom(
                                        controller:
                                        controller.fullNameController,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "يرجى ادخال الحقل المطلوب";
                                          }
                                          // return ''; this is causing you the error you must return null
                                          return null; // this is correct
                                        },
                                        textInputType: TextInputType.text,
                                        textHint: 'الإسم بالكامل',
                                        hintColor: AppColors.blackColor,
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child:
                                              DropdownButton<Nationality>(
                                                value:
                                                controller.nationatlitySelected,
                                                items: controller.natioliteis
                                                    .map((Nationality value) {
                                                  return DropdownMenuItem<Nationality>(
                                                    value: value,
                                                    child: Text(
                                                        value.data!.first.value ??
                                                            ""),
                                                  );
                                                }).toList(),
                                                onChanged: (Nationality? value) {
                                                  setState(() {
                                                    controller
                                                        .nationatlitySelected =
                                                    value!;
                                                  });
                                                },
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: TextFieldCustom(
                                              controller:
                                              controller.ageController,
                                              validate: (String? value) {
                                                if (value!.isEmpty) {
                                                  return "يرجى ادخال الحقل المطلوب";
                                                }
                                                // return ''; this is causing you the error you must return null
                                                return null; // this is correct
                                              },
                                              textInputType:
                                              TextInputType.number,
                                              textHint: 'العمر',
                                              hintColor: AppColors.blackColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldCustom(
                                        controller:
                                        controller.phoneNumberController,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "يرجى ادخال الحقل المطلوب";
                                          }
                                          // return ''; this is causing you the error you must return null
                                          return null; // this is correct
                                        },
                                        textInputType: TextInputType.number,
                                        textHint: 'رقم الجوال',
                                        hintColor: AppColors.blackColor,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldCustom(
                                        controller:
                                        controller.IDNumberController,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "يرجى ادخال الحقل المطلوب";
                                          }
                                          // return ''; this is causing you the error you must return null
                                          return null; // this is correct
                                        },
                                        textInputType: TextInputType.number,
                                        textHint: 'رقم الهويه',
                                        hintColor: AppColors.blackColor,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldCustom(
                                        controller: controller.emailController,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "يرجى ادخال الحقل المطلوب";
                                          }
                                          // return ''; this is causing you the error you must return null
                                          return null; // this is correct
                                        },
                                        textInputType: TextInputType.text,
                                        textHint: 'البريد الألكتروني',
                                        hintColor: AppColors.blackColor,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldCustom(
                                        controller: controller.pinController,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "يرجى ادخال الحقل المطلوب";
                                          }
                                          // return ''; this is causing you the error you must return null
                                          return null; // this is correct
                                        },
                                        textInputType: TextInputType.text,
                                        textHint: 'رانشاء رقم سري',
                                        hintColor: AppColors.blackColor,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ////////////////////////////////////////
                                      TextFieldCustom(
                                        controller:
                                        controller.personalImageController,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "يرجى ادخال الحقل المطلوب";
                                          }
                                          // return ''; this is causing you the error you must return null
                                          return null; // this is correct
                                        },
                                        onTap: () {
                                          print("object");
                                        },
                                        readOnly: true,
                                        textInputType: TextInputType.text,
                                        textHint: 'رفع صوره شخصية',
                                        hintColor: AppColors.blackColor,
                                        suffixWid: IconButton(
                                          onPressed: () =>
                                              controller.pickPersonalImage(),
                                          icon: Icon(Icons.add_a_photo),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldCustom(
                                        onTap: () {
                                          print("object");
                                        },
                                        controller:
                                        controller.idFrontImageController,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "يرجى ادخال الحقل المطلوب";
                                          }
                                          // return ''; this is causing you the error you must return null
                                          return null; // this is correct
                                        },
                                        readOnly: true,
                                        textInputType: TextInputType.text,
                                        textHint: 'صورة الهوية من الأمام',
                                        hintColor: AppColors.blackColor,
                                        suffixWid: IconButton(
                                          onPressed: () => controller.pickID(),
                                          icon: Icon(Icons.add_a_photo),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldCustom(
                                        controller:
                                        controller.drivingLicenseController,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "يرجى ادخال الحقل المطلوب";
                                          }
                                          // return ''; this is causing you the error you must return null
                                          return null; // this is correct
                                        },
                                        onTap: () {
                                          print("object");
                                        },
                                        readOnly: true,
                                        textInputType: TextInputType.text,
                                        textHint: 'اصورة رخصة القيادة',
                                        hintColor: AppColors.blackColor,
                                        suffixWid: IconButton(
                                          onPressed: () =>
                                              controller.pickDrivingLicense(),
                                          icon: Icon(Icons.add_a_photo),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldCustom(
                                        controller:
                                        controller.vehicleLicenseController,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "يرجى ادخال الحقل المطلوب";
                                          }
                                          // return ''; this is causing you the error you must return null
                                          return null; // this is correct
                                        },
                                        onTap: () {
                                          print("object");
                                        },
                                        readOnly: true,
                                        textInputType: TextInputType.text,
                                        textHint: 'صورة استماره المركبه',
                                        hintColor: AppColors.blackColor,
                                        suffixWid: IconButton(
                                          onPressed: () =>
                                              controller.pickVehicleLicense(),
                                          icon: Icon(Icons.add_a_photo),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      ButtonApp(
                                        isblack: true,
                                        onTap: () => controller
                                            .checkFormDeliveryAccount(),
                                        title: 'ارسال',
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                );
              },
            )));
  }
}
