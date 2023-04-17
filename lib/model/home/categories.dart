class Categories {
  int? _id;
  int? _sortOrder;
  String? _status;
  String? _image;
  String? _name;
  String? _description;

  Categories(
      {int? id,
      int? sortOrder,
      String? status,
      String? image,
      String? name,
      String? description}) {
    if (id != null) {
      _id = id;
    }
    if (sortOrder != null) {
      _sortOrder = sortOrder;
    }
    if (status != null) {
      _status = status;
    }
    if (image != null) {
      _image = image;
    }
    if (name != null) {
      _name = name;
    }
    if (description != null) {
      _description = description;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get sortOrder => _sortOrder;
  set sortOrder(int? sortOrder) => _sortOrder = sortOrder;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;

  Categories.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _sortOrder = json['sort_order'];
    _status = json['status'];
    _image = json['category_img'];
    _name = json['name'];
    _description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['sort_order'] = _sortOrder;
    data['status'] = _status;
    data['image'] = _image;
    data['name'] = _name;
    data['description'] = _description;
    return data;
  }
}
