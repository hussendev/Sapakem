import 'home_data.dart';

class HomeResponse {
  bool? _status;
  String? _message;
  HomeData? _homeData;

  HomeResponse({bool? status, String? message, HomeData? homeData}) {
    if (status != null) {
      this._status = status;
    }
    if (message != null) {
      this._message = message;
    }
    if (homeData != null) {
      this._homeData = homeData;
    }
  }

  bool? get status => _status;
  set status(bool? status) => _status = status;
  String? get message => _message;
  set message(String? message) => _message = message;
  HomeData? get homeData => _homeData;
  set homeData(HomeData? homeData) => _homeData = homeData;

  HomeResponse.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _homeData = json['data'] != null
        ? new HomeData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    if (this._homeData != null) {
      data['data'] = this._homeData!.toJson();
    }
    return data;
  }
}







