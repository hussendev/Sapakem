import 'package:logger/logger.dart';

class CityModel {
  bool? _status;
  String? _message;
  List<City>? _city;

  CityModel({bool? status, String? message, List<City>? city}) {
    if (status != null) {
      this._status = status;
    }
    if (message != null) {
      this._message = message;
    }
    if (city != null) {
      this._city = city;
    }
  }

  bool? get status => _status;
  set status(bool? status) => _status = status;
  String? get message => _message;
  set message(String? message) => _message = message;
  List<City>? get city => _city;
  set city(List<City>? city) => _city = city;

  CityModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    Logger().i(json['list']);
    if (json['list'] != null) {
      _city = <City>[];
      json['list'].forEach((v) {
        _city!.add(new City.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    if (this._city != null) {
      data['list'] = this._city!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  int? _id;
  String? _status;
  String? _name;

  City({int? id, String? status, String? name}) {
    if (id != null) {
      this._id = id;
    }
    if (status != null) {
      this._status = status;
    }
    if (name != null) {
      this._name = name;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get name => _name;
  set name(String? name) => _name = name;

  City.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _status = json['status'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['status'] = this._status;
    data['name'] = this._name;
    return data;
  }
}