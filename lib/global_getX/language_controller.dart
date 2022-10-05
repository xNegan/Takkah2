import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../uitls/storage_getX.dart';

class LanguageController extends GetxController {
  // var appLocale = 'ar';
  String appLocale =
      StorageGetX().box.hasData('lang') ? StorageGetX().box.read('lang') : 'ar';

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    // StorageGetX localStorage = StorageGetX();

    // appLocale = await localStorage.box.hasData('lang')
    //     ? await localStorage.languageSelected
    //     : 'ar';
    // update();
    // Get.updateLocale(Locale(appLocale));
  }

  void changeLanguage(String type) async {
    StorageGetX localStorage = StorageGetX();

    if (appLocale == type) {
      return;
    }
    if (type == 'ar') {
      appLocale = 'ar';
      localStorage.saveLanguageToDisk('ar');
    } else {
      appLocale = 'en';
      localStorage.saveLanguageToDisk('en');
    }
    update();
  }
}
