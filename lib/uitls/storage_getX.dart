import 'package:get_storage/get_storage.dart';

//
class StorageGetX {
  final box = GetStorage();

  Future setShowOnboarding() async {
    await box.write('showOnBoarding', true);
  }
  // Future saveStore(User user) async {
  //   await _sharedPreferences.setBool('logged_in_store', true);
  //   await _sharedPreferences.setString('tokenStore', user.data!.token!);
  //   await _sharedPreferences.setInt('id_store', user.data!.restaurant_id!);
  // }

  Future setIsLogin() async {
    await box.write('isLogin', true);
  }

  Future setIsActive() async {
    await box.write('isActive', true);
  }

  Future setIsNotActive() async {
    await box.write('isActive', false);
  }

  Future setTokens({required String token}) async {
    await box.write('token', 'Bearer $token');
  }

  Future setRestaurants({required String restaurants}) async {
    await box.write('restaurants', restaurants);
  }

  Future setName({required String name}) async {
    await box.write('name', name);
  }
  Future setEmail({required String Email}) async {
    await box.write('email', Email);
  }

  Future setId({required String id}) async {
    await box.write('id', id);
  }

  Future setImeiIos({required String imeiIos}) async {
    await box.write('imeiIos', imeiIos);
  }

  bool get isShowOnBoarding => box.read('showOnBoarding') ?? false;
  bool get isLogin => box.read('isLogin') ?? false;
  bool get isActive => box.read('isActive') ?? false;
  String get token => box.read('token') ?? '';
  String get restaurants => box.read('restaurants') ?? '';
  String get name => box.read('name');
  String get id => box.read('id');
  String get image => box.read('image');
  String get Email => box.read('email');
  String get Name => box.read('name');
  String get imeiIos => box.read('imei');
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

  String getToken() {
    String token = box.read('token') ?? '';
    return token;
  }

  Future logout() async {
    await GetStorage().erase();
    return box.erase();
  }

  /// Write
  void saveLanguageToDisk(String langusage) async {
    await GetStorage().write('lang', langusage);
  }

  /// Read
  Future<String> get languageSelected async {
    return await GetStorage().read('lang');
  }

  String getlaunguage() {
    return GetStorage().read('lang').toString();
  }
}
