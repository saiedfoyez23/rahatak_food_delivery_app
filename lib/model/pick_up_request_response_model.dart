class PickUpRequestResponseModel {
  var success;
  var message;
  PickUpRequestResponse? data;

  PickUpRequestResponseModel({this.success, this.message, this.data});

  PickUpRequestResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new PickUpRequestResponse.fromJson(json['data']) : null;
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

class PickUpRequestResponse {
  var sId;
  Order? order;
  Rider? rider;
  PickUpDeliveryLocation? deliveryLocation;
  String? status;

  PickUpRequestResponse({this.sId, this.order, this.rider, this.deliveryLocation, this.status});

  PickUpRequestResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    rider = json['rider'] != null ? new Rider.fromJson(json['rider']) : null;
    deliveryLocation = json['delivery_location'] != null
        ? new PickUpDeliveryLocation.fromJson(json['delivery_location'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    if (this.rider != null) {
      data['rider'] = this.rider!.toJson();
    }
    if (this.deliveryLocation != null) {
      data['delivery_location'] = this.deliveryLocation!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Order {
  var sId;
  PickUpCustomer? customer;
  PickUpStore? store;
  int? shippingFee;
  List<PickUpItems>? items;

  Order({this.sId, this.customer, this.store, this.shippingFee, this.items});

  Order.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    customer = json['customer'] != null
        ? new PickUpCustomer.fromJson(json['customer'])
        : null;
    store = json['store'] != null ? new PickUpStore.fromJson(json['store']) : null;
    shippingFee = json['shipping_fee'];
    if (json['items'] != null) {
      items = <PickUpItems>[];
      json['items'].forEach((v) {
        items!.add(new PickUpItems.fromJson(v));
      });
    }
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
    data['shipping_fee'] = this.shippingFee;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PickUpCustomer {
  var sId;
  var contact;
  var name;

  PickUpCustomer({this.sId, this.contact, this.name});

  PickUpCustomer.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    contact = json['contact'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['contact'] = this.contact;
    data['name'] = this.name;
    return data;
  }
}

class PickUpStore {
  var sId;
  var name;
  PickUpLocation? location;

  PickUpStore({this.sId, this.name, this.location});

  PickUpStore.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    location = json['location'] != null
        ? new PickUpLocation.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class PickUpLocation {
  var type;
  List<double>? coordinates;

  PickUpLocation({this.type, this.coordinates});

  PickUpLocation.fromJson(Map<String, dynamic> json) {
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

class PickUpItems {
  PickUpProduct? product;
  var quantity;
  var discount;
  var sId;

  PickUpItems({this.product, this.quantity, this.discount, this.sId});

  PickUpItems.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? new PickUpProduct.fromJson(json['product']) : null;
    quantity = json['quantity'];
    discount = json['discount'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['quantity'] = this.quantity;
    data['discount'] = this.discount;
    data['_id'] = this.sId;
    return data;
  }
}

class PickUpProduct {
  var sId;
  var name;
  List<String>? images;
  var ratings;

  PickUpProduct({this.sId, this.name, this.images, this.ratings});

  PickUpProduct.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    images = json['images'].cast<String>();
    ratings = json['ratings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['images'] = this.images;
    data['ratings'] = this.ratings;
    return data;
  }
}

class Rider {
  var sId;
  var contact;
  var image;
  var name;
  var ratings;

  Rider({this.sId, this.contact, this.image, this.name, this.ratings});

  Rider.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    contact = json['contact'];
    image = json['image'];
    name = json['name'];
    ratings = json['ratings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['contact'] = this.contact;
    data['image'] = this.image;
    data['name'] = this.name;
    data['ratings'] = this.ratings;
    return data;
  }
}

class PickUpDeliveryLocation {
  PickUpLocation? location;
  var title;
  var user;
  List<String>? governorate;
  var state;
  var city;
  var phone;
  var sId;

  PickUpDeliveryLocation({
    this.location,
    this.title,
    this.user,
    this.governorate,
    this.state,
    this.city,
    this.phone,
    this.sId,
  });

  PickUpDeliveryLocation.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new PickUpLocation.fromJson(json['location'])
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
