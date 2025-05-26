class StoresResponseModel {
  var success;
  var message;
  StoresResponse? data;

  StoresResponseModel({this.success, this.message, this.data});

  StoresResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new StoresResponse.fromJson(json['data']) : null;
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

class StoresResponse {
  List<Stores>? data;
  StoresMeta? meta;

  StoresResponse({this.data, this.meta});

  StoresResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Stores>[];
      json['data'].forEach((v) {
        data!.add(new Stores.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new StoresMeta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Stores {
  var sId;
  var name;
  var iV;
  List<Categories>? categories;
  var cover;
  var createdAt;
  var description;
  var isActive;
  var isDeleted;
  StoresLocation? location;
  var ratings;
  var status;
  var updatedAt;
  var image;

  Stores({
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
    this.image,
  });

  Stores.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    iV = json['__v'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    cover = json['cover'];
    createdAt = json['createdAt'];
    description = json['description'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    location = json['location'] != null
        ? new StoresLocation.fromJson(json['location'])
        : null;
    ratings = json['ratings'];
    status = json['status'];
    updatedAt = json['updatedAt'];
    image = json['image'];
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
    data['image'] = this.image;
    return data;
  }
}

class Categories {
  var sId;
  var name;
  var icon;
  var createdAt;
  var updatedAt;
  var iV;

  Categories({
    this.sId,
    this.name,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.iV
  });

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    icon = json['icon'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class StoresLocation {
  var type;
  List<double>? coordinates;

  StoresLocation({this.type, this.coordinates});

  StoresLocation.fromJson(Map<String, dynamic> json) {
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

class StoresMeta {
  var total;

  StoresMeta({this.total});

  StoresMeta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}
