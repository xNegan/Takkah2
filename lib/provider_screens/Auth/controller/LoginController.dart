import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../delivery_screens/main_screen_dl.dart';
import '../../../global_getX/api_getX.dart';
import '../../../global_widgets/text_custom.dart';
import '../../../preferences/user_preferences.dart';
import '../../../uitls/api.dart';
import '../../../uitls/storage_getX.dart';
import '../../main_screen.dart';
import '../models/user.dart';

class LoginGetX extends GetxController with Api {
  static LoginGetX get to => Get.find();

/////////////////////////////////////////////////////////
  ///Login
/////////////////////////////////////////////////////////
  GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController mobileRegisterController =
      TextEditingController();
  final TextEditingController nameRegisterController = TextEditingController();
  final TextEditingController emailRegisterController = TextEditingController();

  String? validateNum(String? num) {
    if (num == null || num.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    // else if (!GetUtils.isUsername(name)) {
    //   return 'أدخل اسم المستخدم بشكل صحيح';
    // }
    else {
      // FocusScope.of(context).requestFocus(passwordFocusNode);
      return null;
    }
  }

  Future<void> login({required String Type}) async {
    try {
      ApiGetX.to.onLoading(isShow: true);
      var url = Uri.parse(loginApi);
      var response = await http.post(
        url,
        body: {
          'mobile': '+972' + mobileController.text,
          'type': Type,
          //'IMEI': '123456789',
          //'databaseId': '1',
        },
      );
      var responseData = jsonDecode(response.body)['data'];
      var responseerror = jsonDecode(response.body)['error'];
      var responsestatus = jsonDecode(response.body)['status'];
      print(response.body);
      User user  = User.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      print(user.data);
      if (responsestatus == 200) {
        if(user != null){
          UserPreferences().saveStore(user);
          print("ID Store:: ${user.data!.restaurant_id}");
          print("ID:: ${user.data!.token}");
        }
        ApiGetX.to.onLoading(isShow: false);

        await StorageGetX.box.write('image', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhhBSGKxGPiUkd32iOTsfaGW43yuJaz1yQpA&usqp=CAU');
        await StorageGetX.setTokens(token: responseData['token'],);
        await StorageGetX.setId(id: responseData['id'].toString(),);
       // await StorageGetX().setLogo(Logo: responseData['logo'].toString(),);
        await StorageGetX.setName(name: responseData['name'].toString(),);
        await StorageGetX.setEmail(Email: responseData['email'].toString(),);
        await StorageGetX.setRestaurantsId(restaurants: responseData['restaurant_id'].toString(),);
        await StorageGetX.setIsLogin();
        print(response.statusCode);
        update();
        if (responseData['type'] == 'RESTAURANT') {
          Get.off(MainScreen());
        }
        if (responseData['type'] == 'DRIVER') {
          Get.off(MainScreenDl());
        }

        //Get.offAll(MainScreen());

        // return User.fromJson(userJsonData);
      } else {
        ApiGetX.to.onLoading(isShow: false);
        //checkApi(response);
        ApiGetX.to.showDialogFailed(Title: responseerror['message'].toString());
        // EasyLoading.dismiss();

        update();
        return null;
      }
    } catch (error) {
      // EasyLoading.dismiss();
      displayDialog(error);
      return null;
    }
  }

  ///////////////////////////////////////////////////////

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
}
