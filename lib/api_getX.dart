import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../global_widgets/loading_data.dart';
import '../global_widgets/text_custom.dart';
import '../uitls/api.dart';
import '../uitls/app_colors.dart';

class ApiGetX extends GetxController with Api {
  static ApiGetX get to => Get.find();
  GlobalKey<FormState> formAddClintKey = GlobalKey<FormState>();

  int indexSelected = -1;

  setIndex({required int index}) async {
    indexSelected = index;
    update();
  }
  Future<bool> showWarning() async {
    final shouldPop = await Get.defaultDialog(
      backgroundColor: AppColors.blackColor,
      contentPadding: EdgeInsets.all(16.sp),
      titlePadding: EdgeInsets.all(16.sp),
      title: 'confirmation'.tr,
      titleStyle: TextStyle(
        fontSize: 16.sp,
        color: AppColors.mainYellow
      ),
      content: TextCustom(text: 'confirmation logout'.tr, color: AppColors.mainYellow),
      actions: [
        TextButton(
          child: TextCustom(
            text: 'cancel'.tr,
            fontWeight: FontWeight.w600,
              color: AppColors.mainYellow
          ),
          onPressed: () {
            Get.back();
            return Get.back();
          },
        ),
        TextButton(
          child: TextCustom(
            text: 'conforim'.tr,
            fontWeight: FontWeight.w600,
              color: AppColors.mainYellow
          ),
          onPressed: () {
            return Get.back(result: true);
          },
        ),
      ],
    );
    return shouldPop ?? false;
  }
////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////
  String? validateNotNull(String? text) {
    if (text == null || text.isEmpty || text == -1 || text == 'NoData'.tr) {
      return 'هذا الحقل مطلوب';
    }
    // FocusScope.of(context).unfocus();
    return null;
  }


  void showDialogScsess({required String Title}) {
    if (Platform.isAndroid) {
      Get.dialog(
        AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: new BoxDecoration(
                    //  color: Colors.green,
                    borderRadius: new BorderRadius.all(Radius.circular(50))),
                child: Icon(
                  Icons.done,
                  size: 80,
                  color: AppColors.green,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextCustom(
                text: Title,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                // color: AppColors.mainYellow,
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
        ),
      );
    } else {
      Get.dialog(CupertinoAlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: new BoxDecoration(
                  //  color: Colors.green,
                  borderRadius: new BorderRadius.all(Radius.circular(50))),
              child: Icon(
                Icons.done,
                size: 80,
                color: AppColors.green,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            TextCustom(
              text: Title,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              // color: AppColors.mainYellow,
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
        // actions: [
        //   TextButton(onPressed: () {
        //     Get.back();
        //   }, child: TextCustom(text: 'Ok',))
        // ]
      ));
    }
  }

  void showDialogFailed({required String Title}) {
    if (Platform.isAndroid) {
      Get.dialog(
        AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: new BoxDecoration(
                    //  color: Colors.green,
                    borderRadius: new BorderRadius.all(Radius.circular(50))),
                child: Icon(
                  Icons.clear,
                  size: 80,
                  color: AppColors.redColor,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextCustom(
                text: Title,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                // color: AppColors.mainYellow,
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
        ),
      );
    } else {
      Get.dialog(CupertinoAlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: new BoxDecoration(
                  //  color: Colors.green,
                  borderRadius: new BorderRadius.all(Radius.circular(50))),
              child: Icon(
                Icons.clear,
                size: 80,
                color: AppColors.redColor,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            TextCustom(
              text: Title,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              // color: AppColors.mainYellow,
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
        // actions: [
        //   TextButton(onPressed: () {
        //     Get.back();
        //   }, child: TextCustom(text: 'Ok',))
        // ]
      ));
    }
  }

  void showDialogConform(
      {required String Title, Function()? conform, Function()? cancel}) {
    if (Platform.isAndroid) {
      Get.dialog(
        AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: new BoxDecoration(
                    //  color: Colors.green,
                    borderRadius: new BorderRadius.all(Radius.circular(50))),
                child:
                    //TextCustom(text: "؟",fontSize: 100,)
                    Icon(
                  Icons.warning_amber_rounded,
                  size: 80,
                  color: AppColors.mainYellow,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              TextCustom(
                text: Title,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                // color: AppColors.mainYellow,
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
                child: Row(
                  children: [
                    InkWell(
                      onTap: conform,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: new BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10))),
                        child: TextCustom(
                          text: "conforim".tr,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: cancel,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: new BoxDecoration(
                            color: AppColors.redColor,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10))),
                        child: TextCustom(
                          text: "cancel".tr,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
        ),
      );
    } else {
      Get.dialog(CupertinoAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: new BoxDecoration(
                    //  color: Colors.green,
                    borderRadius: new BorderRadius.all(Radius.circular(50))),
                child: Icon(
                  Icons.clear,
                  size: 80,
                  color: AppColors.redColor,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextCustom(
                text: Title,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                // color: AppColors.mainYellow,
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: TextCustom(
                  text: 'Ok',
                  color: AppColors.redColor,
                ))
          ]));
    }
  }

  void displayDialog(Object error) {
    if (Platform.isAndroid) {
      Get.dialog(
        AlertDialog(
          content: TextCustom(
            text: error.toString(),
            fontSize: 14.sp,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: TextCustom(
                  text: 'Ok',
                ))
          ],
        ),
      );
    } else {
      Get.dialog(CupertinoAlertDialog(
        content: TextCustom(
          text: error.toString(),
          fontSize: 14.sp,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: TextCustom(
                text: 'Ok',
              ))
        ],
      ));
    }
  }

  void onLoading({bool isShow = false}) {
    if (!isShow) {
      Get.back();
      return;
    }
    Get.dialog(Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingData(),
        ],
      ),
    ));
  }

///////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////


  ////////////////////////////////add clint///////////////////////////////////////////


}
