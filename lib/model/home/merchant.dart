import 'package:sapakem/model/home/business_hour.dart';

class Merchant {
  int? _id;
  String? _status;
  String? _expireDate;
  String? _createdAt;
  String? _merchantName;
  String? _merchantLogo;
  bool? _isOpen;
  List<BusinessHours>? _businesHour;
  String? _mobile;
  String? _address;
  String? _storeName;

  Merchant(
      {int? id,
        String? status,
        String? expireDate,
        String? createdAt,
        String? merchantName,
        String? merchantLogo,
        bool? isOpen,
        List<BusinessHours>? businesHour,
        String? mobile,
        String? address,
        String? storeName,
        }) {
    if (id != null) {
      this._id = id;
    }
    if (status != null) {
      this._status = status;
    }
    if (expireDate != null) {
      this._expireDate = expireDate;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (merchantName != null) {
      this._merchantName = merchantName;
    }
    if (merchantLogo != null) {
      this._merchantLogo = merchantLogo;
    }
    if (isOpen != null) {
      this._isOpen = isOpen;
    }
    if (businesHour != null) {
      this._businesHour = businesHour;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
    if (address != null) {
      this._address = address;
    }
    if (storeName != null) {
      this._storeName = storeName;
    }

  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get expireDate => _expireDate;
  set expireDate(String? expireDate) => _expireDate = expireDate;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get merchantName => _merchantName;
  set merchantName(String? merchantName) => _merchantName = merchantName;
  String? get merchantLogo => _merchantLogo;
  set merchantLogo(String? merchantLogo) => _merchantLogo = merchantLogo;
  bool? get isOpen => _isOpen;
  set isOpen(bool? isOpen) => _isOpen = isOpen;
  List<BusinessHours>? get businesHour => _businesHour;
  set businesHour(List<BusinessHours>? businesHour) => _businesHour = businesHour;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get storeName => _storeName;
  set storeName(String? storeName) => _storeName = storeName;


  Merchant.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _status = json['status'];
    _expireDate = json['expire_date'];
    _createdAt = json['created_at'];
    _merchantName = json['merchant_name'];
    _merchantLogo = json['merchant_logo'];
    _isOpen = json['is_open'];
    if (json['busines_hour'] != null) {
      _businesHour = <BusinessHours>[];
      json['busines_hour'].forEach((v) {
        _businesHour!.add(new BusinessHours.fromJson(v));
      });
    }
    _mobile = json['mobile'];
    _address = json['address'];
    _storeName = json['store_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['status'] = this._status;
    data['expire_date'] = this._expireDate;
    data['created_at'] = this._createdAt;
    data['merchant_name'] = this._merchantName;
    data['merchant_logo'] = this._merchantLogo;
    data['is_open'] = this._isOpen;
    if (this._businesHour != null) {
      data['busines_hour'] = this._businesHour!.map((v) => v.toJson()).toList();
    }
    data['mobile'] = this._mobile;
    data['address'] = this._address;
    data['store_name'] = this._storeName;

    return data;
  }
}











