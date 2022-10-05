class User {
  int? status;
  bool? success;
  Data? data;

  User({this.status, this.success, this.data});

  User.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}

class Data {
  int? id;
  int? restaurant_id;
  String? name;
  String? categoryId;
  String? categoryName;
  String? email;
  String? mobile;
  String? logo;
  String? ownerName;
  String? ownerPhone;
  String? casherPhone;
  String? employeePhone;
  String? mangerPhone;
  String? commercialRegistryStart;
  String? commercialRegistryEnd;
  String? commercialRegistryImage;
  String? bio;
  String? rate;
  String? createdAt;
  String? updatedAt;
  String? branches;
  String? categories;
  String? images;
  String? menuImages;
  String? ratings;
  String? token;



  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurant_id = json['restaurant_id'];
    name = json['name'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    email = json['email'];
    mobile = json['mobile'];
    logo = json['logo'];
    ownerName = json['owner_name'];
    ownerPhone = json['owner_phone'];
    casherPhone = json['casher_phone'];
    employeePhone = json['employee_phone'];
    mangerPhone = json['manger_phone'];
    commercialRegistryStart = json['commercial_registry_start'];
    commercialRegistryEnd = json['commercial_registry_end'];
    commercialRegistryImage = json['commercial_registry_image'];
    bio = json['bio'];
    rate = json['rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    branches = json['branches'];
    categories = json['categories'];
    images = json['images'];
    menuImages = json['menuImages'];
    ratings = json['ratings'];
    token = json['token'];
  }
}

