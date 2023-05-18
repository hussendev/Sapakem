class User {
  bool? _status;
  String? _message;
  UserData? _userData;

  User({bool? status, String? message, UserData? userData}) {
    if (status != null) {
      _status = status;
    }
    if (message != null) {
      _message = message;
    }
    if (userData != null) {
      _userData = userData;
    }
  }

  bool? get status => _status;

  set status(bool? status) => _status = status;

  String? get message => _message;

  set message(String? message) => _message = message;

  UserData? get userData => _userData;

  set userData(UserData? userData) => _userData = userData;

  User.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _userData = json['object'] != null ? UserData.fromJson(json['object']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = _status;
    data['message'] = _message;
    if (_userData != null) {
      data['object'] = _userData!.toJson();
    }
    return data;
  }
}

class UserData {
  int? _id;
  String? _name;
  String? _email;
  String? _mobile;
  String? _lat;
  String? _lng;
  String? _status;
  String? _userType;
  String? _createdAt;
  String? _image;
  String? _token;
  String? _cityName;

  UserData({int? id, String? name, String? email, String? mobile, String? lat, String? lng, String? status, String? userType, String? createdAt, String? image, String? token, String? cityName}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (email != null) {
      this._email = email;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
    if (lat != null) {
      this._lat = lat;
    }
    if (lng != null) {
      this._lng = lng;
    }
    if (status != null) {
      this._status = status;
    }
    if (userType != null) {
      this._userType = userType;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (image != null) {
      this._image = image;
    }
    if (token != null) {
      this._token = token;
    }
    if (cityName != null) {
      this._cityName = cityName;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  String? get lat => _lat;
  set lat(String? lat) => _lat = lat;
  String? get lng => _lng;
  set lng(String? lng) => _lng = lng;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get token => _token;
  set token(String? token) => _token = token;
  String? get cityName => _cityName;
  set cityName(String? cityName) => _cityName = cityName;

  UserData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _lat = json['lat'];
    _lng = json['lng'];
    _status = json['status'];
    _userType = json['user_type'];
    _createdAt = json['created_at'];
    _image = json['user_img'];
    _token = json['token'];
    _cityName = json['city_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['email'] = this._email;
    data['mobile'] = this._mobile;
    data['lat'] = this._lat;
    data['lng'] = this._lng;
    data['status'] = this._status;
    data['user_type'] = this._userType;
    data['created_at'] = this._createdAt;
    data['image'] = this._image;
    data['token'] = this._token;
    data['city_name'] = this._cityName;
    return data;
  }
}
