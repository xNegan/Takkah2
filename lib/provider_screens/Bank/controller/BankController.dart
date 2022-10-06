import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../global_getX/api_getX.dart';
import '../../../uitls/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../uitls/app_consts.dart';
import '../../../uitls/storage_getX.dart';
import '../model/Bank.dart';


class BankGetx extends GetxController with Api {
  static BankGetx get to => Get.find();

TextEditingController name =TextEditingController();
TextEditingController iban =TextEditingController();
TextEditingController mobile =TextEditingController();
  List<Bank> BankList = [];
  bool isLoadmyBankList = true;
  Future getBankList() async {
    print('in controlller bank');
    isLoadmyBankList = true;
    try {
      Uri url = Uri.parse(Banktotol);
      var response = await http.get(url,
          headers: {
        'Authorization': StorageGetX.token,
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Accept': '*/*',
      });
      print('statusCode ${response.statusCode}' + '*/*/*/*/*/*/*//*898*87/8');
      print(response.body);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body)['data'] as List;
        print('jsonResponse == ${jsonResponse.toString()}');
        jsonResponse.removeWhere((element) => element == null);
        jsonResponse.indexOf((element) => element == null);
        print({
          'I@I@I@I@I@  ${jsonResponse.indexWhere((element) => element == null)}'
        });
        BankList = (jsonResponse.map((e) => Bank.fromJson(e)).toList());
        isLoadmyBankList = false;
        update();
        return BankList;
      } else {
        print('statusCode ${response.statusCode}');

        //checkApi(response);
        isLoadmyBankList = false;
        return;
      }
    } catch (error) {
      isLoadmyBankList = true;
      // displayDialog(error);
      print(error);
    }
  }

  ////////////////////////////////////////////////////////////////////

  Future<void> addBank() async {
    try {

      print(StorageGetX.id);
      ApiGetX.to.onLoading(isShow: true);
      var url = Uri.parse(addYourBank);
      var response = await http.post(
        url,
        headers: {
          'Authorization': StorageGetX.token,
          'Accept-Encoding': 'gzip, deflate, br',
          'Connection': 'keep-alive',
          'Accept': '*/*',
        },
        body: {
          'restaurant_id': StorageGetX.restaurants,
          'name': name.text,
          'iban': iban.text,
          'mobile':mobile.text,
          //'IMEI': '123456789',
          //'databaseId': '1',
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
        ApiGetX.to.showDialogScsess(Title: 'تم الاضافة بنجاح');
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
     // displayDialog(error);
      return null;
    }
  }

}
