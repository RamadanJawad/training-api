import 'dart:convert';
import 'dart:io';
import 'package:api/api/api_response.dart';
import 'package:api/api/api_setting.dart';
import 'package:api/model/category.dart';
import 'package:api/model/country.dart';
import 'package:api/model/product.dart';
import 'package:api/model/search.dart';
import 'package:api/model/student.dart';
import 'package:api/model/student_image.dart';
import 'package:api/model/user_image.dart';
import 'package:api/save_data.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiReadData {
  Future<List<Student>> readUsers() async {
    var response = await http.get(Uri.parse(ApiSetting.users));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['data'] as List;
      return jsonArray
          .map((jsonObject) => Student.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<List<Categorys>> readCategory() async {
    var response = await http.get(Uri.parse(ApiSetting.categories));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['data'] as List;
      return jsonArray.map((e) => Categorys.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<Product>> readProducts(int id) async {
    var response =
        await http.get(Uri.parse(ApiSetting.getCategoryProductUrl(id)));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['data'] as List;
      return jsonArray.map((e) => Product.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<UserImage>> readImagesByUser(int id) async {
    var response = await http.get(Uri.parse(ApiSetting.getUserImagesUrl(id)));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['data'] as List;
      return jsonArray.map((e) => UserImage.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<Country>> readCountries() async {
    var response = await http.get(Uri.parse(ApiSetting.countries));
    if (response.statusCode == 200) {
      var json = response.body;
      return countryFromJson(json);
    }
    return [];
  }

  Future<List<Search>> searchUser({required String name}) async {
    var response = await http
        .post(Uri.parse(ApiSetting.search), body: {"first_name": name});
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['data'] as List;
      return jsonArray.map((e) => Search.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<StudentImage>> readImages() async {
    var response = await http
        .get(Uri.parse(ApiSetting.images.replaceFirst('/{id}', '')), headers: {
      HttpHeaders.authorizationHeader: AppPreferences().token,
      HttpHeaders.acceptHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['data'] as List;
      return jsonArray.map((e) => StudentImage.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<ApiResponse<StudentImage>> uploadImages({required String path}) async {
    var response = http.MultipartRequest(
        'POST', Uri.parse(ApiSetting.images.replaceFirst('/{id}', '')));
    var file = await http.MultipartFile.fromPath('image', path);
    response.files.add(file);
    response.headers[HttpHeaders.acceptHeader] = 'application/json';
    response.headers[HttpHeaders.authorizationHeader] = AppPreferences().token;
    var request = await response.send();
    if (request.statusCode == 201 || request.statusCode == 400) {
      var body = await request.stream.transform(utf8.decoder).first;
      var jsonResponse = jsonDecode(body);
      var apiResponse = ApiResponse<StudentImage>(
          message: jsonResponse['message'], success: jsonResponse['status']);
      if (request.statusCode == 201) {
        StudentImage image = StudentImage.fromJson(jsonResponse['object']);
        apiResponse.object = image;
      }
      return apiResponse;
    }
    return ApiResponse<StudentImage>(
        message: "Something went wrong", success: false);
  }
}
