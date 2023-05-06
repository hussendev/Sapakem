class UserRegister {
  String? _name;
  String? _email;
  int? _mobile;
  String? _password;
  String? _fcmToken;
  double? _lat;
  double? _lng;
  int? _deviceType;
  int? _cityId;

  UserRegister(
      {String? name,
      String? email,
      int? mobile,
      String? password,
      String? fcmToken,
      double? lat,
      double? lng,
      int? deviceType,
      int? cityId}) {
    if (name != null) {
      this._name = name;
    }
    if (email != null) {
      this._email = email;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
    if (password != null) {
      this._password = password;
    }
    if (fcmToken != null) {
      this._fcmToken = fcmToken;
    }
    if (lat != null) {
      this._lat = lat;
    }
    if (lng != null) {
      this._lng = lng;
    }
    if (deviceType != null) {
      this._deviceType = deviceType;
    }
    if (cityId != null) {
      this._cityId = cityId;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get email => _email;
  set email(String? email) => _email = email;
  int? get mobile => _mobile;
  set mobile(int? mobile) => _mobile = mobile;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get fcmToken => _fcmToken;
  set fcmToken(String? fcmToken) => _fcmToken = fcmToken;
  double? get lat => _lat;
  set lat(double? lat) => _lat = lat;
  double? get lng => _lng;
  set lng(double? lng) => _lng = lng;
  int? get deviceType => _deviceType;
  set deviceType(int? deviceType) => _deviceType = deviceType;

  int? get cityId => _cityId;
  set cityId(int? cityId) => _cityId = cityId;

  UserRegister.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _password = json['password'];
    _fcmToken = json['fcm_token'];
    _lat = json['lat'];
    _lng = json['lng'];
    _deviceType = json['device_type'];
    _cityId = json['city_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['email'] = this._email;
    data['mobile'] = this._mobile;
    data['password'] = this._password;
    data['fcm_token'] = this._fcmToken;
    data['lat'] = this._lat;
    data['lng'] = this._lng;
    data['device_type'] = this._deviceType;
    data['city_id'] = this._cityId;
    return data;
  }
}
