
class restaurant {
  int? id;
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
  List<Branches>? branches;
  List<Categories>? categories;
  List<Images>? images;
  List<MenuImages>? menuImages;
  List<Ratings>? ratings;

  restaurant(
      {this.id,
        this.name,
        this.categoryId,
        this.categoryName,
        this.email,
        this.mobile,
        this.logo,
        this.ownerName,
        this.ownerPhone,
        this.casherPhone,
        this.employeePhone,
        this.mangerPhone,
        this.commercialRegistryStart,
        this.commercialRegistryEnd,
        this.commercialRegistryImage,
        this.bio,
        this.rate,
        this.createdAt,
        this.updatedAt,
        this.branches,
        this.categories,
        this.images,
        this.menuImages,
        this.ratings});

  restaurant.fromJson(Map<String, dynamic> json) {
    print('////////////////////////////////////////////////////////////////////');
    print(json['id']);
    print( json['name']);
    print('////////////////////////////////////////////////////////////////////');

    id = json['id'];
    name = json['name']??'';
    categoryId = json['category_id']??'';
    categoryName = json['category_name']??'';
    email = json['email']??'';
    mobile = json['mobile']??'';
    logo = json['logo']??'';
    ownerName = json['owner_name']??'';
    ownerPhone = json['owner_phone']??'';
    casherPhone = json['casher_phone']??'';
    employeePhone = json['employee_phone']??'';
    mangerPhone = json['manger_phone']??'';
    commercialRegistryStart = json['commercial_registry_start']??'';
    commercialRegistryEnd = json['commercial_registry_end']??'';
    commercialRegistryImage = json['commercial_registry_image']??'';
    bio = json['bio']??'';
    rate = json['rate'] ?? "";
    createdAt = json['created_at']??'';
    updatedAt = json['updated_at']??'';
    if (json['branches'] != null) {
      branches = <Branches>[];
      json['branches'].forEach((v) {
        branches!.add(new Branches.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['menuImages'] != null) {
      menuImages = <MenuImages>[];
      json['menuImages'].forEach((v) {
        menuImages!.add(new MenuImages.fromJson(v));
      });
    }
    if (json['ratings'] != null) {
      ratings = <Ratings>[];
      json['ratings'].forEach((v) {
        ratings!.add(new Ratings.fromJson(v));
      });
    }
  }

}

class Branches {
  int? id;
  String? name;
  String? address;
  String? latitude;
  String? longitude;
  String? startDayId;
  String? startDayName;
  String? endDayId;
  String? endDayName;
  String? startTime;
  String? endTime;


  Branches(
      {this.id,
        this.name,
        this.address,
        this.latitude,
        this.longitude,
        this.startDayId,
        this.startDayName,
        this.endDayId,
        this.endDayName,
        this.startTime,
        this.endTime,
        });

  Branches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    startDayId = json['start_day_id'];
    startDayName = json['start_day_name'];
    endDayId = json['end_day_id'];
    endDayName = json['end_day_name'];
    startTime = json['start_time'];
    endTime = json['end_time'];

  }


}

class Categories {
  int? id;
  String? name;
  String? image;


  Categories({this.id, this.name, this.image,});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];

  }


}

class Images {
  int? id;
  String? image;


  Images({this.id, this.image, });

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];

  }


}

class Ratings {
  int? id;
  String? userId;
  String? userName;
  String? restaurantId;
  String? mealId;
  String? mealName;
  int? rate;
  String? text;


  Ratings(
      {this.id,
        this.userId,
        this.userName,
        this.restaurantId,
        this.mealId,
        this.mealName,
        this.rate,
        this.text,
   });

  Ratings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userName = json['user_name'];
    restaurantId = json['restaurant_id'];
    mealId = json['meal_id'];
    mealName = json['meal_name'];
    rate = json['rate'];
    text = json['text'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['restaurant_id'] = this.restaurantId;
    data['meal_id'] = this.mealId;
    data['meal_name'] = this.mealName;
    data['rate'] = this.rate;
    data['text'] = this.text;

    return data;
  }
}
class MenuImages {
  int? id;
  String? image;
  String? createdAt;
  String? updatedAt;

  MenuImages({this.id, this.image, this.createdAt, this.updatedAt});

  MenuImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}