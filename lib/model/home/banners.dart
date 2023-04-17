class Banners {
  int? _id;
  String? _image;
  String? _status;
  String? _startDate;
  String? _endDate;
  int? _merchantId;
  String? _createdAt;
  String? _updatedAt;

  Banners(
      {int? id,
      String? image,
      String? status,
      String? startDate,
      String? endDate,
      int? merchantId,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (image != null) {
      _image = image;
    }
    if (status != null) {
      _status = status;
    }
    if (startDate != null) {
      _startDate = startDate;
    }
    if (endDate != null) {
      _endDate = endDate;
    }
    if (merchantId != null) {
      _merchantId = merchantId;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get startDate => _startDate;
  set startDate(String? startDate) => _startDate = startDate;
  String? get endDate => _endDate;
  set endDate(String? endDate) => _endDate = endDate;
  int? get merchantId => _merchantId;
  set merchantId(int? merchantId) => _merchantId = merchantId;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Banners.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _image = json['banner_img'];
    _status = json['status'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _merchantId = json['merchant_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['banner_img'] = _image;
    data['status'] = _status;
    data['start_date'] = _startDate;
    data['end_date'] = _endDate;
    data['merchant_id'] = _merchantId;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
