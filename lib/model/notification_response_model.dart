class NotificationResponseModel {
  var success;
  var message;
  NotificationResponse? data;

  NotificationResponseModel({this.success, this.message, this.data});

  NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new NotificationResponse.fromJson(json['data']) : null;
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

class NotificationResponse {
  List<Notification>? data;
  NotificationMeta? meta;

  NotificationResponse({this.data, this.meta});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Notification>[];
      json['data'].forEach((v) {
        data!.add(new Notification.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new NotificationMeta.fromJson(json['meta']) : null;
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

class Notification {
  var sId;
  var receiver;
  var title;
  var body;
  var time;
  var hasRead;
  var createdAt;
  var updatedAt;
  var iV;

  Notification({
    this.sId,
    this.receiver,
    this.title,
    this.body,
    this.time,
    this.hasRead,
    this.createdAt,
    this.updatedAt,
    this.iV
  });

  Notification.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    receiver = json['receiver'];
    title = json['title'];
    body = json['body'];
    time = json['time'];
    hasRead = json['has_read'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['receiver'] = this.receiver;
    data['title'] = this.title;
    data['body'] = this.body;
    data['time'] = this.time;
    data['has_read'] = this.hasRead;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class NotificationMeta {
  int? total;

  NotificationMeta({this.total});

  NotificationMeta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}
