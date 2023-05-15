// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:sapakem/api/controller/api_controller.dart';
import 'package:sapakem/model/home/merchant.dart';
import 'package:sapakem/model/home/status_merchant.dart';
import 'package:sapakem/util/context_extenssion.dart';

import '../../../model/home/home.dart';
import '../../../prefs/shared_pref_controller.dart';
import '../../api_setting.dart';

class HomeApiController {
  ApiController apiController = ApiController();

  Future<HomeResponse> getHomeData({bool isRefresh = false,required BuildContext context}) async {
    var data = await apiController.get(Uri.parse(ApiSettings.home),
        headers: {
          HttpHeaders.authorizationHeader:
              SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
          'X-Requested-With': 'XMLHttpRequest',
          'Accept': 'application/json'
        },
        timeToLive: 10,
        withoutToast: true,
        isRefresh: isRefresh);
    if(data!['message'] == 'api.unauthenticated'){
      context.showSnackBar(message: 'Session Expired Please Login Again',error: true);
      Navigator.pushReplacementNamed(
          context, '/login_screen',
      );
      return Future.error('Session Expired');
    }
    HomeResponse home = HomeResponse.fromJson(data);
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

    Logger().i(data);

    List<Merchant> merchants =
        (data!['list'] as List).map((e) => Merchant.fromJson(e)).toList();
    return merchants;
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
  }

  Future<Merchant> getMerchant(int id, {bool isRefresh = false}) async {
    var data = await apiController.get(
      Uri.parse(ApiSettings.merchant + id.toString()),
      headers: {
        HttpHeaders.authorizationHeader:
            SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        'X-Requested-With': 'XMLHttpRequest',
        'Accept': 'application/json'
      },
      timeToLive: 3,
      withoutToast: true,
      isRefresh: isRefresh,
    );

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

  Future<Map<String, dynamic>> sendRequestForMerchant(
      {required BuildContext context, required String merchantId}) async {
    context.showIndicator();
    dynamic response = await ApiController().post(
      Uri.parse(ApiSettings.request_post),
      context: context,
      body: {
        'merchant_id': merchantId,
      },
      headers: {
        HttpHeaders.authorizationHeader:
            SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        'X-Requested-With': 'XMLHttpRequest',
        'Accept': 'application/json',
      },
    );
    Navigator.pop(context);
    return response;
  }

  Future<StatusMerchantFriend> getStatusMerchantFriend(
      {required BuildContext context, required String merchantId}) async {
    dynamic response = await ApiController().get(
      Uri.parse(ApiSettings.getStatusMerchant + merchantId),
      headers: {
        HttpHeaders.authorizationHeader:
            SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        'X-Requested-With': 'XMLHttpRequest',
        'Accept': 'application/json',
      },
    );
    return StatusMerchantFriend.fromJson(response);
  }
}
