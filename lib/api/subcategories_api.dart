import 'dart:convert';
import 'package:flutter_store/exceptions/exceptions.dart';
import 'package:flutter_store/models/subcategory.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_store/utilities/api_helper.dart';

class SubcategoriesApi {
  Map<String, String> headers = {'Accept': 'application/json',};

  Future<List<Subcategory>> fetchSubcategories(String categoryId) async {
    http.Response response = await http.get(Uri.parse(ApiHelper.SUBCATEGORIES + '/' + categoryId), headers: headers);

    switch (response.statusCode) {
      case 200:
        List<Subcategory> subcategory = [];
        var body = jsonDecode(response.body);
        for (var item in body['data']) {
          subcategory.add(Subcategory.fromJson(item));
        }
        return subcategory;


      case 404:
        throw ResourcesNotFound('Products');


      default:
        return throw('Error');

    }
  }
}
