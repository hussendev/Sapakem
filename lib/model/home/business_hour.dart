class BusinessHours {
  int? _id;
  int? _merchantId;
  String? _from;
  String? _to;
  int? _day;

  BusinessHours(
      {int? id, int? merchantId, String? from, String? to, int? day}) {
    if (id != null) {
      this._id = id;
    }
    if (merchantId != null) {
      this._merchantId = merchantId;
    }
    if (from != null) {
      this._from = from;
    }
    if (to != null) {
      this._to = to;
    }
    if (day != null) {
      this._day = day;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get merchantId => _merchantId;
  set merchantId(int? merchantId) => _merchantId = merchantId;
  String? get from => _from;
  set from(String? from) => _from = from;
  String? get to => _to;
  set to(String? to) => _to = to;
  int? get day => _day;
  set day(int? day) => _day = day;

  BusinessHours.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _merchantId = json['merchant_id'];
    _from = json['from'];
    _to = json['to'];
    _day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['merchant_id'] = this._merchantId;
    data['from'] = this._from;
    data['to'] = this._to;
    data['day'] = this._day;
    return data;
  }
}