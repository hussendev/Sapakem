import 'merchant.dart';

class Titles {
  int? _id;
  String? _status;
  String? _title;
  List<Merchant>? _merchants;

  Titles({int? id, String? status, String? title, List<Merchant>? merchants}) {
    if (id != null) {
      this._id = id;
    }
    if (status != null) {
      this._status = status;
    }
    if (title != null) {
      this._title = title;
    }
    if (merchants != null) {
      this._merchants = merchants;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get title => _title;
  set title(String? title) => _title = title;
  List<Merchant>? get merchants => _merchants;
  set merchants(List<Merchant>? merchants) => _merchants = merchants;

  Titles.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _status = json['status'];
    _title = json['title'];
    if (json['merchants'] != null) {
      _merchants = <Merchant>[];
      json['merchants'].forEach((v) {
        _merchants!.add(new Merchant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['status'] = this._status;
    data['title'] = this._title;
    if (this._merchants != null) {
      data['merchants'] = this._merchants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



