import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:sapakem/api/api_setting.dart';
import 'package:sapakem/model/process_response.dart';
import 'package:sapakem/model/user.dart';
import 'package:sapakem/model/user_register.dart';
import 'package:sapakem/prefs/shared_pref_controller.dart';
import 'package:sapakem/util/helpers.dart';
import 'package:http/http.dart' as http;

class UsersApiController with Helpers{
  // login
  Future<ProcessResponse> login(
      {required String mobile, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.login);
    var response =
    await http.post(uri, body: {'mobile': mobile, 'password': password});

    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      if (response.statusCode != 400) {
        User user = User.fromJson(json);
        //TODO save user in shared preferences
        SharedPrefController().save(user);
        return ProcessResponse(message: json['message'], success: json['status']);
      }
      return ProcessResponse(message: json['message']);
    }

    return errorResponse;
  }

  Future<ProcessResponse> register(UserRegister user) async {
    Uri uri = Uri.parse(ApiSettings.register);
    var response = await http.post(uri, body: {
      'name': user.name,
      'email': user.email,
      'mobile': user.mobile.toString(),
      'password': user.password.toString(),
      'fcm_token': user.fcmToken,
      'device_type': user.deviceType.toString(),
      "lat":user.lat.toString(),
      "lng":user.lng.toString(),
    });
    if (response.statusCode == 201 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      var log=Logger();
      log.e(json);
      log.v(user.lng.toString());
      log.v(user.lat.toString());
      if(response.statusCode !=400){
        SharedPrefController().saveOtp( json['code'].toString());

        return ProcessResponse(
            message: json['message'] + ' ' + json['code'].toString(),
            success: json['status']);
      }
      return ProcessResponse(
          message: json['message'],
          success: json['status']);
    }
    return errorResponse;
  }



  Future<ProcessResponse> activate(
      {required int mobile, required int code}) async {
    Uri uri = Uri.parse(ApiSettings.activate);
    var response = await http.post(uri, body: {
      'mobile': mobile.toString(),
      'code': code.toString(),
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ProcessResponse(message: json['message'], success: json['status']);
    }

    return errorResponse;
  }


  //
  //
  // Future<ProcessResponse> logout() async {
  //   String token =
  //   SharedPrefController().getValueFor<String>(PrefKeys.token.name)!;
  //   Uri uri = Uri.parse(ApiSettings.logout);
  //   var response = await http.get(uri, headers: {
  //     HttpHeaders.authorizationHeader: token,
  //     HttpHeaders.acceptHeader: 'application/json',
  //   });
  //
  //   if (response.statusCode == 200 || response.statusCode == 400) {
  //     var json = jsonDecode(response.body);
  //     SharedPrefController().clear();
  //
  //     return ProcessResponse(message: json['message'], success: json['status']);
  //   }
  //
  //   return errorResponse;
  // }
  //
  // Future<List<City>> getCities() async {
  //   Uri uri = Uri.parse(ApiSettings.cities);
  //   var response = await http
  //       .get(uri, headers: {HttpHeaders.acceptHeader: 'application/json'});
  //   print(response.statusCode);
  //   if (response.statusCode == 200 || response.statusCode == 400) {
  //     var json = jsonDecode(response.body);
  //     var jsonDataObject = json['list'] as List;
  //     return jsonDataObject
  //         .map((jsonObject) => City.fromJson(jsonObject))
  //         .toList();
  //   }
  //   return [];
  // }
  //
  //
  // Future<Home> getHome() async {
  //   var response = await http.get(Uri.parse(ApiSettings.home), headers: {
  //     HttpHeaders.authorizationHeader:
  //     SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
  //     'X-Requested-With': 'XMLHttpRequest',
  //     'Accept': 'application/json'
  //   });
  //   if (response.statusCode == 200 || response.statusCode == 400) {
  //     var json = jsonDecode(response.body);
  //     var jsonDataObject = jsonDecode(response.body)['data'];
  //     Home home = Home.fromJson(jsonDataObject);
  //     return home;
  //   }
  //   return Home();
  // }
  //

  //
  // Future<ProcessResponse> changePassword(
  //     {required int current_password,
  //       required int new_password,
  //       required int new_password_confirmation}) async {
  //   Uri uri = Uri.parse(ApiSettings.changepassword);
  //   var response = await http.post(uri, headers: {
  //     HttpHeaders.authorizationHeader:
  //     SharedPrefController().getValueFor<String>(PrefKeys.token.name)!
  //   }, body: {
  //     'current_password': current_password.toString(),
  //     'new_password': new_password.toString(),
  //     'new_password_confirmation': new_password_confirmation.toString(),
  //   });
  //   if (response.statusCode == 200 || response.statusCode == 400) {
  //     var json = jsonDecode(response.body);
  //     return ProcessResponse(message: json['message'], success: json['status']);
  //   }
  //
  //   return errorResponse;
  // }
  //
  // Future<ProcessResponse> forgetPassword({required int mobile}) async {
  //   Uri uri = Uri.parse(ApiSettings.forgetpassword);
  //   var response = await http.post(uri, body: {
  //     'mobile': mobile.toString(),
  //   });
  //   if (response.statusCode == 200 || response.statusCode == 400) {
  //     var json = jsonDecode(response.body);
  //     return ProcessResponse(
  //         message: json['message'] + ' ' + json['code'].toString(),
  //         success: json['status']);
  //   }
  //
  //   return errorResponse;
  // }
  //
  // Future<ProcessResponse> resetPassword( {required int mobile,
  //   required int code,
  //   required int password,
  //   required int password_confirmation}) async {
  //   Uri uri = Uri.parse(ApiSettings.resetpassword);
  //   var response = await http.post(uri, body: {
  //     'mobile': mobile.toString(),
  //     'code': code.toString(),
  //     'password': password.toString(),
  //     'password_confirmation': password_confirmation.toString(),
  //   });
  //   print(response.body);
  //   if (response.statusCode == 200 || response.statusCode == 400) {
  //     var json = jsonDecode(response.body);
  //     return ProcessResponse(
  //         message: json['message'] + ' ' + json['code'].toString(),
  //         success: json['status']);
  //   }
  //   return errorResponse;
  // }
  //
  // Future<ProcessResponse> updateProfile(
  //     {required String name,
  //       required String gender,
  //       required String city_id}) async {
  //   Uri uri = Uri.parse(ApiSettings.updateprofile);
  //   var response = await http.post(uri, body: {
  //     'name': name,
  //     'gender': gender,
  //     'city_id': city_id.toString(),
  //   }, headers: {
  //     HttpHeaders.authorizationHeader:
  //     SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
  //     'X-Requested-With': 'XMLHttpRequest',
  //     'Accept': 'application/json'
  //   });
  //   print(response.body);
  //   if (response.statusCode == 200 || response.statusCode == 400) {
  //     //TODO save user in shared preferences
  //     SharedPrefController().removeValueFor(PrefKeys.name.name);
  //     SharedPrefController().removeValueFor(PrefKeys.city_id.name);
  //     SharedPrefController().removeValueFor(PrefKeys.gender.name);
  //
  //     SharedPrefController().saveChangeProfile(name: name, city_id: city_id, gender: gender);
  //     var json = jsonDecode(response.body);
  //     return ProcessResponse(message: json['message'], success: json['status']);
  //   }
  //   return errorResponse;
  // }
}