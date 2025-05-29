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
  List<StoreCategories>? categories;
  var cover;
  var createdAt;
  var description;
  var isActive;
  var isDeleted;
  StoreLocation? location;
  var ratings;
  var status;
  var updatedAt;

  SingleStoreDetailsResponse({
    this.sId,
    this.name,
    this.iV,
    this.categories,
    this.cover,
    this.createdAt,
    this.description,
    this.isActive,
    this.isDeleted,
    this.location,
    this.ratings,
    this.status,
    this.updatedAt,
  });

  SingleStoreDetailsResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    iV = json['__v'];
    if (json['categories'] != null) {
      categories = <StoreCategories>[];
      json['categories'].forEach((v) {
        categories!.add(new StoreCategories.fromJson(v));
      });
    }
    cover = json['cover'];
    createdAt = json['createdAt'];
    description = json['description'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    location = json['location'] != null
        ? new StoreLocation.fromJson(json['location'])
        : null;
    ratings = json['ratings'];
    status = json['status'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['__v'] = this.iV;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['cover'] = this.cover;
    data['createdAt'] = this.createdAt;
    data['description'] = this.description;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['ratings'] = this.ratings;
    data['status'] = this.status;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class StoreCategories {
  var sId;
  var name;
  var icon;

  StoreCategories({this.sId, this.name, this.icon});

  StoreCategories.fromJson(Map<String, dynamic> json) {
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

class StoreLocation {
  var type;
  List<double>? coordinates;

  StoreLocation({this.type, this.coordinates});

  StoreLocation.fromJson(Map<String, dynamic> json) {
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
