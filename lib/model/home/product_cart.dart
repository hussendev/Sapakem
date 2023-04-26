class ProductCart {
  int? _id;
  int? _price;
  int? _priceOffer;
  int? _quantity;
  String? _name;
  String? _productUnit;
  int? _merchantId;
  String? _merchantName;
  String? _mainImage;
  String? _description;

  ProductCart(
      {int? id,
        int? price,
        int? priceOffer,
        int? quantity,
        String? productUnit,
        int? merchantId,

        String? merchantName,
        String? mainImage,


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
    if (name != null) {
      this._name = name;
    }
    if (merchantName != null) {
      this._merchantName = merchantName;
    }
    if (mainImage != null) {
      this._mainImage = mainImage;
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
  String? get merchantName => _merchantName;
  set merchantName(String? merchantName) => _merchantName = merchantName;
  String? get mainImage => _mainImage;
  String? get description => _description;
  set description(String? description) => _description = description;
  set mainImage(String? mainImage) => _mainImage = mainImage;
  String? get name => _name;
  set name(String? name) => _name = name;




  ProductCart.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _price = json['price'];
    _priceOffer = json['price_offer'];
    _quantity = json['quantity'];
    _productUnit = json['product_unit'];
    _merchantId = json['merchant_id'];
    _merchantName = json['merchant_name'];
    _mainImage = json['main_image'];
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
    data['merchant_name'] = this._merchantName;
    data['main_image'] = this._mainImage;
    data['name'] = this._name;
    data['description'] = this._description;
    return data;
  }
}