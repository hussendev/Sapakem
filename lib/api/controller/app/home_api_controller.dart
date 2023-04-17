import 'dart:io';

import 'package:sapakem/api/api_controller.dart';
import 'package:sapakem/model/home/merchant.dart';

import '../../../model/home/home.dart';
import '../../../prefs/shared_pref_controller.dart';
import '../../api_setting.dart';

class HomeApiController {
  ApiController apiController = ApiController();

  Future<HomeResponse> getHomeData() async {
    var data = await apiController.get(Uri.parse(ApiSettings.home),
        headers: {
          HttpHeaders.authorizationHeader:
              SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
          'X-Requested-With': 'XMLHttpRequest',
          'Accept': 'application/json'
        },
        timeToLive: 10,
        withoutToast: true);

    HomeResponse home = HomeResponse.fromJson(data!);
    return home;
  }

  Future<List<Merchant>> getMerchantByCategory(int categoryId) async {
    var data = await apiController.get(
        Uri.parse('${ApiSettings.basedUrl}categories/$categoryId/merchants'),
        headers: {
          HttpHeaders.authorizationHeader:
              SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
          'X-Requested-With': 'XMLHttpRequest',
          'Accept': 'application/json'
        },
        timeToLive: 10,
        withoutToast: true);

    List<Merchant> merchants =
        (data!['object'] as List).map((e) => Merchant.fromJson(e)).toList();
    return merchants;

    // String url = ApiSettings.basedUrl +
    //     'categories/' +
    //     categoryId.toString() +
    //     '/merchants';
    // var response = await http.get(Uri.parse(url), headers: {
    //   HttpHeaders.authorizationHeader:
    //       SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
    //   'X-Requested-With': 'XMLHttpRequest',
    //   'Accept': 'application/json'
    // });
    // Logger().i(url);
    // if (response.statusCode == 200 || response.statusCode == 400) {
    //   if (response.statusCode != 400) {
    //     var json = jsonDecode(response.body);
    //     List<Merchant> merchants =
    //         (json['object'] as List).map((e) => Merchant.fromJson(e)).toList();
    //
    //     return merchants;
    //   }
    // }
    // return [];
  }

  Future<List<Merchant>> getMerchants() async {
    var data = await apiController.get(Uri.parse(ApiSettings.merchant),
        headers: {
          HttpHeaders.authorizationHeader:
              SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
          'X-Requested-With': 'XMLHttpRequest',
          'Accept': 'application/json'
        },
        timeToLive: 10,
        withoutToast: true);

    List<Merchant> merchants =
        (data!['object'] as List).map((e) => Merchant.fromJson(e)).toList();
    return merchants;

    // var response = await http.get(Uri.parse(ApiSettings.merchant), headers: {
    //   HttpHeaders.authorizationHeader:
    //       SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
    //   'X-Requested-With': 'XMLHttpRequest',
    //   'Accept': 'application/json'
    // });
    // if (response.statusCode == 200 || response.statusCode == 400) {
    //   if (response.statusCode != 400) {
    //     var json = jsonDecode(response.body);
    //     List<Merchant> merchants =
    //         (json['object'] as List).map((e) => Merchant.fromJson(e)).toList();
    //     return merchants;
    //   }
    // }
    // return [];
  }

  Future<Merchant> getMerchant(int id) async {
    var data =
        await apiController.get(Uri.parse(ApiSettings.merchant + id.toString()),
            headers: {
              HttpHeaders.authorizationHeader: SharedPrefController()
                  .getValueFor<String>(PrefKeys.token.name)!,
              'X-Requested-With': 'XMLHttpRequest',
              'Accept': 'application/json'
            },
            timeToLive: 10,
            withoutToast: true);

    Merchant merchant = Merchant.fromJson(data!['object']);
    return merchant;
    // var response = await http
    //     .get(Uri.parse(ApiSettings.merchant + id.toString()), headers: {
    //   HttpHeaders.authorizationHeader:
    //       SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
    //   'X-Requested-With': 'XMLHttpRequest',
    //   'Accept': 'application/json'
    // });
    // Logger().i(ApiSettings.merchant + id.toString());
    // if (response.statusCode == 200 || response.statusCode == 400) {
    //   if (response.statusCode != 400) {
    //     var json = jsonDecode(response.body);
    //     Merchant merchant = Merchant.fromJson(json['object']);
    //     return merchant;
    //   }
    // }
    // return Merchant();
  }
}
