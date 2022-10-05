class Bank {
  int? id;
  String? name;
  String? iban;
  String? mobile;
  String? createdAt;
  String? updatedAt;

  Bank(
      {this.id,
        this.name,
        this.iban,
        this.mobile,
        this.createdAt,
        this.updatedAt});

  Bank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iban = json['iban'];
    mobile = json['mobile'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}