class Order {
  int? id;
  int? total;
  int? subTotal;
  String? date;
  String? status;
  String? dateReceived;
  String? hour;
  String? address;
  int? merchantId;
  String? createdAt;
  String? paymentType;
  double? latitude;
  double? longitude;

  Order({
    this.id,
    this.total,
    this.subTotal,
    this.date,
    this.status,
    this.dateReceived,
    this.hour,
    this.address,
    this.merchantId,
    this.createdAt,
    this.paymentType,
    this.latitude,
    this.longitude,
  });

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    subTotal = json['sub_total'];
    date = json['date'];
    status = json['status'];
    dateReceived = json['date_received'];
    hour = json['hour'];
    address = json['address'];
    merchantId = json['merchant_id'];
    createdAt = json['created_at'];
    paymentType = json['payment_type'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total'] = total;
    data['sub_total'] = subTotal;
    data['date'] = date;
    data['status'] = status;
    data['date_received'] = dateReceived;
    data['hour'] = hour;
    data['address'] = address;
    data['merchant_id'] = merchantId;
    data['created_at'] = createdAt;
    data['payment_type'] = paymentType;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
