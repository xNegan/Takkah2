import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../global_widgets/ButtonApp.dart';
import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';
import 'statusSucsess_dl.dart';

class StatusAcountDl extends StatefulWidget {
  const StatusAcountDl({Key? key}) : super(key: key);

  @override
  State<StatusAcountDl> createState() => _StatusAcountDlState();
}

class _StatusAcountDlState extends State<StatusAcountDl> {
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
                        'images/file.png',
                        width: 100.w,
                      ),
                      SizedBox(
                        height: 48.h,
                      ),
                      TextCustom(
                        textAlign: TextAlign.center,
                        text:
                            'تم إرسال طلبك بنجاح سيتم مراجعة بياناتك وتفعيل حسابك بأقرب وقت من فضلك انتظر مراجعة بياناتك وتأكيد تفعيل الحساب',
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: AppColors.fontTitleColor,
                      ),
                      Spacer(),
                      ButtonApp(
                        isblack: true,
                        onTap: () {
                          Get.to(statusSucsessDl());
                        },
                        title: 'خروج',
                      )
                    ],
                  ),
                ),
              )),
        ));
  }
}
