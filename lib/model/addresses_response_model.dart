class AddressesResponseModel {
  var success;
  var message;
  List<AddressesResponse>? data;

  AddressesResponseModel({this.success, this.message, this.data});

  AddressesResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AddressesResponse>[];
      json['data'].forEach((v) {
        data!.add(new AddressesResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddressesResponse {
  AddressLocation? location;
  var sId;
  var user;
  var title;
  var governorate;
  var state;
  var city;
  var phone;
  var createdAt;
  var updatedAt;
  var iV;

  AddressesResponse({
    this.location,
    this.sId,
    this.user,
    this.title,
    this.governorate,
    this.state,
    this.city,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.iV
  });

  AddressesResponse.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new AddressLocation.fromJson(json['location'])
        : null;
    sId = json['_id'];
    user = json['user'];
    title = json['title'];
    governorate = json['governorate'];
    state = json['state'];
    city = json['city'];
    phone = json['phone'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['title'] = this.title;
    data['governorate'] = this.governorate;
    data['state'] = this.state;
    data['city'] = this.city;
    data['phone'] = this.phone;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class AddressLocation {
  List<double>? coordinates;
  var type;

  AddressLocation({this.coordinates, this.type});

  AddressLocation.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<double>();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    data['type'] = this.type;
    return data;
  }
}
