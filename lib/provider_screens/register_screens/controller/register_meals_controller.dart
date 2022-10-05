
import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;

import '../../../api_settings.dart';
import '../../../preferences/user_preferences.dart';
import '../../../uitls/storage_getX.dart';
import '../../restaurant/Model/Meals.dart';
import '../../restaurant/Model/addtion.dart';
import '../model/add_category.dart';

class RegisterMealsController extends GetxController{
 static RegisterMealsController get to => Get.find();
late  TextEditingController mealNameController,
    priceMealController, descMealController,
 nameAdditionController,priceAdditionController,
    caloriesAdditionController;
final ImagePicker pickerMeal = ImagePicker();
XFile? mealImage;
String section = "";
int? selectedCategoryId;
int? mealID;
GlobalKey<FormState> key = GlobalKey<FormState>();
GlobalKey<FormState> keyAddition = GlobalKey<FormState>();
List<Addition> extra = [];
List<Addition> additions = [];
List<Addition> sizes = [];
List<Addition> drinks = [];
List<Addition> flavors = [];
List<AddCategory> categories = [];
List<int> extraIds = [];
List<int> extraIndexes = [];
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
 getCategories();
    mealNameController = TextEditingController();
    priceMealController = TextEditingController();
    descMealController = TextEditingController();
    nameAdditionController  = TextEditingController();
    priceAdditionController = TextEditingController();
    caloriesAdditionController = TextEditingController();
}

@override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    mealNameController.dispose();
    priceMealController.dispose();
    descMealController.dispose();
    nameAdditionController.dispose();
    priceAdditionController.dispose();
    caloriesAdditionController.dispose();
}


@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mealNameController.dispose();
    priceMealController.dispose();
    descMealController.dispose();
    nameAdditionController.dispose();
    priceAdditionController.dispose();
    caloriesAdditionController.dispose();
}

pickMealImage() async{
  final XFile? image = await pickerMeal.pickImage(source: ImageSource.gallery);
  if(image != null){
    mealImage = image;
    update();
  }
}
 Future<List<AddCategory>> getCategoriesFromApi() async{
   var url = Uri.parse(ApiSetting.resturentCategories,);
   var response = await http.get(url, headers: {
     "Authorization" : UserPreferences().getTokenStore()
   });
   print(response.statusCode);
   var jsonResponse  = jsonDecode(response.body);
   print(jsonResponse);
   if (response.statusCode == 200) {
     var jsonResponse  = jsonDecode(response.body)['data'] as List;
     print(response.statusCode);
     print(jsonResponse.runtimeType);
     print(jsonResponse);
     var list = jsonResponse.map((e) =>AddCategory.fromJson(e)).toList();

     return list;
   }else{

     return [];
   }
 }


 void getCategories() async {
   categories = await getCategoriesFromApi();
   // categories.add(cat!);
   update();
 }



 void createMelas() async {
print(StorageGetX().restaurants);
print(selectedCategoryId);
   // showAlertDialog(context, "Uploading Property. Please wait...");
   ///MultiPart request
   var request = http.MultipartRequest(
     'POST',
     Uri.parse(ApiSetting.addMeals),
   );
   Map<String, String> headers = {
     'Content-Type': 'application/json;charset=UTF-8',
     'Charset': 'utf-8',
     'Accept-Encoding' : 'gzip, deflate, br',
      "Authorization" : UserPreferences().getTokenStore(),
   };

   // ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'ß],
   // JSON_UNESCAPED_UNICODE
   request.headers.addAll(headers);
   request.fields
       .addAll({"restaurant_id" : UserPreferences().store_id.toString()});

   request.fields
       .addAll({"name" : mealNameController.text});
   request.fields
       .addAll({"category_id" : selectedCategoryId.toString()});
   request.fields
       .addAll({"price" : priceMealController.text});
   request.fields
       .addAll({"text" : descMealController.text});

   request.files.add(await http.MultipartFile.fromPath(
     'image', mealImage!.path,
   ));



   print("Resutrents ID:: ${StorageGetX().restaurants}");
   print("Category ID:: ${selectedCategoryId}");
   print("Meal Name:: ${mealNameController.text}");
   print("Price:: ${priceMealController.text}");
   print("Text:: ${descMealController.text}");
   print("imege papth:: ${mealImage!.path}");
   var res = await request.send();

   if(res.statusCode == 200){
     print(res);
     print(res.statusCode);
     // print("This is response:" + res.toString());
     final respStr = await res.stream.bytesToString();
     // print(respStr);

     Meals meails  = Meals.fromJson(jsonDecode(respStr)['data']);
     if(meails != null){

       mealID = meails.id;
       update();
        for(int i = 0; i < extra.length; i++){
          createAddition(name: extra[i].name!, price: extra[i].price!, calories: extra[i].calories!,);
      }
        extra.clear();
       print("Meal ID:: ${meails.id}");
       Get.showSnackbar(GetSnackBar(
         title: "تم التسجيل بنجاح",
         message: "تم التسجيل بنجاح",
         backgroundColor: Colors.green,
       ));
     }
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
   }

   // // print(map["fileUrl"]);
   // print(res.statusCode);
   // print("RESPONSE:: $map");
 }
 void editMelas() async {
   print(StorageGetX().restaurants);
   print(selectedCategoryId);
   print("Meals ID: ${mealID.toString()}");
   // showAlertDialog(context, "Uploading Property. Please wait...");
   ///MultiPart request
   var request = http.MultipartRequest(
     'POST',
     Uri.parse(ApiSetting.addMeals),
   );
   Map<String, String> headers = {
     'Content-Type': 'application/json;charset=UTF-8',
     'Charset': 'utf-8',
     'Accept-Encoding' : 'gzip, deflate, br',
     "Authorization" : UserPreferences().getTokenStore(),
   };

   // ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'ß],
   // JSON_UNESCAPED_UNICODE
   request.headers.addAll(headers);
   request.fields
       .addAll({"restaurant_id" : UserPreferences().store_id.toString()});

   request.fields
       .addAll({"name" : mealNameController.text});
   request.fields
       .addAll({"category_id" : selectedCategoryId.toString()});
   request.fields
       .addAll({"price" : priceMealController.text});
   request.fields
       .addAll({"text" : descMealController.text});
   request.fields
       .addAll({"meal_id" : mealID.toString()});
   if(mealImage != null){
     request.files.add(await http.MultipartFile.fromPath(
       'image', mealImage!.path,
     ));
   }




   print("Resutrents ID:: ${StorageGetX().restaurants}");
   print("Category ID:: ${selectedCategoryId}");
   print("Meal Name:: ${mealNameController.text}");
   print("Price:: ${priceMealController.text}");
   print("Text:: ${descMealController.text}");
   // print("imege papth:: ${mealImage!.path}");
   var res = await request.send();

   if(res.statusCode == 200) {
     print(res);
     print(res.statusCode);
     // print("This is response:" + res.toString());
     final respStr = await res.stream.bytesToString();
     // print(respStr);


     // for (int i = 0; i < extra.length; i++) {
     //   editAddition(name: extra[i].name!,
     //       price: extra[i].price!,
     //       calories: extra[i].calories ?? "",
     //       type: extra[i].type!,
     //       extraId: extraIds[i].toString());
     // }
     Get.showSnackbar(GetSnackBar(
       title: "تم التسجيل بنجاح",
       message: "تم التسجيل بنجاح",
       backgroundColor: Colors.green,
     ));
   } else{
     print(res);
     print(res.statusCode);
     final respStr = await res.stream.bytesToString();


     print(jsonDecode(respStr));
     Get.showSnackbar(GetSnackBar(
       title: "خطأ في ادخال البيانات",
       message: "خطأ في ادخال البيانات",
       backgroundColor: Colors.red,
     ));
   }

   // // print(map["fileUrl"]);
   // print(res.statusCode);
   // print("RESPONSE:: $map");
 }
 bool checkFormAddition({required String name,required String price, required String cal,}) {
   final isValid = keyAddition.currentState!.validate();
   print(isValid);
   if (!isValid) {
     print("not valid");
     return false;
   }else{
     keyAddition.currentState!.save();
     print("Ready");
     Addition addition = Addition();
       if(section == "المذاق المقترح"){
         addition.type = "flavors";
       }else if(section == "الحجم المقترح"){
         addition.type = "sizes";

       }else if(section == "المشروبات المقترحة"){
         addition.type = "drinks";
       }else{
         addition.type = "additions";
       }
       addition.mealId = mealID.toString();
       addition.name = name;
       addition.price = price;
       addition.calories = cal;
       extra.add(addition);

     print(extra);
     nameAdditionController.text = "";
     priceAdditionController.text = "";
     caloriesAdditionController.text = "";
     return true;
   }

   // saveToShared();
 }


 Future<bool> createAddition({required String name,required String price, required String calories}) async{
  var type;
   if(section == "المذاق المقترح"){
     type = "flavors";
   }else if(section == "الحجم المقترح"){
     type = "sizes";

   }else if(section == "المشروبات المقترحة"){
     type = "drinks";
   }else{
    type = "additions";
   }
   var url = Uri.parse(ApiSetting.addMealsExtra);
   var response = await http.post(url, body: {
     "meal_id" : mealID.toString(),
     "name": name,
     "price": price,
     "calories": calories,
     "type": type,
   },
  headers: {
     "Authorization" : UserPreferences().getTokenStore()
  }
   );
   print(response.statusCode);
   if (response.statusCode == 200) {
     var jsonResponse  = jsonDecode(response.body);
     print(response.statusCode);
     print(jsonResponse);
     return true;
   }
   return false;
 }
 Future<bool> editAddition({required String name,required String price, required String calories, required String extraId, required int index}) async{

  print(name);
  print(price);
  print(calories);
  print("from edit::");
  print(mealID.toString());
  print(flavors);
  print(drinks);
  print(additions);
  print(extraId);
  print(extra);
  var type;
  if(section == "المذاق المقترح"){
    type = "flavors";
  }else if(section == "الحجم المقترح"){
    type = "sizes";

  }else if(section == "المشروبات المقترحة"){
    type = "drinks";
  }else{
   type = "additions";
  }
  print(type);
  print(extraId);
  print(mealID.toString());
   var url = Uri.parse(ApiSetting.addMealsExtra);
   var response = await http.post(url, body: {
     "meal_id" : mealID.toString(),
     "name": name,
     "price": price,
     "calories": calories,
     "type": type,
     "extra_id" :extraId,
   },
       headers: {
        "Accept" : "application/json",
         "Authorization" : UserPreferences().getTokenStore()
       }
   );
   print(response.statusCode);
   if (response.statusCode == 200) {
     var jsonResponse  = jsonDecode(response.body);
     print(response.statusCode);
     print("Response:: ${jsonResponse}");
     // RegisterMealsController.to.extra.clear();
     // RegisterMealsController.to.additions.clear();
     // RegisterMealsController.to.drinks.clear();
     // RegisterMealsController.to.flavors.clear();
     // RegisterMealsController.to.sizes.clear();

     // print(flavors.elementAt(index).name);
     print("Response:: ${jsonDecode(response.body)['data']['flavors'][0]['name']}");
     if(type == "flavors"){
       flavors.elementAt(index).name = jsonDecode(response.body)['data']['flavors'][0]['name'];
     }else if(type == "drinks"){
       drinks.elementAt(index).name = jsonDecode(response.body)['data']['drinks'][0]['name'];
     }else if(type == "additions"){
       additions.elementAt(index).name = jsonDecode(response.body)['data']['additions'][0]['name'];
     }
     else if(type == "sizes"){
       sizes.elementAt(index).name = jsonDecode(response.body)['data']['sizes'][0]['name'];
     }
     RegisterMealsController.to.refresh();
     // if(flav != null){
     //   for(int i = 0; i < flav.length  ; i++){
     //     Addition addition = Addition();
     //     addition.name =flav[i].name;
     //     addition.price = flav[i].price;
     //     addition.mealId = flav[i].mealId;
     //     addition.calories = flav[i].calories;
     //     addition.type = "flavors";
     //     RegisterMealsController.to.extra.add(addition);
     //     RegisterMealsController.to.flavors.add(addition);
     //     RegisterMealsController.to.extraIds.add(flav[i].id ?? -1);
     //
     //   }
     // }
//     if(widget.meals.drinks != null){
//        for(int i = 0; i < widget.meals.drinks!.length ; i++){
//          Addition addition = Addition();
//
//          addition.name = widget.meals.drinks![i].name;
//          addition.price = widget.meals.drinks![i].price;
//          addition.mealId = widget.meals.drinks![i].mealId;
//          addition.calories = widget.meals.drinks![i].calories;
//          addition.type = "drinks";
//          RegisterMealsController.to.extra.add(addition);
//          RegisterMealsController.to.drinks.add(addition);
//          RegisterMealsController.to.extraIds.add(widget.meals.drinks![i].id ?? -1);
//
//        }
//      }
//
//      if(widget.meals.flavors != null){
//        for(int i = 0; i < widget.meals.flavors!.length ; i++){
//          Addition addition = Addition();
//          addition.name = widget.meals.flavors![i].name;
//          addition.price = widget.meals.flavors![i].price;
//          addition.mealId = widget.meals.flavors![i].mealId;
//          addition.calories = widget.meals.flavors![i].calories;
//          addition.type = "flavors";
//          RegisterMealsController.to.extra.add(addition);
//          RegisterMealsController.to.flavors.add(addition);
//          RegisterMealsController.to.extraIds.add(widget.meals.flavors![i].id ?? -1);
//
//
//        }
//      }
//
//      if(widget.meals.sizes != null){
//        for(int i = 0; i < widget.meals.sizes!.length ; i++){
//          Addition addition = Addition();
//          addition.name = widget.meals.sizes![i].name;
//          addition.price = widget.meals.sizes![i].price;
//          addition.mealId = widget.meals.sizes![i].mealId;
//          addition.calories = widget.meals.sizes![i].calories;
//          addition.type = "sizes";
//          RegisterMealsController.to.extra.add(addition);
//          RegisterMealsController.to.sizes.add(addition);
//          RegisterMealsController.to.extraIds.add(widget.meals.sizes![i].id ?? -1);
//
//        }
//      }

     for(int i = 0; i < RegisterMealsController.to.extra.length; i++){
       RegisterMealsController.to.extraIndexes.add(i);
     }

   //   print("Url:: ${widget.meals.image}");
   //   print("Sizes:: ${widget.meals.sizes}");
     print(RegisterMealsController.to.extra.length);
     print(RegisterMealsController.to.extraIndexes);
     print(RegisterMealsController.to.sizes.length);
     print(RegisterMealsController.to.additions.length);
     print(RegisterMealsController.to.flavors.length);
     print("IDS:: ${RegisterMealsController.to.extraIds}");
     return true;
   }
  var jsonResponse  = jsonDecode(response.body);
  print("Response:: ${jsonResponse}");
   return false;
 }

}