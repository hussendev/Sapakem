class StatusMerchantFriend {
  bool? _status;
  String? _message;
  Object? _object;

  StatusMerchantFriend({bool? status, String? message, Object? object}) {
    if (status != null) {
      this._status = status;
    }
    if (message != null) {
      this._message = message;
    }
    if (object != null) {
      this._object = object;
    }
  }

  bool? get status => _status;
  set status(bool? status) => _status = status;
  String? get message => _message;
  set message(String? message) => _message = message;
  Object? get object => _object;
  set object(Object? object) => _object = object;

  StatusMerchantFriend.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _object =
        json['object'] != null ? new Object.fromJson(json['object']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    if (this._object != null) {
      data['object'] = this._object!.toJson();
    }
    return data;
  }
}

class Object {
  int? _id;
  String? _status;
  String? _reason;
  int? _userId;
  int? _merchantId;
  String? _createdAt;
  String? _updatedAt;

  Object(
      {int? id,
      String? status,
      String? reason,
      int? userId,
      int? merchantId,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (status != null) {
      this._status = status;
    }
    if (reason != null) {
      this._reason = reason;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (merchantId != null) {
      this._merchantId = merchantId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get reason => _reason;
  set reason(String? reason) => _reason = reason;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  int? get merchantId => _merchantId;
  set merchantId(int? merchantId) => _merchantId = merchantId;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Object.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _status = json['status'];
    _reason = json['reason'];
    _userId = json['user_id'];
    _merchantId = json['merchant_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['status'] = this._status;
    data['reason'] = this._reason;
    data['user_id'] = this._userId;
    data['merchant_id'] = this._merchantId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}