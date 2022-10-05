mixin Api {
  String get url => 'https://almehwr.com/delivery-app/public';
  // String get url => 'http://79.137.27.182:3000/api';
  String get loginApi => '$url/api/mobileLogin';
  String get RegisteApi => '$url/api/clientRegister';
  String get categories => '$url/api/categories';
  String get Subcategories => '$url/api/restaurants?category_id=';
  String get GenralSubcategories => '$url/api/restaurants';
  String get Restaurant => '$url/api/restaurant/byID?restaurant_id=';
  String get MenuRes => '$url/api/meals?';
  String get MealsRes => '$url/api/meals/byID?meal_id=';
  String get sliders => '$url/api/sliders';
  String get Banktotol => '$url/api/restaurant/banksDetails';
  String get addYourBank => '$url/api/addBank';
  String get addBranchUrl => '$url/api/addBranch';
  String get deleteBranchUrl => '$url/api/deleteBranch';
  String get constantsDay => '$url/api/constants?key=DAY';
  String get restaurantUpdateProfile => '$url/api/restaurantUpdateProfile';


}