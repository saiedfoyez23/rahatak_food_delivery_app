class ProductsResponseModel {
  var success;
  var message;
  ProductsResponse? data;

  ProductsResponseModel({this.success, this.message, this.data});

  ProductsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new ProductsResponse.fromJson(json['data']) : null;
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

class ProductsResponse {
  List<Products>? data;
  Meta? meta;

  ProductsResponse({this.data, this.meta});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Products>[];
      json['data'].forEach((v) {
        data!.add(new Products.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
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

class Products {
  var sId;
  var name;
  List<String>? images;
  var category;
  Store? store;
  var description;
  var discount;
  List<Variations>? variations;
  var timeRequired;
  var isDeleted;
  var ratings;
  var createdAt;
  var updatedAt;
  var iV;

  Products({
    this.sId,
    this.name,
    this.images,
    this.category,
    this.store,
    this.description,
    this.discount,
    this.variations,
    this.timeRequired,
    this.isDeleted,
    this.ratings,
    this.createdAt,
    this.updatedAt,
    this.iV
  });

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    images = json['images'].cast<String>();
    category = json['category'];
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
    description = json['description'];
    discount = json['discount'];
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(new Variations.fromJson(v));
      });
    }
    timeRequired = json['time_required'];
    isDeleted = json['is_deleted'];
    ratings = json['ratings'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['images'] = this.images;
    data['category'] = this.category;
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    data['description'] = this.description;
    data['discount'] = this.discount;
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
    data['time_required'] = this.timeRequired;
    data['is_deleted'] = this.isDeleted;
    data['ratings'] = this.ratings;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Store {
  Location? location;
  var sId;

  Store({this.location, this.sId});

  Store.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['_id'] = this.sId;
    return data;
  }
}

class Location {
  var type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
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

class Variations {
  var size;
  var price;
  var sId;

  Variations({this.size, this.price, this.sId});

  Variations.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    price = json['price'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    data['price'] = this.price;
    data['_id'] = this.sId;
    return data;
  }
}

class Meta {
  var total;

  Meta({this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}
