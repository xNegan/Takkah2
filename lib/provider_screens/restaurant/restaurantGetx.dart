import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import '../../const/Models/Day.dart';
import '../../global_getX/api_getX.dart';
import '../../uitls/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../uitls/storage_getX.dart';
import 'Model/Meals.dart';
import 'Model/RestModel.dart';

class restaurantGetx extends GetxController with Api {
  static restaurantGetx get to => Get.find();

  restaurant? myRestaurant;
  bool isLoadmyRestaurant = true;
  Future getRestaurantById({required String id}) async {
    isLoadmyRestaurant = true;
    try {
      Uri url = Uri.parse(Restaurant + id);
      //   Uri url = Uri.parse(Restaurant + StorageGetX().Restaurants);
      var response = await http.get(url, headers: {
        'Authorization': StorageGetX().getToken(),
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Accept': '*/*',
      });
      print('*/*/*/*/*/*/*/*myRestaurantid : $id*/*/*/*/*/*/*/*/*');
      print('statusCode ${response.statusCode}' + '*/*/*/*/*/*/*//*898*87/8');
      print(response.body);
      print('statusCode ${response.statusCode}' + '*/*/*/*/*/*/*//*898*87/8');
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body)['data'];
        print('jsonResponse == ${jsonResponse.toString()}');
        myRestaurant = restaurant.fromJson(jsonResponse);

        isLoadmyRestaurant = false;
        update();
        return myRestaurant;
      } else {
        print('statusCode ${response.statusCode}');

        //checkApi(response);
        isLoadmyRestaurant = false;
        return;
      }
    } catch (error) {
      isLoadmyRestaurant = false;
     // displayDialog(error);
      print("error");
      // displayDialog(error);
      print(error);
      print("error");
    }
  }
////////////////////////////////////////////////////////////////

  List<Meals> MealsList = [];

  bool isLoadmyMealsList = true;
  Future getMealsList({
    required String idRestunalt,
    required String idCatogery,
  }) async {
    isLoadmyMealsList = true;
    try {
      Uri url = Uri.parse(
          MenuRes + 'restaurant_id=$idRestunalt&category_id=$idCatogery');
      //   Uri url = Uri.parse(Restaurant + StorageGetX().Restaurants);
      var response = await http.get(url, headers: {
        'Authorization': StorageGetX().getToken(),
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Accept': '*/*',
      });
      print(
          '*/*/*/*/*/*/*/* restaurant_id=$idRestunalt&category_id=$idCatogery*/*/*/*/*/*/*/*/*');
      print('statusCode ${response.statusCode}' + '*/*/*/*/*/*/*//*898*87/8');
      print(response.body);
      print('statusCode ${response.statusCode}' + '*/*/*/*/*/*/*//*898*87/8');
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body)['data'] as List;
        MealsList = (jsonResponse.map((e) => Meals.fromJson(e)).toList());
        print('jsonResponse == ${jsonResponse.toString()}');
        jsonResponse.removeWhere((element) => element == null);
        jsonResponse.indexOf((element) => element == null);
        print({
          'I@I@I@I@I@  ${jsonResponse.indexWhere((element) => element == null)}'
        });
        MealsList = (jsonResponse.map((e) => Meals.fromJson(e)).toList());
        isLoadmyMealsList = false;
        update();
        return MealsList;
      } else {
        print('statusCode ${response.statusCode}');

        //checkApi(response);
        isLoadmyMealsList = false;
        return;
      }
    } catch (error) {
      isLoadmyMealsList = true;
      // displayDialog(error);
      print(error);
    }
  }

  ////////////////////////////////////////////////////////////////////
  Meals? Meail;

  bool isLoadmyMeails = true;
  Future getMeal({required String idMenu}) async {
    isLoadmyMeails = true;
    print(StorageGetX().getToken(),);
    try {
      Uri url = Uri.parse(MealsRes + idMenu.toString());
      //   Uri url = Uri.parse(Restaurant + StorageGetX().Restaurants);
      var response = await http.get(url, headers: {
        'Authorization': StorageGetX().getToken(),
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Accept': '*/*',
      });
      print('statusCode ${response.statusCode}' + '*/*/*/*/*/*/*//*898*87/8');
      print(response.body);
      print('statusCode ${response.statusCode}' + '*/*/*/*/*/*/*//*898*87/8');
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        Meail = Meals.fromJson(jsonResponse);
        print("Meals:: ${Meail!.drinks}");
        isLoadmyMeails = false;
        update();
        return Meail;
      } else {
        print('statusCode ${response.statusCode}');

        //checkApi(response);
        isLoadmyMeails = false;
        return;
      }
    } catch (error) {
      isLoadmyMeails = false;
      update();
      // displayDialog(error);
      print(error);
    }
  }



  //////////////////////////////////////////////////////////////////

  late double Mylaut;
  late double Mylong;
  String addressName='';
  Day? StartDaySelected;
  Day? EndDaySelected;
  String StartTime='';
  String EndTime='';
  TextEditingController nameBranch= TextEditingController();
  void setStartDaySelected({required Day day}){
    StartDaySelected=day;
    update();
  }
  void setEndDaySelected({required Day day}){
    EndDaySelected=day;
    update();
  }
  void setStartTime({required String time}){
    StartTime=time;
    update();
  }
  void setEndTime({required String time}){
    EndTime=time;
    update();
  }
  void SetAddress({required String address}){
    this.addressName=address;
    update();
  }
  Future<void> SaveLautLong({required String yourAddress}) async {
    List<Location> locations = await locationFromAddress(yourAddress);
    print(locations.first.latitude);
    print(locations.first.longitude);
    Mylaut= locations.first.latitude ;
    Mylong= locations.first.longitude ;
    update();
  }

  Future<void> addBranch() async {
    try {
      print(StorageGetX().id);
      ApiGetX.to.onLoading(isShow: true);
      var url = Uri.parse(addBranchUrl);
      var response = await http.post(
        url,
        headers: {
          'Authorization': StorageGetX().token,
          'Accept-Encoding': 'gzip, deflate, br',
          'Connection': 'keep-alive',
          'Accept': '*/*',
        },
        body: {
          //'restaurant_id':'1',
          'restaurant_id': StorageGetX().restaurants,
           'name': nameBranch.text,
          'address': addressName,
          'latitude':Mylaut.toString(),
          'longitude':Mylong.toString(),
          'start_day_id':StartDaySelected?.id.toString(),
          'end_day_id':EndDaySelected?.id.toString(),
        //  'start_time':'08:00:00',
          'start_time':StartTime.substring(0, 4),
          //'end_time':'22:00:00',
          'end_time':EndTime.substring(0, 4),
        },
      );
      var responseData = jsonDecode(response.body)['data'];
      var responseerror = jsonDecode(response.body)['error'];
      var responsestatus = jsonDecode(response.body)['status'];
      print(response.body);
      print(response.statusCode);
      if (responsestatus == 200) {
        restaurantGetx.to.getRestaurantById(id: StorageGetX().restaurants/* '1'*/);
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
  Future<void> updateBranch({required String idBranch}) async {
    try {
      print(StorageGetX().id);
      ApiGetX.to.onLoading(isShow: true);
      var url = Uri.parse(addBranchUrl);
      var response = await http.post(
        url,
        headers: {
          'Authorization': StorageGetX().token,
          'Accept-Encoding': 'gzip, deflate, br',
          'Connection': 'keep-alive',
          'Accept': '*/*',
        },
        body: {
          //'restaurant_id':'1',
          'restaurant_id': StorageGetX().restaurants,
          'name': nameBranch.text,
          'address': addressName,
          'latitude':Mylaut.toString(),
          'longitude':Mylong.toString(),
          'start_day_id':StartDaySelected?.id.toString(),
          'end_day_id':EndDaySelected?.id.toString(),
          //  'start_time':'08:00:00',
          'start_time':StartTime.substring(0, 4),
          //'end_time':'22:00:00',
          'end_time':EndTime.substring(0, 4),
          'branch_id':idBranch,
        },
      );
      var responseData = jsonDecode(response.body)['data'];
      var responseerror = jsonDecode(response.body)['error'];
      var responsestatus = jsonDecode(response.body)['status'];
      print(response.body);
      print(response.statusCode);
      if (responsestatus == 200) {
         await restaurantGetx.to.getRestaurantById(id: StorageGetX().restaurants/* '1'*/);
        ApiGetX.to.onLoading(isShow: false);
        print(responseData['data'],);
        Get.back();
        ApiGetX.to.showDialogScsess(Title: 'تم التعديل بنجاح');
      }
      else {
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
  Future DeleteBranch({required String idBranch}) async {
    try {
      ApiGetX.to.onLoading(isShow: true);
      Uri url = Uri.parse(deleteBranchUrl);
      var response = await http.post(
        url,
        headers: {
          'Authorization': StorageGetX().token,
          'Accept-Encoding': 'gzip, deflate, br',
          'Connection': 'keep-alive',
          'Accept': '*/*',
        },
        body: {
          //'restaurant_id':'1',
          'branch_id': idBranch,
        },

      );
      var responseData = jsonDecode(response.body)['data'];
      var responseerror = jsonDecode(response.body)['error'];
      var responsestatus = jsonDecode(response.body)['status'];
      print('statusCode ${response.statusCode}');
      print('/----------------- BranchDelete----------------------/');
      if (responsestatus == 200) {
        //await restaurantGetx.to.getRestaurantById(id: StorageGetX().restaurants/* '1'*/);
        int x=myRestaurant!.branches!.indexWhere((element) => element.id.toString()==idBranch);
        print(x);
        myRestaurant!.branches!.removeAt(x);
        update();
        ApiGetX.to.onLoading(isShow: false);
        print(responseData['data'],);
       // ApiGetX.to.showDialogScsess(Title: 'تم الحذ بنجاح');
        Get.back();
      }
      else {
        ApiGetX.to.onLoading(isShow: false);
        //checkApi(response);
        ApiGetX.to.showDialogFailed(Title: responseerror['message'].toString());
        // EasyLoading.dismiss();

        update();
        return null;
      }
      //isLoadSessionTotal = false;
      return;
    } catch (error) {
      // isLoadSessionTotal = false;
      print(error);
      print(error);
      print(error);
    }
  }



  void fillBranchData({
  required String name,
  required String address,
  required String latitude,
  required String longitude,
  required String start_day_id,
  required String start_day,
  required String end_day_id,
  required String end_day,
  required String start_time,
  required String end_time,
}){
    name=nameBranch.text;
    address= addressName;
    latitude=Mylaut.toString();
    longitude=Mylong.toString();
    start_day_id=StartDaySelected?.id.toString() as String;
    end_day_id=EndDaySelected?.id.toString() as String;
    start_day=StartDaySelected!.value!;
    end_day=EndDaySelected!.value!;
    //  'start_time':'08:00:00',
    start_time=StartTime;
    //'end_time':'22:00:00',
    end_time=EndTime;
    update();
  }
  void removeBranchData(){

     addressName='';
    StartDaySelected!.value='';
   EndDaySelected!.value='';
    StartTime='';
    EndTime='';
     nameBranch.text='';
    update();
  }

  ////////////////////////////////////////////////////////////////
  List<Day> DayList = [];
  bool isLoadmyDayList = true;
  Future getDayList() async {
    print('in controlller bank');
    isLoadmyDayList = true;
    try {
      Uri url = Uri.parse(constantsDay);
      var response = await http.get(url,
          headers: {
            'Authorization': StorageGetX().token,
            'Accept-Encoding': 'gzip, deflate, br',
            'Connection': 'keep-alive',
            'Accept': '*/*',
          });
      print('statusCode ${response.statusCode}' + '*/*/*/*/*/*/*//*898*87/8');
      print(response.body);
      var jsonStatus = jsonDecode(response.body)['status'] ;
      if (jsonStatus == 200) {
        var jsonResponse = jsonDecode(response.body)['data'] as List;
        print('jsonResponse == ${jsonResponse.toString()}');
        DayList = (jsonResponse.map((e) => Day.fromJson(e)).toList());
        isLoadmyDayList = false;
        update();
        return DayList;
      } else {
        print('statusCode ${response.statusCode}');

        //checkApi(response);
        isLoadmyDayList = false;
        return;
      }
    } catch (error) {
      isLoadmyDayList = true;
      // displayDialog(error);
      print(error);
    }
  }
}
