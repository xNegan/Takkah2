
import 'package:shared_preferences/shared_preferences.dart';

import '../provider_screens/Auth/models/driver.dart';
import '../provider_screens/Auth/models/user.dart';
import '../uitls/storage_getX.dart';


class UserPreferences {
  static final UserPreferences _instance = UserPreferences._();
  late SharedPreferences _sharedPreferences;

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._();

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future saveStore(User user) async {
    print("ID From Shared::${user.data!.id}");
    print(user.data!.name);
    print(user.data!.restaurant_id.toString());

    await _sharedPreferences.setBool('logged_in_store', true);
    await _sharedPreferences.setString('tokenStore', user.data!.token!);
    await _sharedPreferences.setInt('id_store', user.data!.id!);
    await StorageGetX.box.write('image',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhhBSGKxGPiUkd32iOTsfaGW43yuJaz1yQpA&usqp=CAU');

    await StorageGetX.setTokens(token: user.data!.token!);
    await StorageGetX.setId(id: user.data!.id.toString());
    await StorageGetX.setName(name: user.data!.name.toString());
    await StorageGetX.setEmail(Email: user.data!.email.toString()!);
    await StorageGetX.setRestaurantsId(restaurants: user.data!.id.toString()!,);
    await StorageGetX.setIsLogin();
  }


  Future saveDriver(Driver user) async {
    await _sharedPreferences.setBool('logged_in_driver', true);
    await _sharedPreferences.setString('tokenDriver', user.data!.token!);
    await _sharedPreferences.setInt('id_driver', user.data!.id!);
    await StorageGetX.box.write('image',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhhBSGKxGPiUkd32iOTsfaGW43yuJaz1yQpA&usqp=CAU');

    await StorageGetX.setTokens(token: user.data!.token!);
    await StorageGetX.setId(id: user.data!.id.toString());
    await StorageGetX.setName(name: user.data!.name.toString());
    await StorageGetX.setEmail(Email: user.data!.email.toString()!);
    //await StorageGetX.setRestaurantsId(restaurants: user.data!.restaurant_id.toString()!,);
    await StorageGetX.setIsLogin();
  }
  Future setFirstVist() async {
    await _sharedPreferences.setBool('newUser', true);
  }

  Future setType({required String type}) async {
    await _sharedPreferences.setString('type', type);
  }
  bool get isLoggedInStore => _sharedPreferences.getBool('logged_in_store') ?? false;
  bool get isLoggedInDriver => _sharedPreferences.getBool('logged_in_driver') ?? false;
  bool get firstVist => _sharedPreferences.getBool('newUser') ?? false;
  String get type => _sharedPreferences.getString('type') ?? "";
  int get id => _sharedPreferences.getInt('id') ?? -1;
  int get store_id => _sharedPreferences.getInt('id_store') ?? -1;


  Future<bool> logout() async {
    return await _sharedPreferences.clear();
  }


  String getTokenStore(){
    String token = _sharedPreferences.getString("tokenStore") ?? "";
    return "Bearer $token";
    // return token;
  }

  String getTokenDriver(){
    String token = _sharedPreferences.getString("tokenDriver") ?? "";
    return "Bearer $token";
    // return token;
  }

}
