import 'package:sapakem/model/home/business_hour.dart';
import 'package:sapakem/model/home/product.dart';
import 'package:sapakem/model/home/sub_categories.dart';

class Merchant {
  int? _id;
  String? _expireDate;
  List<Subcategories>? _subcategories;
  List<Product>? _products;
  String? _merchantName;
  String? _merchantLogo;
  String? _merchantBackground;
  bool? _isOpen;
  List<BusinessHours>? _businesHour;
  String? _mobile;
  String? _address;
  String? _storeName;

  Merchant(
      {int? id,
      String? expireDate,
      List<Subcategories>? subcategories,
      List<Product>? products,
      String? merchantName,
      String? merchantLogo,
      bool? isOpen,
      List<BusinessHours>? businesHour,
      String? mobile,
      String? address,
      String? storeName,
      String? merchantBackground
      }) {
    if (id != null) {
      _id = id;
    }
    if (expireDate != null) {
      _expireDate = expireDate;
    }
    if (subcategories != null) {
      _subcategories = subcategories;
    }
    if (products != null) {
      _products = products;
    }
    if (merchantName != null) {
      _merchantName = merchantName;
    }
    if (merchantLogo != null) {
      _merchantLogo = merchantLogo;
    }
    if (isOpen != null) {
      _isOpen = isOpen;
    }
    if (businesHour != null) {
      _businesHour = businesHour;
    }
    if (mobile != null) {
      _mobile = mobile;
    }
    if (address != null) {
      _address = address;
    }
    if (storeName != null) {
      _storeName = storeName;
    }

    if (merchantBackground != null) {
      _merchantBackground = merchantBackground;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get expireDate => _expireDate;
  set expireDate(String? expireDate) => _expireDate = expireDate;
  List<Subcategories>? get subcategories => _subcategories;
  set subcategories(List<Subcategories>? subcategories) =>
      _subcategories = subcategories;
  List<Product>? get products => _products;
  set products(List<Product>? products) => _products = products;
  String? get merchantName => _merchantName;
  set merchantName(String? merchantName) => _merchantName = merchantName;
  String? get merchantLogo => _merchantLogo;
  set merchantLogo(String? merchantLogo) => _merchantLogo = merchantLogo;
  bool? get isOpen => _isOpen;
  set isOpen(bool? isOpen) => _isOpen = isOpen;
  List<BusinessHours>? get businesHour => _businesHour;
  set businesHour(List<BusinessHours>? businesHour) =>
      _businesHour = businesHour;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get storeName => _storeName;
  set storeName(String? storeName) => _storeName = storeName;


  String? get merchantBackground => _merchantBackground;
  set merchantBackground(String? merchantBackground) => _merchantBackground = merchantBackground;
  Merchant.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _expireDate = json['expire_date'];
    if (json['subcategories'] != null) {
      _subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        _subcategories!.add(Subcategories.fromJson(v));
      });
    }
    if (json['products'] != null) {
      _products = <Product>[];
      json['products'].forEach((v) {
        _products!.add(Product.fromJson(v));
      });
    }
    _merchantName = json['merchant_name'];
    _merchantLogo = json['merchant_logo'];
    _isOpen = json['is_open'];
    if (json['busines_hour'] != null) {
      _businesHour = <BusinessHours>[];
      json['busines_hour'].forEach((v) {
        _businesHour!.add(BusinessHours.fromJson(v));
      });
    }
    _mobile = json['mobile'];
    _address = json['address'];
    _storeName = json['store_name'];
    _merchantBackground = json['background_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['expire_date'] = _expireDate;
    if (_subcategories != null) {
      data['subcategories'] = _subcategories!.map((v) => v.toJson()).toList();
    }
    if (_products != null) {
      data['products'] = _products!.map((v) => v.toJson()).toList();
    }
    data['merchant_name'] = _merchantName;
    data['merchant_logo'] = _merchantLogo;
    data['is_open'] = _isOpen;
    if (_businesHour != null) {
      data['busines_hour'] = _businesHour!.map((v) => v.toJson()).toList();
    }
    data['mobile'] = _mobile;
    data['address'] = _address;
    data['store_name'] = _storeName;
    data['background_image'] = _merchantBackground;
    return data;
  }
}
