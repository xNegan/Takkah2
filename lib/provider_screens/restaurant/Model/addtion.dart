

class Addition {
  String? name;
  String? mealId;
  String? price;
  String? calories;
  String? type;

  Addition(
      {
        this.name,
        this.mealId,
        this.price,
        this.calories,
        this.type,
      });

  Addition.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mealId = json['meal_id'];
    price = json['price'];
    calories = json['calories'];
    type = json['type'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['meal_id'] = this.mealId;
    data['price'] = this.price;
    data['calories'] = this.calories;
    data['type'] = this.type;

    return data;
  }
}
