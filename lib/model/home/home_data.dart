import 'package:sapakem/model/home/titles.dart';

import 'banners.dart';
import 'categories.dart';
import 'home.dart';

class HomeData {
  List<Categories>? _categories;
  List<Banners>? _banners;
  List<Titles>? _titles;

  HomeData(
      {List<Categories>? categories,
        List<Banners>? banners,
        List<Titles>? titles}) {
    if (categories != null) {
      this._categories = categories;
    }
    if (banners != null) {
      this._banners = banners;
    }
    if (titles != null) {
      this._titles = titles;
    }
  }

  List<Categories>? get categories => _categories;
  set categories(List<Categories>? categories) => _categories = categories;
  List<Banners>? get banners => _banners;
  set banners(List<Banners>? banners) => _banners = banners;
  List<Titles>? get titles => _titles;
  set titles(List<Titles>? titles) => _titles = titles;

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      _categories = <Categories>[];
      json['categories'].forEach((v) {
        _categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      _banners = <Banners>[];
      json['banners'].forEach((v) {
        _banners!.add(new Banners.fromJson(v));
      });
    }
    if (json['titles'] != null) {
      _titles = <Titles>[];
      json['titles'].forEach((v) {
        _titles!.add(new Titles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._categories != null) {
      data['categories'] = this._categories!.map((v) => v.toJson()).toList();
    }
    if (this._banners != null) {
      data['banners'] = this._banners!.map((v) => v.toJson()).toList();
    }
    if (this._titles != null) {
      data['titles'] = this._titles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}