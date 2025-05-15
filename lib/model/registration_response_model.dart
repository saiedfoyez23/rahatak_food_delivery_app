class RegistrationResponseModel {
  var success;
  var message;
  RegistrationResponse? data;

  RegistrationResponseModel({this.success, this.message, this.data});

  RegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new RegistrationResponse.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class RegistrationResponse {
  User? user;

  RegistrationResponse({this.user});

  RegistrationResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  var sId;
  var email;
  var iV;
  var city;
  var contact;
  var createdAt;
  var governorate;
  var image;
  var isActive;
  var isDeleted;
  var name;
  var state;
  var updatedAt;

  User({
    this.sId,
    this.email,
    this.iV,
    this.city,
    this.contact,
    this.createdAt,
    this.governorate,
    this.image,
    this.isActive,
    this.isDeleted,
    this.name,
    this.state,
    this.updatedAt
  });

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    iV = json['__v'];
    city = json['city'];
    contact = json['contact'];
    createdAt = json['createdAt'];
    governorate = json['governorate'];
    image = json['image'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    name = json['name'];
    state = json['state'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['__v'] = this.iV;
    data['city'] = this.city;
    data['contact'] = this.contact;
    data['createdAt'] = this.createdAt;
    data['governorate'] = this.governorate;
    data['image'] = this.image;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['name'] = this.name;
    data['state'] = this.state;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
