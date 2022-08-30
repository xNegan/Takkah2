import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

import '../../global_widgets/ButtonApp.dart';
import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';
import '../main_screen_dl.dart';
import 'Login_dl.dart';

class statusSucsessDl extends StatefulWidget {
  const statusSucsessDl({Key? key}) : super(key: key);

  @override
  State<statusSucsessDl> createState() => _statusSucsessDlState();
}

class _statusSucsessDlState extends State<statusSucsessDl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
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
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding:
                      EdgeInsets.only(bottom: 55.h, left: 20.w, right: 20.w),
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      Image.asset(
                        'images/check.png',
                        width: 100.w,
                      ),
                      SizedBox(
                        height: 48.h,
                      ),
                      Center(
                        child: TextCustom(
                          textAlign: TextAlign.center,
                          text:
                              'تمت مراجعة بياناتك بنجاح يمكنك الآن تسجيل الدخول',
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColors.fontTitleColor,
                        ),
                      ),
                      Spacer(),
                      //]jbfjhdsf
                      ButtonApp(
                        isblack: true,
                        onTap: () {
                          Get.to(MainScreenDl());
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => PlacePicker(
                          //       // apiKey:  "AIzaSyDrTiLARexSQDjbyPA1qwwDK-DCLu4l4mc",
                          //       apiKey: "AIzaSyBw24W-zvipTztLpP14gibuLXrci-8ken0",
                          //       onPlacePicked: (result) {
                          //         print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
                          //         print(result.formattedAddress);
                          //         print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
                          //         Navigator.of(context).pop();
                          //       //  Get.to(RegisterScreen());
                          //
                          //
                          //         // navigateTo(
                          //         //     context,
                          //         //     ChooseGovern(
                          //         //       passed: [
                          //         //         result.formattedAddress.toString(),
                          //         //         result.geometry.location.lat.toString(),
                          //         //         result.geometry.location.lng.toString()
                          //         //       ],
                          //         //     ));
                          //       },
                          //       initialPosition: LatLng(0, 0),
                          //       useCurrentLocation: true,
                          //       usePlaceDetailSearch: true,
                          //     ),
                          //   ),
                          // );
                        },
                        title: 'الرئيسيه',
                      )
                    ],
                  ),
                ),
              )),
        ));
  }
}
