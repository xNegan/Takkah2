
class Day {
  int? id;
  String? key;
  String? type;
  String? name;
  String? value;


  Day(
      {this.id,
        this.key,
        this.type,
        this.name,
        this.value,

      });

  Day.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    type = json['type'];
    name = json['name'];
    value = json['value'];

  }


}