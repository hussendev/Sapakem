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
      this._id = id;
    }
    if (sortOrder != null) {
      this._sortOrder = sortOrder;
    }
    if (status != null) {
      this._status = status;
    }
    if (image != null) {
      this._image = image;
    }
    if (name != null) {
      this._name = name;
    }
    if (description != null) {
      this._description = description;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['sort_order'] = this._sortOrder;
    data['status'] = this._status;
    data['image'] = this._image;
    data['name'] = this._name;
    data['description'] = this._description;
    return data;
  }
}