class SingleStoreDetailsResponseModel {
  var success;
  var message;
  SingleStoreDetailsResponse? data;

  SingleStoreDetailsResponseModel({this.success, this.message, this.data});

  SingleStoreDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new SingleStoreDetailsResponse.fromJson(json['data']) : null;
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

class SingleStoreDetailsResponse {
  var sId;
  var name;
  var iV;
  List<SingleCategories>? categories;
  var contact;
  var cover;
  var createdAt;
  var description;
  var image;
  var isActive;
  var isDeleted;
  List<SingleLocations>? locations;
  var ratings;
  var status;
  var updatedAt;
  List<VendorWorkingHours>? workingHours;

  SingleStoreDetailsResponse({
    this.sId,
    this.name,
    this.iV,
    this.categories,
    this.contact,
    this.cover,
    this.createdAt,
    this.description,
    this.image,
    this.isActive,
    this.isDeleted,
    this.locations,
    this.ratings,
    this.status,
    this.updatedAt,
    this.workingHours
  });

  SingleStoreDetailsResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    iV = json['__v'];
    if (json['categories'] != null) {
      categories = <SingleCategories>[];
      json['categories'].forEach((v) {
        categories!.add(new SingleCategories.fromJson(v));
      });
    }
    contact = json['contact'];
    cover = json['cover'];
    createdAt = json['createdAt'];
    description = json['description'];
    image = json['image'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    if (json['locations'] != null) {
      locations = <SingleLocations>[];
      json['locations'].forEach((v) {
        locations!.add(new SingleLocations.fromJson(v));
      });
    }
    ratings = json['ratings'];
    status = json['status'];
    updatedAt = json['updatedAt'];
    if (json['working_hours'] != null) {
      workingHours = <VendorWorkingHours>[];
      json['working_hours'].forEach((v) {
        workingHours!.add(new VendorWorkingHours.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['__v'] = this.iV;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['contact'] = this.contact;
    data['cover'] = this.cover;
    data['createdAt'] = this.createdAt;
    data['description'] = this.description;
    data['image'] = this.image;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    if (this.locations != null) {
      data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    data['ratings'] = this.ratings;
    data['status'] = this.status;
    data['updatedAt'] = this.updatedAt;
    if (this.workingHours != null) {
      data['working_hours'] =
          this.workingHours!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SingleCategories {
  var sId;
  var name;
  var icon;

  SingleCategories({this.sId, this.name, this.icon});

  SingleCategories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}

class SingleLocations {
  var governorate;
  var state;
  var locationLink;
  SingleVendorLocation? location;
  var sId;

  SingleLocations({
    this.governorate,
    this.state,
    this.locationLink,
    this.location,
    this.sId,
  });

  SingleLocations.fromJson(Map<String, dynamic> json) {
    governorate = json['governorate'];
    state = json['state'];
    locationLink = json['location_link'];
    location = json['location'] != null
        ? new SingleVendorLocation.fromJson(json['location'])
        : null;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['governorate'] = this.governorate;
    data['state'] = this.state;
    data['location_link'] = this.locationLink;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['_id'] = this.sId;
    return data;
  }
}

class SingleVendorLocation {
  var type;
  List<double>? coordinates;

  SingleVendorLocation({this.type, this.coordinates});

  SingleVendorLocation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class VendorWorkingHours {
  var from;
  var to;
  var sId;

  VendorWorkingHours({this.from, this.to, this.sId});

  VendorWorkingHours.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    data['_id'] = this.sId;
    return data;
  }
}
