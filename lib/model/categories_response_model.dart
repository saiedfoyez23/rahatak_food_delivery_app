class CategoriesResponseModel {
  var success;
  var message;
  List<CategoriesResponse>? data;

  CategoriesResponseModel({this.success, this.message, this.data});

  CategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoriesResponse>[];
      json['data'].forEach((v) {
        data!.add(new CategoriesResponse.fromJson(v));
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

class CategoriesResponse {
  var sId;
  var name;
  var icon;
  var createdAt;
  var updatedAt;
  var iV;

  CategoriesResponse({
    this.sId,
    this.name,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  CategoriesResponse.fromJson(Map<String, dynamic> json) {
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
