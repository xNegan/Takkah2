
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:takkah/uitls/storage_getX.dart';

import 'app_colors.dart';

const manImage = 'https://img.freepik.com/free-photo/handsome-confident-smiling-man-with-hands-crossed-chest_176420-18743.jpg?size=626&ext=jpg&ga=GA1.2.1550139938.1639094400';

 Future<void> checkApi(var response) async {
if(response.statusCode == 401) {
  await StorageGetX().logout();
  await StorageGetX().setIsActive();
 // Get.offAll(LoginScreen());
}else {
  Get.snackbar('failed'.tr, response.body['message'],
      backgroundColor: AppColors.blackColor,
      colorText: AppColors.mainYellow,
      icon: Icon(
        Icons.error,
        color: AppColors.redColor,
        size: 30.sp,
      ));
}
}
String CheckNull({required String Text}) {
  if (Text == null || Text == 'null'||Text==""||Text==" "||Text.isNull) {
    return 'NoData'.tr;
  }
  return Text;
}
int CheckNullUpdate({required int value}) {
  int reslut;
  if (value == null) {
    reslut=-1;
    print(reslut);
    return reslut;
  }
  reslut=value;
  print(reslut);
  return reslut;
}

String langText({required String ArText, required String EnText}) {
 // if(Get.locale.toString()=='ar'){
 //  // if(ArText.isNotEmpty||!ArText.isNull||ArText!='null'){
 //   if(ArText.isNotEmpty||!ArText.isNull||ArText!='null'){
 //     return ArText;
 //   }else if(EnText.isNotEmpty||EnText!=null||EnText!='null'){
 //     return EnText;
 //   }
 // }
  if(Get.locale.toString()=='ar'){
    // if(EnText.isNotEmpty||EnText!=null||EnText!='null'){
    if(ArText=='null'||ArText==''){
      if(EnText!='null'||EnText!=''){
        return CheckNull(Text: EnText) ;
      }
      else {return 'NoData'.tr;}
    }
    else return CheckNull(Text: ArText);
    // else if(ArText.isNotEmpty||ArText!=null||ArText!='null'){
    //   return ArText;
    // }
  }else if(Get.locale.toString()=='en'){
  // if(EnText.isNotEmpty||EnText!=null||EnText!='null'){
   if(EnText=='null'||EnText==''){
     if(ArText!='null'||ArText!=''){
       return CheckNull(Text: ArText);
     }else {return 'NoData'.tr;}
   }else return CheckNull(Text: EnText);
   // else if(ArText.isNotEmpty||ArText!=null||ArText!='null'){
   //   return ArText;
   // }
 }

  return 'NoData'.tr;
}

/*
pushNewScreen(
                  context,
                  screen: BookNowScreen(),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );

 */


// Fluttertoast.showToast(
// msg: 'Please try again later!',
// toastLength: Toast.LENGTH_SHORT,
// gravity: ToastGravity.CENTER,
// timeInSecForIosWeb: 1,
// backgroundColor: Colors.grey,
// textColor: Colors.white,
// fontSize: 14.0
// );

// @override
// void didChangeDependencies() {
//   super.didChangeDependencies();
//   precacheImage(AssetImage('images/atoz6.png'),context);
//   // precachePicture(
//   //   ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, 'images/whatsapp.svg'),
//   //   context,
//   // );
// }

