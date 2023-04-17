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
  double? _lat;
  double? _lng;
  String? _status;
  String? _userType;
  String? _createdAt;
  String? _token;

  UserData({int? id, String? name, String? email, String? mobile, double? lat, double? lng, String? status, String? userType, String? createdAt, String? token}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (email != null) {
      _email = email;
    }
    if (mobile != null) {
      _mobile = mobile;
    }
    if (lat != null) {
      _lat = lat;
    }
    if (lng != null) {
      _lng = lng;
    }
    if (status != null) {
      _status = status;
    }
    if (userType != null) {
      _userType = userType;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (token != null) {
      _token = token;
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

  double? get lat => _lat;

  set lat(double? lat) => _lat = lat;

  double? get lng => _lng;

  set lng(double? lng) => _lng = lng;

  String? get status => _status;

  set status(String? status) => _status = status;

  String? get userType => _userType;

  set userType(String? userType) => _userType = userType;

  String? get createdAt => _createdAt;

  set createdAt(String? createdAt) => _createdAt = createdAt;

  String? get token => _token;

  set token(String? token) => _token = token;

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
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['name'] = _name;
    data['email'] = _email;
    data['mobile'] = _mobile;
    data['lat'] = _lat;
    data['lng'] = _lng;
    data['status'] = _status;
    data['user_type'] = _userType;
    data['created_at'] = _createdAt;
    data['token'] = _token;
    return data;
  }
}
