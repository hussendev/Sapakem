class Subcategories {
  int? _id;
  int? _merchantId;
  int? _categoryId;
  String? _name;

  Subcategories({int? id, int? merchantId, int? categoryId, String? name}) {
    if (id != null) {
      this._id = id;
    }
    if (merchantId != null) {
      this._merchantId = merchantId;
    }
    if (categoryId != null) {
      this._categoryId = categoryId;
    }
    if (name != null) {
      this._name = name;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get merchantId => _merchantId;
  set merchantId(int? merchantId) => _merchantId = merchantId;
  int? get categoryId => _categoryId;
  set categoryId(int? categoryId) => _categoryId = categoryId;
  String? get name => _name;
  set name(String? name) => _name = name;

  Subcategories.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _merchantId = json['merchant_id'];
    _categoryId = json['category_id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['merchant_id'] = this._merchantId;
    data['category_id'] = this._categoryId;
    data['name'] = this._name;
    return data;
  }
}