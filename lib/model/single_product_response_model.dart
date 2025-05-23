class SingleProductResponseModel {
  var success;
  var message;
  SingleProductResponse? data;

  SingleProductResponseModel({this.success, this.message, this.data});

  SingleProductResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new  SingleProductResponse.fromJson(json['data']) : null;
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

class SingleProductResponse {
  var sId;
  var name;
  List<String>? images;
  Category? category;
  var store;
  var description;
  var discount;
  List<ProductVariations>? variations;
  var timeRequired;
  var isDeleted;
  var ratings;
  var createdAt;
  var updatedAt;
  var iV;

  SingleProductResponse({
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

  SingleProductResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    images = json['images'].cast<String>();
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    store = json['store'];
    description = json['description'];
    discount = json['discount'];
    if (json['variations'] != null) {
      variations = <ProductVariations>[];
      json['variations'].forEach((v) {
        variations!.add(new ProductVariations.fromJson(v));
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
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['store'] = this.store;
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

class Category {
  var sId;
  var name;
  var icon;
  var createdAt;
  var updatedAt;
  var iV;

  Category({
    this.sId,
    this.name,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.iV
  });

  Category.fromJson(Map<String, dynamic> json) {
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

class ProductVariations {
  var size;
  var price;
  var sId;

  ProductVariations({this.size, this.price, this.sId});

  ProductVariations.fromJson(Map<String, dynamic> json) {
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
