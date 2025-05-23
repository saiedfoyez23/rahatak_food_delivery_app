class CartResponseModel {
  var success;
  var message;
  List<CartResponse>? data;

  CartResponseModel({this.success, this.message, this.data});

  CartResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CartResponse>[];
      json['data'].forEach((v) {
        data!.add(new CartResponse.fromJson(v));
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

class CartResponse {
  var sId;
  var user;
  Product? product;
  var size;
  var note;
  var quantity;
  var price;
  var iV;

  CartResponse({
    this.sId,
    this.user,
    this.product,
    this.size,
    this.note,
    this.quantity,
    this.price,
    this.iV
  });

  CartResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    size = json['size'];
    note = json['note'];
    quantity = json['quantity'];
    price = json['price'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['size'] = this.size;
    data['note'] = this.note;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['__v'] = this.iV;
    return data;
  }
}

class Product {
  var sId;
  var name;
  List<String>? images;
  var store;

  Product({this.sId, this.name, this.images, this.store});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    images = json['images'].cast<String>();
    store = json['store'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['images'] = this.images;
    data['store'] = this.store;
    return data;
  }
}
