import 'dart:convert';
import 'package:api/api/api_setting.dart';
import 'package:api/model/category.dart';
import 'package:api/model/product.dart';
import 'package:api/model/student.dart';
import 'package:http/http.dart' as http;

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
    var response = await http.get(Uri.parse(ApiSetting.getCategoryProductUrl(id)));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['data'] as List;
      return jsonArray.map((e) => Product.fromJson(e)).toList();
    }
    return [];
  }
}
