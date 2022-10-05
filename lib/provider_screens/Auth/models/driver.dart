class Driver {
  int? status;
  bool? success;
  Data? data;

  Driver({this.status, this.success, this.data});

  Driver.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? type;
  String? latitude;
  String? longitude;
  String? carType;
  String? nationalityId;
  String? age;
  String? identityNumber;
  String? identityNumberImage;
  String? image;
  String? drivingLicense;
  String? vehicleLicense;
  String? createdAt;
  String? updatedAt;
  String? token;

  Data(
      {this.id,
        this.name,
        this.email,
        this.mobile,
        this.type,
        this.latitude,
        this.longitude,
        this.carType,
        this.nationalityId,
        this.age,
        this.identityNumber,
        this.identityNumberImage,
        this.image,
        this.drivingLicense,
        this.vehicleLicense,
        this.createdAt,
        this.updatedAt,
        this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    type = json['type'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    carType = json['car_type'];
    nationalityId = json['nationality_id'];
    age = json['age'];
    identityNumber = json['identity_number'];
    identityNumberImage = json['identity_number_image'];
    image = json['image'];
    drivingLicense = json['driving_license'];
    vehicleLicense = json['vehicle_license'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['type'] = this.type;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['car_type'] = this.carType;
    data['nationality_id'] = this.nationalityId;
    data['age'] = this.age;
    data['identity_number'] = this.identityNumber;
    data['identity_number_image'] = this.identityNumberImage;
    data['image'] = this.image;
    data['driving_license'] = this.drivingLicense;
    data['vehicle_license'] = this.vehicleLicense;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}

