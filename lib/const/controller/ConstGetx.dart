import 'dart:convert';

import '../../../uitls/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../uitls/app_consts.dart';
import '../../../uitls/storage_getX.dart';
import '../Models/Day.dart';


class ConstGetx extends GetxController with Api {
  static ConstGetx get to => Get.find();

  List<Day> DayList = [];
  bool isLoadmyDayList = true;
  Future getDayList() async {
    print('in controlller bank');
    isLoadmyDayList = true;
    try {
      Uri url = Uri.parse(constantsDay);
      var response = await http.get(url,
          headers: {
            'Authorization': StorageGetX.token,
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

  ////////////////////////////////////////////////////////////////////



}
