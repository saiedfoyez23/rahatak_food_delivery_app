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
  SingleStoreMeta? meta;

  StoresResponse({this.data, this.meta});

  StoresResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Stores>[];
      json['data'].forEach((v) {
        data!.add(new Stores.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new SingleStoreMeta.fromJson(json['meta']) : null;
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
  SingleLocation? location;
  var ratings;
  var status;
  var updatedAt;
  List<WorkingHours>? workingHours;
  var image;
  var contact;
  List<SingleStoreLocations>? locations;

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
    this.workingHours,
    this.image,
    this.contact,
    this.locations
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
        ? new SingleLocation.fromJson(json['location'])
        : null;
    ratings = json['ratings'];
    status = json['status'];
    updatedAt = json['updatedAt'];
    if (json['working_hours'] != null) {
      workingHours = <WorkingHours>[];
      json['working_hours'].forEach((v) {
        workingHours!.add(new WorkingHours.fromJson(v));
      });
    }
    image = json['image'];
    contact = json['contact'];
    if (json['locations'] != null) {
      locations = <SingleStoreLocations>[];
      json['locations'].forEach((v) {
        locations!.add(new SingleStoreLocations.fromJson(v));
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
    if (this.workingHours != null) {
      data['working_hours'] =
          this.workingHours!.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    data['contact'] = this.contact;
    if (this.locations != null) {
      data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
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

class SingleLocation {
  var type;
  List<double>? coordinates;

  SingleLocation({this.type, this.coordinates});

  SingleLocation.fromJson(Map<String, dynamic> json) {
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

class WorkingHours {
  var from;
  var to;
  var sId;

  WorkingHours({this.from, this.to, this.sId});

  WorkingHours.fromJson(Map<String, dynamic> json) {
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

class SingleStoreLocations {
  var governorate;
  var state;
  var locationLink;
  SingleLocation? location;
  var sId;

  SingleStoreLocations({
    this.governorate,
    this.state,
    this.locationLink,
    this.location,
    this.sId
  });

  SingleStoreLocations.fromJson(Map<String, dynamic> json) {
    governorate = json['governorate'];
    state = json['state'];
    locationLink = json['location_link'];
    location = json['location'] != null
        ? new SingleLocation.fromJson(json['location'])
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

class SingleStoreMeta {
  var total;

  SingleStoreMeta({this.total});

  SingleStoreMeta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}
