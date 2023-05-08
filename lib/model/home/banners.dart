import 'package:sapakem/model/home/merchant.dart';

class Banners {
  int? _id;
  String? _status;
  String? _startDate;
  String? _endDate;
  int? _merchantId;
  String? _bannerImg;
  Merchant? _merchant;

  Banners(
      {int? id,
      String? status,
      String? startDate,
      String? endDate,
      int? merchantId,
      String? bannerImg,
      Merchant? merchant}) {
    if (id != null) {
      this._id = id;
    }
    if (status != null) {
      this._status = status;
    }
    if (startDate != null) {
      this._startDate = startDate;
    }
    if (endDate != null) {
      this._endDate = endDate;
    }
    if (merchantId != null) {
      this._merchantId = merchantId;
    }
    if (bannerImg != null) {
      this._bannerImg = bannerImg;
    }
    if (merchant != null) {
      this._merchant = merchant;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get startDate => _startDate;
  set startDate(String? startDate) => _startDate = startDate;
  String? get endDate => _endDate;
  set endDate(String? endDate) => _endDate = endDate;
  int? get merchantId => _merchantId;
  set merchantId(int? merchantId) => _merchantId = merchantId;
  String? get bannerImg => _bannerImg;
  set bannerImg(String? bannerImg) => _bannerImg = bannerImg;
  Merchant? get merchant => _merchant;
  set merchant(Merchant? merchant) => _merchant = merchant;

  Banners.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _status = json['status'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _merchantId = json['merchant_id'];
    _bannerImg = json['banner_img'];
    _merchant = json['merchant'] != null
        ? new Merchant.fromJson(json['merchant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['status'] = this._status;
    data['start_date'] = this._startDate;
    data['end_date'] = this._endDate;
    data['merchant_id'] = this._merchantId;
    data['banner_img'] = this._bannerImg;
    if (this._merchant != null) {
      data['merchant'] = this._merchant!.toJson();
    }
    return data;
  }
}

