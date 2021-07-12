import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_store/exceptions/exceptions.dart';
import 'package:flutter_store/models/category.dart';
import 'package:flutter_store/utilities/api_helper.dart';

class CategoriesApi {
  Map<String, String> headers = {'Accept': 'application/json'};

  Future<List<Category>> fetchCategories() async {

    http.Response response = await http.get(Uri.parse(ApiHelper.CATEGORIES), headers: headers);

    switch (response.statusCode) {
      case 200:
        List<Category> category = [];
        var body = jsonDecode(response.body);
        for (var item in body['data']) {
          category.add(Category.fromJson(item));
        }
        return category;


      case 404:
        throw ResourcesNotFound('Categories');


      default:
        return throw('Error');

    }
  }
}