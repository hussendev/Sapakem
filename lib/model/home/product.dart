class Product {
  int? _id;
  int? _price;
  int? _priceOffer;
  int? _quantity;
  String? _productUnit;
  int? _merchantId;
  String? _status;
  String? _merchantName;
  String? _mainImage;
  String? _categoryName;
  String? _subcategoryName;
  String? _name;
  String? _description;

  Product(
      {int? id,
        int? price,
        int? priceOffer,
        int? quantity,
        String? productUnit,
        int? merchantId,
        String? status,
        String? merchantName,
        String? mainImage,
        String? categoryName,
        String? subcategoryName,
        String? name,
        String? description}) {
    if (id != null) {
      this._id = id;
    }
    if (price != null) {
      this._price = price;
    }
    if (priceOffer != null) {
      this._priceOffer = priceOffer;
    }
    if (quantity != null) {
      this._quantity = quantity;
    }
    if (productUnit != null) {
      this._productUnit = productUnit;
    }
    if (merchantId != null) {
      this._merchantId = merchantId;
    }
    if (status != null) {
      this._status = status;
    }
    if (merchantName != null) {
      this._merchantName = merchantName;
    }
    if (mainImage != null) {
      this._mainImage = mainImage;
    }
    if (categoryName != null) {
      this._categoryName = categoryName;
    }
    if (subcategoryName != null) {
      this._subcategoryName = subcategoryName;
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
  int? get price => _price;
  set price(int? price) => _price = price;
  int? get priceOffer => _priceOffer;
  set priceOffer(int? priceOffer) => _priceOffer = priceOffer;
  int? get quantity => _quantity;
  set quantity(int? quantity) => _quantity = quantity;
  String? get productUnit => _productUnit;
  set productUnit(String? productUnit) => _productUnit = productUnit;
  int? get merchantId => _merchantId;
  set merchantId(int? merchantId) => _merchantId = merchantId;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get merchantName => _merchantName;
  set merchantName(String? merchantName) => _merchantName = merchantName;
  String? get mainImage => _mainImage;
  set mainImage(String? mainImage) => _mainImage = mainImage;
  String? get categoryName => _categoryName;
  set categoryName(String? categoryName) => _categoryName = categoryName;
  String? get subcategoryName => _subcategoryName;
  set subcategoryName(String? subcategoryName) =>
      _subcategoryName = subcategoryName;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;

  Product.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _price = json['price'];
    _priceOffer = json['price_offer'];
    _quantity = json['quantity'];
    _productUnit = json['product_unit'];
    _merchantId = json['merchant_id'];
    _status = json['status'];
    _merchantName = json['merchant_name'];
    _mainImage = json['main_image'];
    _categoryName = json['category_name'];
    _subcategoryName = json['subcategory_name'];
    _name = json['name'];
    _description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['price'] = this._price;
    data['price_offer'] = this._priceOffer;
    data['quantity'] = this._quantity;
    data['product_unit'] = this._productUnit;
    data['merchant_id'] = this._merchantId;
    data['status'] = this._status;
    data['merchant_name'] = this._merchantName;
    data['main_image'] = this._mainImage;
    data['category_name'] = this._categoryName;
    data['subcategory_name'] = this._subcategoryName;
    data['name'] = this._name;
    data['description'] = this._description;
    return data;
  }
}