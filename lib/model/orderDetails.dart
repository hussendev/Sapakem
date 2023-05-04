class OrderDetails {
  int? id;
  int? quantity;
  int? total;
  int? orderId;
  int? price;
  String? productName;
  String? merchantName;

  OrderDetails({this.id, this.quantity, this.total, this.orderId, this.price, this.productName, this.merchantName});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    total = json['total'];
    orderId = json['order_id'];
    price = json['price'];
    productName = json['product_name'];
    merchantName = json['merchant_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['total'] = total;
    data['order_id'] = orderId;
    data['price'] = price;
    data['product_name'] = productName;
    data['merchant_name'] = merchantName;
    return data;
  }
}
