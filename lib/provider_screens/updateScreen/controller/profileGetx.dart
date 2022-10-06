import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../global_getX/api_getX.dart';
import '../../../uitls/api.dart';
import 'package:http/http.dart' as http;
import '../../../uitls/storage_getX.dart';
import 'package:takkah/provider_screens/restaurant/restaurantGetx.dart';
class ProfileGetx extends GetxController with Api {

  static ProfileGetx get to => Get.find();

  final ImagePicker _pickerLogo = ImagePicker();
  XFile? logo;
  String? pathLogo;
  TextEditingController nameRes =TextEditingController();
  TextEditingController EmailRes =TextEditingController();
  void fillData(){
    if(StorageGetX().Name!=null&&StorageGetX().Email!=null){
      nameRes.text=StorageGetX().Name.toString();
      EmailRes.text=StorageGetX().Email.toString();
    }

  }
  pickLogo() async{
    final image = await _pickerLogo.pickImage(source: ImageSource.gallery);
    if(image != null){
      logo = image;
      pathLogo = image.path;

      update();
    }
  }
  Future<bool> updateProfile() async {
    try{
    print(StorageGetX.token);
    print(StorageGetX.getToken());
    ApiGetX.to.onLoading(isShow: true);
    ///MultiPart request
    var request = http.MultipartRequest('POST', Uri.parse(restaurantUpdateProfile),);
    Map<String, String> headers = {
      //'Authorization': '282|LnKyjXZPntbJWON2dPDR60M0bfXMHd6SmQZjbFow',
      'Authorization': StorageGetX.token,
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Accept': '*/*',
    };

    request.headers.addAll(headers);

    request.fields.addAll({"name" : jsonEncode(nameRes.text)});
    request.fields.addAll({"email" : jsonEncode(EmailRes.text)});
    if( logo!=null){
      request.files.add(await http.MultipartFile.fromPath('logo',
      logo!.path,
    ));}


    var res = await request.send();
    final respStr = await res.stream.bytesToString();

    if(res.statusCode == 200){
      ApiGetX.to.showDialogScsess(Title: 'تم بنجاح');
      await restaurantGetx.to.getRestaurantById(id: StorageGetX.restaurants/* '1'*/);
      ApiGetX.to.onLoading(isShow: false);
      Get.back();
      print(res);
      print(res.statusCode);
      final respStr = await res.stream.bytesToString();
     // Get.to(RegisterScreenMeals(categoryId: "", tag: ""));

      return true;
    }else{
      ApiGetX.to.onLoading(isShow: false);
      ApiGetX.to.showDialogFailed(Title: jsonDecode(respStr)['error']['message']);

      print(res);
      print(res.statusCode);
      print(jsonDecode(respStr));
      print(jsonDecode(respStr)['error']['message']);
      // Get.showSnackbar(GetSnackBar(
      //   title: "خطأ في ادخال البيانات",
      //   message: "خطأ في ادخال البيانات",
      //   backgroundColor: Colors.red,
      // ));

      return false;
    }

    } catch (error) {
      // EasyLoading.dismiss();
      ApiGetX.to.onLoading(isShow: false);
      print(error);
      //ApiGetX.to.showDialogFailed(Title: error.toString());
      return false;
    }
  }

  Future<void> addBranch() async {
    try {
      print(StorageGetX.id);
      ApiGetX.to.onLoading(isShow: true);
      var url = Uri.parse(restaurantUpdateProfile);
      var response = await http.post(
        url,

        headers: {
          'Authorization': StorageGetX.token,
          'Accept-Encoding': 'gzip, deflate, br',
          'Connection': 'keep-alive',
          'Accept': '*/*',
        },
        body: {
          'name': 'kjfjk',
          'email': 'mafnannah3@gmail.com',

        },

      );
      var responseData = jsonDecode(response.body)['data'];
      var responseerror = jsonDecode(response.body)['error'];
      var responsestatus = jsonDecode(response.body)['status'];
      print(response.body);
      print(response.statusCode);
      if (responsestatus == 200) {
        ApiGetX.to.onLoading(isShow: false);
        print(responseData['data'],);
        Get.back();
        ApiGetX.to.showDialogScsess(Title: 'تم الاضافة بنجاح');
      } else {
        ApiGetX.to.onLoading(isShow: false);
        //checkApi(response);
        ApiGetX.to.showDialogFailed(Title: responseerror['message'].toString());
        // EasyLoading.dismiss();

        update();
        return null;
      }
    } catch (e) {
      // EasyLoading.dismiss();
      // displayDialog(error);
      print(e);
      print(e);
      return null;
    }
  }

}