

import 'package:get_storage/get_storage.dart';

class StorageGetX {

  final box = GetStorage();

  Future setShowOnboarding()async{
    await box.write('showOnBoarding', true);
  }
  Future setIsLogin()async{
    await box.write('isLogin', true);
  }
  Future setIsActive()async{
    await box.write('isActive', true);
  }
  Future setIsNotActive()async{
    await box.write('isActive', false);
  }
  Future setTokens({required String accessToken, refreshToken})async{
    await box.write('accessToken', accessToken);
    await box.write('refreshToken', refreshToken);
  }
  Future setUserName({required String UserName})async{
    await box.write('UserName', UserName);
  }
  Future setPassword({required String Password})async{
    await box.write('Password', Password);
  }
  Future setImei({required String Imei})async{
    await box.write('Imei', Imei);
  }
  Future setImeiIos({required String ImeiIos})async{
    await box.write('ImeiIos', ImeiIos);
  }
  //
  //
  // Future saveUser(User user) async {
  //   await box.write('logged_in', true);
  //   await box.write('id', user.id);
  //   await box.write('emirateId', user.emirateId);
  //   await box.write('name', user.name);
  //   await box.write('imageUrl', user.avatar);
  //   await box.write('mobile', user.mobile);
  //   await box.write('city', user.cityName);
  //   await box.write('gender', user.gender);
  //   await box.write('token', user.token);
  //   await box.write('email', user.email);
  //   await box.write('type', user.type);
  // }





  bool get isShowOnBoarding => box.read('showOnBoarding') ?? false;
  bool get isLogin => box.read('isLogin') ?? false;
  bool get isActive => box.read('isActive') ?? false;
  String get accessToken => box.read('accessToken') ?? '';
  String get refreshToken => box.read('refreshToken') ?? '';
  String get UserName => box.read('UserName');
  String get Password => box.read('Password');
  String get Imei => box.read('Imei');
  String get ImeiIos => box.read('ImeiIos');
  // String get userId => box.read('userId') ?? '';
  // String get name => box.read('name') ?? '';
  // String get imageUrl => box.read('imageUrl') ?? '';
  // String get mobile => box.read('mobile') ?? '';
  // String get city => box.read('city') ?? '';
  // String get gender => box.read('gender') ?? '';
  // String get token => box.read('token') ?? '';
  // String get email => box.read('email') ?? '';
  // String get type => box.read('type') ?? '';
  // String get emirateId => box.read('emirateId') ?? '';





  bool isLoggedIn() {
    return box.read('logged_in') ?? false;
  }

  String getAccessToken() {
    String token = box.read('accessToken') ?? '';
    return 'Bearer $token';
  }

  Future logout() async {
  await  GetStorage().erase();
    return box.erase();
  }
  /// Write
  void saveLanguageToDisk (String langusage)async{
    await GetStorage().write('lang', langusage);
  }

  /// Read
  Future<String> get languageSelected async{
    return await GetStorage().read('lang');
  }
  String getlaunguage() {
    return GetStorage().read('lang').toString();
  }

}