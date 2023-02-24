import 'dart:convert';

import 'package:api/api/api_setting.dart';
import 'package:api/model/user.dart';
import 'package:http/http.dart' as http;

class ApiAuthController {
  Future<User?> login({required String email, required String password}) async {
    var response = await http.post(Uri.parse(ApiSetting.login),
        body: {"email": email, "password": password});
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['object'];
      User user = User.fromJson(jsonResponse);
      return user;
    }
    return null;
  }

  Future<User?> register(
      {required String username,
      required String email,
      required String password}) async {
    var response = await http.post(Uri.parse(ApiSetting.register),
        body: {"email": email, "password": password, "full_name": username});
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      User user = User.fromJson(jsonResponse);
      return user;
    }
    return null;
  }
}
