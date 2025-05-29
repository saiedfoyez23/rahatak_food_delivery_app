class UserWiseOrderListResponseModel {
  bool? success;
  String? message;
  UserWiseOrderListResponse? data;

  UserWiseOrderListResponseModel({this.success, this.message, this.data});

  UserWiseOrderListResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new UserWiseOrderListResponse.fromJson(json['data']) : null;
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

class UserWiseOrderListResponse {
  List<UserWiseOrderList>? data;
  ProductMeta? meta;

  UserWiseOrderListResponse({this.data, this.meta});

  UserWiseOrderListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <UserWiseOrderList>[];
      json['data'].forEach((v) {
        data!.add(new UserWiseOrderList.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new ProductMeta.fromJson(json['meta']) : null;
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

class UserWiseOrderList {
  var sId;
  Customer? customer;
  ProductStore? store;
  var orderId;
  var paymentMethod;
  var shippingFee;
  var total;
  var status;
  var paymentStatus;
  List<Items>? items;
  DeliveryLocation? deliveryLocation;
  var createdAt;
  var updatedAt;
  var iV;

  UserWiseOrderList({
    this.sId,
    this.customer,
    this.store,
    this.orderId,
    this.paymentMethod,
    this.shippingFee,
    this.total,
    this.status,
    this.paymentStatus,
    this.items,
    this.deliveryLocation,
    this.createdAt,
    this.updatedAt,
    this.iV
  });

  UserWiseOrderList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    store = json['store'] != null ? new ProductStore.fromJson(json['store']) : null;
    orderId = json['order_id'];
    paymentMethod = json['payment_method'];
    shippingFee = json['shipping_fee'];
    total = json['total'];
    status = json['status'];
    paymentStatus = json['payment_status'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    deliveryLocation = json['delivery_location'] != null
        ? new DeliveryLocation.fromJson(json['delivery_location'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    data['order_id'] = this.orderId;
    data['payment_method'] = this.paymentMethod;
    data['shipping_fee'] = this.shippingFee;
    data['total'] = this.total;
    data['status'] = this.status;
    data['payment_status'] = this.paymentStatus;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.deliveryLocation != null) {
      data['delivery_location'] = this.deliveryLocation!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Customer {
  var sId;
  var image;
  var name;

  Customer({this.sId, this.image, this.name});

  Customer.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}

class ProductStore {
  var sId;
  var name;
  var image;
  var ratings;

  ProductStore({this.sId, this.name, this.image, this.ratings});

  ProductStore.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    ratings = json['ratings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['ratings'] = this.ratings;
    return data;
  }
}

class Items {
  ItemProduct? product;
  var quantity;
  var price;
  var size;
  var discount;
  var sId;

  Items({
    this.product,
    this.quantity,
    this.price,
    this.size,
    this.discount,
    this.sId,
  });

  Items.fromJson(Map<String, dynamic> json) {
    product = json['product'] != null ? new ItemProduct.fromJson(json['product']) : null;
    quantity = json['quantity'];
    price = json['price'];
    size = json['size'];
    discount = json['discount'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['size'] = this.size;
    data['discount'] = this.discount;
    data['_id'] = this.sId;
    return data;
  }
}

class ItemProduct {
  var sId;
  var name;
  List<String>? images;

  ItemProduct({this.sId, this.name, this.images});

  ItemProduct.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['images'] = this.images;
    return data;
  }
}

class DeliveryLocation {
  ProductLocation? location;
  var title;
  var user;
  List<String>? governorate;
  var state;
  var city;
  var phone;
  var sId;

  DeliveryLocation({
    this.location,
    this.title,
    this.user,
    this.governorate,
    this.state,
    this.city,
    this.phone,
    this.sId,
  });

  DeliveryLocation.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new ProductLocation.fromJson(json['location'])
        : null;
    title = json['title'];
    user = json['user'];
    governorate = json['governorate'].cast<String>();
    state = json['state'];
    city = json['city'];
    phone = json['phone'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['title'] = this.title;
    data['user'] = this.user;
    data['governorate'] = this.governorate;
    data['state'] = this.state;
    data['city'] = this.city;
    data['phone'] = this.phone;
    data['_id'] = this.sId;
    return data;
  }
}

class ProductLocation {
  List<double>? coordinates;
  var type;

  ProductLocation({this.coordinates, this.type});

  ProductLocation.fromJson(Map<String, dynamic> json) {
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

class ProductMeta {
  var total;

  ProductMeta({this.total});

  ProductMeta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}
