import 'package:api/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static AppPreferences? _instance;
  late SharedPreferences sharedPreferences;
  AppPreferences._();

  factory AppPreferences() {
    return _instance ??= AppPreferences._();
  }

  Future initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future save(User user) async {
    await sharedPreferences.setBool("isLogged", true);
    await sharedPreferences.setString("name", user.fullName!);
    await sharedPreferences.setString("token", "Bearer ${user.token}");
  }

  bool get loggedIn => sharedPreferences.getBool("isLogged") ?? false;

  String get token => sharedPreferences.getString("token") ?? "";
}
