import 'package:logger/logger.dart';
import 'package:sapakem/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys {
  language,
  id,
  mobile,
  active,
  verified,
  email,
  name,
  loggedIn,
  token,
  fcmToken,
  deviceType,
  lat,
  lng,
  otp,
  cityName,
  image,
}

class SharedPrefController {
  SharedPrefController._();

  late SharedPreferences _sharedPreferences;
  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void save(User user) {
    _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    _sharedPreferences.setString(
        PrefKeys.id.name, user.userData!.id!.toString());
    _sharedPreferences.setString(PrefKeys.name.name, user.userData!.name!);
    _sharedPreferences.setString(PrefKeys.email.name, user.userData!.email!);
    _sharedPreferences.setString(PrefKeys.mobile.name, user.userData!.mobile!);
    _sharedPreferences.setString(
        PrefKeys.lat.name, user.userData!.lat.toString() );
    _sharedPreferences.setString(
        PrefKeys.lng.name, user.userData!.lng.toString());
    _sharedPreferences.setString(PrefKeys.active.name, user.userData!.status!);
    _sharedPreferences.setString(
        PrefKeys.token.name, 'Bearer ${user.userData!.token!}');
    _sharedPreferences.setString(
        PrefKeys.cityName.name, user.userData!.cityName!);
    _sharedPreferences.setString(PrefKeys.image.name, user.userData!.image ?? '');

  }

  void savePhone(String mobile) {
    _sharedPreferences.setString(PrefKeys.mobile.name, mobile);
  }

  saveToken(String token) async {
    await _sharedPreferences.setString(PrefKeys.token.name, 'Bearer $token');
  }

  saveLanguage(String language) async {
    await _sharedPreferences.setString(PrefKeys.language.name, language);
  }

  void saveFcmTokenAndLatLongAndDeviceType(
      {required String fcmToken,
      required double lat,
      required double lng,
      required int deviceType}) {
    _sharedPreferences.setString(PrefKeys.fcmToken.name, fcmToken);
    _sharedPreferences.setString(PrefKeys.lat.name, lat.toString());
    _sharedPreferences.setString(PrefKeys.lng.name, lng.toString());
    _sharedPreferences.setString(
        PrefKeys.deviceType.name, deviceType.toString());
  }

  void saveOtp(String otp) {
    _sharedPreferences.setString(PrefKeys.otp.name, otp);
  }

  void changeLanguage({required String langCode}) {
    _sharedPreferences.setString(PrefKeys.language.name, langCode);
  }

  T? getValueFor<T>(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  Future<bool> removeValueFor(String key) async {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.remove(key);
    }
    return false;
  }

  void clearUser() {
    _sharedPreferences.remove(PrefKeys.loggedIn.name);
    _sharedPreferences.remove(PrefKeys.id.name);
    _sharedPreferences.remove(PrefKeys.name.name);
    _sharedPreferences.remove(PrefKeys.email.name);
    _sharedPreferences.remove(PrefKeys.mobile.name);
    _sharedPreferences.remove(PrefKeys.active.name);
    _sharedPreferences.remove(PrefKeys.token.name);
    _sharedPreferences.remove(PrefKeys.lat.name);
    _sharedPreferences.remove(PrefKeys.lng.name);
    _sharedPreferences.remove(PrefKeys.cityName.name);
    _sharedPreferences.remove(PrefKeys.image.name);
    
  }

  void updateProfile(
      {required String name, required String email, required String mobile}) {
    _sharedPreferences.setString(PrefKeys.name.name, name);
    _sharedPreferences.setString(PrefKeys.email.name, email);
    _sharedPreferences.setString(PrefKeys.mobile.name, mobile);
  }
}
