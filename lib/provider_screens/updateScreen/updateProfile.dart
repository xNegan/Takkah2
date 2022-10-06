import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:takkah/uitls/app_colors.dart';
import 'package:takkah/provider_screens/restaurant/restaurantGetx.dart';
import 'package:takkah/uitls/storage_getX.dart';
import '../../global_widgets/ButtonApp.dart';
import '../../global_widgets/text_field.dart';
import 'controller/profileGetx.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}
class _UpdateProfileState extends State<UpdateProfile> {
  @override
  void initState() {
    // TODO: implement initState
    ProfileGetx.to.fillData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileGetx>(
      builder: (controller)=>Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.drInActiveBnbIcon,
                ))),
        body: Padding(
          padding: EdgeInsetsDirectional.only(
              bottom: 60.h, top: 20.h, start: 35.w, end: 35.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Center(
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      width: 144.w,
                      height: 144.h,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Material(
                          elevation: 10,
                          shape: CircleBorder(),
                          child:controller.logo==null?
                          Image.network(
                            restaurantGetx.to.myRestaurant!.logo.toString(),
                            //'https://www.fekera.com/wp-content/uploads/2021/04/1261021200px-kfc_logo.svg_.png',
                            fit: BoxFit.contain,
                          ):Image(image: FileImage(File(controller.pathLogo.toString())))
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 144.w,
                      height: 144.h,
                      decoration: BoxDecoration(
                          color: Colors.black.withAlpha(130),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.h),
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: InkWell(
                          onTap: () {
                            controller.pickLogo();
                          },
                          child: Icon(
                            Icons.add_box_outlined,
                            color: AppColors.whiteColor,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 70.h,
              ),
              TextFieldCustom(
                controller: controller.nameRes,
                textInputType: TextInputType.text,
                textHint: StorageGetX().Name.toString(),
                hintColor: AppColors.blackColor,
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFieldCustom(
                controller: controller.EmailRes,
                textInputType: TextInputType.text,
                textHint: StorageGetX().Email.toString(),
                hintColor: AppColors.blackColor,
              ),
              Spacer(),
              ButtonApp(
                onTap: () {
                 // print(controller.logo!.path);
                  controller.updateProfile();
                  // Get.back();
                },
                title: 'حفظ',
              )
            ],
          ),
        ),
      ),
    );
  }
}
