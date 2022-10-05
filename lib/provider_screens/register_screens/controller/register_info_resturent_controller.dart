import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takkah/provider_screens/restaurant/restaurantGetx.dart';

import '../../../api_settings.dart';
import '../../../preferences/user_preferences.dart';
import 'package:http/http.dart' as http;

import '../model/add_branch.dart';
import '../model/add_category.dart';
import '../model/days.dart';
import '../register_screens_meals.dart';


class RegisterInfoResturentController extends GetxController{
  static RegisterInfoResturentController get to => Get.find();

  TextEditingController nameController = TextEditingController();
  TextEditingController categoryNameController = TextEditingController();
  XFile? categoryImageFile, menuImageFile, storeImageFile;
  ImagePicker pickerCategory = ImagePicker();
  ImagePicker pickerStore = ImagePicker();
  ImagePicker pickerMenu = ImagePicker();
  List<AddBranch> branches = [];

  List<String> branchesNames = [];
  List<String> categoriesNames = [];
  List<Days> days = [];
  List<int> indexesBranches = [];

  TextEditingController? bioController;

  int index = 0;

  String startTime = '';
  String endTime = '';

 late Days selectedStartDay;
 late Days selectedEndDay;
 RxString address = "".obs;
 RxDouble lat = 0.0.obs;
  RxDouble lng = 0.0.obs;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    bioController = TextEditingController();
    Future.delayed(Duration.zero, () async{
    await  getDays();
    selectedStartDay = days.first;
    selectedEndDay = days.last;
    });


  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    bioController!.dispose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bioController!.dispose();
  }


  Future<bool> addBioToStore() async{

    print( UserPreferences().getTokenStore());
    print("From update");
    var url = Uri.parse(ApiSetting.addBioToStore);
    var response = await http.post(url, body: {
      "bio": bioController!.text,
    },
        headers: {
          "Authorization" : UserPreferences().getTokenStore(),
        }

    );
    print("Store Token::: ${UserPreferences().getTokenStore()}");
    print(response.statusCode);
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {

      addImageStore();
      return true;
    }
    return false;
  }
  Future<List<Days>> getDaysFromApi() async{
    var url = Uri.parse(ApiSetting.baseUrl + "constants?key=DAY");
    var response = await http.get(url,);
    print(response.statusCode);
    var jsonResponse  = jsonDecode(response.body);
    print(jsonResponse);
    if (response.statusCode == 200) {
      var jsonResponse  = jsonDecode(response.body)['data'] as List;
      print(response.statusCode);
      print(jsonResponse.runtimeType);
      print(jsonResponse);
     var list = jsonResponse.map((e) =>Days.fromJson(e)).toList();

      return list;
    }else{

      return [];
    }
  }

   getDays() async {
    days = await getDaysFromApi();
    // days.add(day!);
    update();
  }
  selectStartDay(Days start){
    selectedStartDay = start;
    update();
  }
  selectEndDay(Days end){
    selectedEndDay = end;
    update();
  }

 Future<bool> addBranch() async{
    var url = Uri.parse(ApiSetting.addBranch);
    var response = await http.post(url, body: {
      "restaurant_id": UserPreferences().store_id.toString(),
      "name": nameController.text,
      "address": address.value,
      "latitude": lat.value.toString(),
      "longitude": lng.value.toString(),
      "start_day_id": selectedStartDay.id.toString(),
      "end_day_id": selectedEndDay.id.toString(),
      "start_time": startTime,
      "end_time": endTime,

    },
        headers: {
          "Authorization" : UserPreferences().getTokenStore(),
        }

    );
    print("Store Token::: ${UserPreferences().getTokenStore()}");
    print(response.statusCode);
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      branchesNames.add(jsonDecode(response.body)['data']['name']);

      print(branchesNames);
      update();
      Get.snackbar("نجاح", "تم حفظ الفرع بنجاح",backgroundColor: Colors.green);

      return true;
    }
    Get.snackbar("خطآ ", "خطأ في حفظ بيانات الفرع",backgroundColor: Colors.red);
    return false;
  }

  pickImageCategory() async{
    final XFile? image = await pickerCategory.pickImage(source: ImageSource.gallery);
    if(image != null){
      categoryImageFile = image;
      update();
    }
  }

  pickImageStore() async{
    final XFile? image = await pickerStore.pickImage(source: ImageSource.gallery);
    if(image != null){
      storeImageFile = image;
      update();
    }
  }


  pickImageMenu() async{
    final XFile? image = await pickerMenu.pickImage(source: ImageSource.gallery);
    if(image != null){
      menuImageFile = image;
      update();
    }
  }



  Future<bool> addCategory() async {


    // showAlertDialog(context, "Uploading Property. Please wait...");

    ///MultiPart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ApiSetting.addCategory),
    );
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
    "Authorization" : UserPreferences().getTokenStore()
    };

    // ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'ß],
    // JSON_UNESCAPED_UNICODE
    request.headers.addAll(headers);
    request.fields
        .addAll({"name" : categoryNameController.text});
    request.fields
        .addAll({"restaurant_id" : UserPreferences().store_id.toString()});
    request.files.add(await http.MultipartFile.fromPath(
      'image', categoryImageFile!.path,
    ));

    var res = await request.send();

    if(res.statusCode == 200){
      print(res);
      print(res.statusCode);
      // print("This is response:" + res.toString());
      final respStr = await res.stream.bytesToString();

      print("Response:: ${jsonDecode(respStr)}");
      AddCategory cat  = AddCategory.fromJson(jsonDecode(respStr)['data']);
      if(cat != null){
        // print("CATEGORY:: ${cat.data!.first}");
        categoriesNames.add(cat.name!);
        print("Names::: ${categoriesNames}");
        restaurantGetx.to.getRestaurantById(id: UserPreferences().store_id.toString());
        restaurantGetx.to.refresh();
        update();
        Get.showSnackbar(GetSnackBar(
          title: "تم التسجيل بنجاح",
          message: "تم التسجيل بنجاح",
          backgroundColor: Colors.green,
        ));
        categoryNameController.text = "";
        categoryImageFile = null;
      }else{
        print("Cat is Null");
      }
        return true;
    }else{
      print(res);
      print(res.statusCode);
      final respStr = await res.stream.bytesToString();


      print(jsonDecode(respStr));
      Get.showSnackbar(GetSnackBar(
        title: "خطأ في ادخال البيانات",
        message: "خطأ في ادخال البيانات",
        backgroundColor: Colors.red,
      ));

      return false;
    }

    // // print(map["fileUrl"]);
    // print(res.statusCode);
    // print("RESPONSE:: $map");
  }
  Future<bool> editCategory({ required int catId}) async {


    // showAlertDialog(context, "Uploading Property. Please wait...");

    ///MultiPart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ApiSetting.addCategory),
    );
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      "Authorization" : UserPreferences().getTokenStore()
    };

    // ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'ß],
    // JSON_UNESCAPED_UNICODE
    request.headers.addAll(headers);
    request.fields.addAll({"name" : categoryNameController.text});
    request.fields.addAll({"category_id" : catId.toString()});
    request.fields
        .addAll({"restaurant_id" : UserPreferences().store_id.toString()});
    if(categoryImageFile != null){
      request.files.add(await http.MultipartFile.fromPath(
        'image', categoryImageFile!.path,
      ));
    }


    var res = await request.send();

    if(res.statusCode == 200){
      print(res);
      print(res.statusCode);
      // print("This is response:" + res.toString());
      final respStr = await res.stream.bytesToString();

      print("Response:: ${jsonDecode(respStr)}");

        int index = restaurantGetx.to.myRestaurant!.categories!.indexWhere((element) => element.id == catId);
       var category = restaurantGetx.to.myRestaurant!.categories!.elementAt(index);
       category.name = jsonDecode(respStr)['data']['name'];
       category.image = jsonDecode(respStr)['data']['image'];
       print(category.name);
       restaurantGetx.to.refresh();
       update();
        Get.showSnackbar(GetSnackBar(
          title: "تم التسجيل بنجاح",
          message: "تم التسجيل بنجاح",
          backgroundColor: Colors.green,
        ));

      return true;
    }else{
      print(res);
      print(res.statusCode);
      final respStr = await res.stream.bytesToString();


      print(jsonDecode(respStr));
      Get.showSnackbar(GetSnackBar(
        title: "خطأ في ادخال البيانات",
        message: "خطأ في ادخال البيانات",
        backgroundColor: Colors.red,
      ));

      return false;
    }

    // // print(map["fileUrl"]);
    // print(res.statusCode);
    // print("RESPONSE:: $map");
  }
  Future<bool> deleteCategory({ required int catId}) async {
    var url = Uri.parse(ApiSetting.deleteCategory);
    var response = await http.post(url, body: {
      "category_id": catId.toString(),
    },
        headers: {
          "Authorization" : UserPreferences().getTokenStore(),
        }

    );
    print("Store Token::: ${UserPreferences().getTokenStore()}");
    print(response.statusCode);
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {

      int index = restaurantGetx.to.myRestaurant!.categories!.indexWhere((element) => element.id == catId);
    restaurantGetx.to.myRestaurant!.categories!.removeAt(index);
      restaurantGetx.to.refresh();
      Get.snackbar("نجاح", "تم حذف القسم بنجاح",backgroundColor: Colors.green);

      return true;
    }
    Get.snackbar("خطآ ", "لم يتم حذف القسم",backgroundColor: Colors.red);
    return false;
  }
  Future<bool> addImageStore() async {


    // showAlertDialog(context, "Uploading Property. Please wait...");

    ///MultiPart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ApiSetting.addImageStore),
    );
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      "Authorization" : UserPreferences().getTokenStore()
    };

    // ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'ß],
    // JSON_UNESCAPED_UNICODE
    request.headers.addAll(headers);

    request.fields
        .addAll({"restaurant_id" : UserPreferences().store_id.toString()});
    request.files.add(await http.MultipartFile.fromPath(
      'image', storeImageFile!.path,
    ));

    var res = await request.send();

    if(res.statusCode == 200){
      print(res);
      print(res.statusCode);
      // print("This is response:" + res.toString());
      final respStr = await res.stream.bytesToString();
      // print(respStr);

      // if(menuImageFile != null){
        addImageMenu();
      // }
      return true;
    }else{
      print(res);
      print(res.statusCode);
      final respStr = await res.stream.bytesToString();


      print(jsonDecode(respStr));
      Get.showSnackbar(GetSnackBar(
        title: "خطأ في ادخال البيانات",
        message: "خطأ في ادخال البيانات",
        backgroundColor: Colors.red,
      ));

      return false;
    }

    // // print(map["fileUrl"]);
    // print(res.statusCode);
    // print("RESPONSE:: $map");
  }
  Future<bool> addImageMenu() async {


    print("from Menu Image:");
    // showAlertDialog(context, "Uploading Property. Please wait...");

    ///MultiPart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ApiSetting.addImageMenu),
    );
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      "Authorization" : UserPreferences().getTokenStore()
    };

    // ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'ß],
    // JSON_UNESCAPED_UNICODE
    request.headers.addAll(headers);

    request.fields
        .addAll({"restaurant_id" : UserPreferences().store_id.toString()});
    request.files.add(await http.MultipartFile.fromPath(
      'image', menuImageFile!.path,
    ));

    var res = await request.send();

    if(res.statusCode == 200){
      print(res);
      print(res.statusCode);
      final respStr = await res.stream.bytesToString();

      print("Response:: ${jsonEncode(respStr)}");
      Get.showSnackbar(GetSnackBar(
        title: "تم التسجيل بنجاح",
        message: "تم التسجيل بنجاح",
        backgroundColor: Colors.green,
      ));
      Get.to(RegisterScreenMeals(categoryId: "", tag: "from zero"));
      return true;
    }else{
      print(res);
      print(res.statusCode);
      final respStr = await res.stream.bytesToString();


      print(jsonDecode(respStr));
      Get.showSnackbar(GetSnackBar(
        title: "خطأ في ادخال البيانات",
        message: "خطأ في ادخال البيانات",
        backgroundColor: Colors.red,
      ));

      return false;
    }

    // // print(map["fileUrl"]);
    // print(res.statusCode);
    // print("RESPONSE:: $map");
  }
}