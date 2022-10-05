// class Meails {
//   int? id;
//   String? name;
//   String? restaurantId;
//   String? categoryId;
//   String? categoryName;
//   String? price;
//   String? text;
//   String? image;
//
//   Meails(
//       {this.id,
//         this.name,
//         this.restaurantId,
//         this.categoryId,
//         this.categoryName,
//         this.price,
//         this.text,
//         this.image,
//       });
//
//   Meails.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     restaurantId = json['restaurant_id'];
//     categoryId = json['category_id'];
//     categoryName = json['category_name'];
//     price = json['price'];
//     text = json['text'];
//     image = json['image'];
//
//   }
//
//
// }

class Meals {
  int? id;
  String? name;
  int? restaurantId;
  int? categoryId;
  String? categoryName;
  String? price;
  String? text;
  String? image;
  List<Additions>? additions;
  List<Drinks>? drinks;
  List<Flavors>? flavors;
  List<Sizes>? sizes;



  Meals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    restaurantId = json['restaurant_id'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    price = json['price'];
    text = json['text'];
    image = json['image'];
    if (json['additions'] != null) {
      additions = <Additions>[];
      json['additions'].forEach((v) {
        additions!.add(new Additions.fromJson(v));
      });
    }
    if (json['drinks'] != null) {
      drinks = <Drinks>[];
      json['drinks'].forEach((v) {
        drinks!.add(new Drinks.fromJson(v));
      });
    }
    if (json['flavors'] != null) {
      flavors = <Flavors>[];
      json['flavors'].forEach((v) {
        flavors!.add(new Flavors.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(new Sizes.fromJson(v));
      });
    }
  }

}

class Additions {
  int? id;
  String? name;
  String? mealId;
  String? price;
  String? calories;


  Additions(
      {this.id,
        this.name,
        this.mealId,
        this.price,
        this.calories,
});

  Additions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mealId = json['meal_id'];
    price = json['price'];
    calories = json['calories'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['meal_id'] = this.mealId;
    data['price'] = this.price;
    data['calories'] = this.calories;

    return data;
  }
}

class Flavors {
  int? id;
  String? name;
  String? mealId;
  String? price;
  String? calories;

  Flavors(
      {this.id,
        this.name,
        this.mealId,
        this.price,
 });

  Flavors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mealId = json['meal_id'];
    price = json['price'];
    calories = json['calories'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['meal_id'] = this.mealId;
    data['price'] = this.price;

    return data;
  }
}
class Drinks {
  int? id;
  String? name;
  String? mealId;
  String? price;
  String? calories;


  Drinks(
      {this.id,
        this.name,
        this.mealId,
        this.price,

      });

  Drinks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mealId = json['meal_id'];
    price = json['price'];
    calories = json['calories'];

  }


}
class Sizes {
  int? id;
  String? name;
  String? mealId;
  String? price;
  String? calories;


  Sizes(
      {this.id,
        this.name,
        this.mealId,
        this.price,
        this.calories,

      });

  Sizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mealId = json['meal_id'];
    price = json['price'];
    calories = json['calories'];

  }


}