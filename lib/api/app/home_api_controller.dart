import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:sapakem/model/home/merchant.dart';

import '../../model/home/home.dart';
import '../../prefs/shared_pref_controller.dart';
import '../api_setting.dart';
class HomeApiController {


  Future<HomeResponse> getHomeData() async {
      var response = await http.get(Uri.parse(ApiSettings.home), headers: {
        HttpHeaders.authorizationHeader:
        SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        'X-Requested-With': 'XMLHttpRequest',
        'Accept': 'application/json'
      });

      if (response.statusCode == 200 || response.statusCode == 400) {
        if(response.statusCode !=400) {
          var json = jsonDecode(response.body);
          HomeResponse home = HomeResponse.fromJson(json);


          return home;
        }
      }
      return HomeResponse();
    }





  Future<List<Merchant>> getMerchantByCategory(int categoryId) async {
    var response = await http.get(Uri.parse(ApiSettings.basedUrl + 'categories/'+categoryId.toString()+ApiSettings.merchant), headers: {
      HttpHeaders.authorizationHeader:
      SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
      'X-Requested-With': 'XMLHttpRequest',
      'Accept': 'application/json'
    });
    // Logger().i(response.statusCode );
    if (response.statusCode == 200 || response.statusCode == 400) {
      if(response.statusCode !=400) {
        var json = jsonDecode(response.body);
        List<Merchant> merchants = (json['object'] as List).map((e) => Merchant.fromJson(e)).toList();

        return merchants;
      }
    }
    return [];
  }


  Future<List<Merchant>> getMerchants() async {

    var response = await http.get(Uri.parse(ApiSettings.merchant), headers: {
      HttpHeaders.authorizationHeader:
      SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
      'X-Requested-With': 'XMLHttpRequest',
      'Accept': 'application/json'
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      if(response.statusCode !=400) {
        var json = jsonDecode(response.body);
        List<Merchant> merchants = (json['object'] as List).map((e) => Merchant.fromJson(e)).toList();
        return merchants;
      }
    }
    return [];


  }

}