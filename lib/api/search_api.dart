import 'package:flutter_store/models/product.dart';
import 'package:flutter_store/utilities/api_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SearchApi {
  Map<String, String> headers = {'Accept': 'application/json'};

  Future<List<Product>> fetchSearch(String data) async
  {
    http.Response response = await http.get(
      Uri.parse(ApiHelper.SEARCH + '/' + data),
      headers: headers,
    );

    switch (response.statusCode) {
      case 200:
        List<Product> products = [];
        var body = convert.jsonDecode(response.body);
        for (var item in body['data']) {
          products.add(Product.fromJson(item));
        }
        return products;

      default:
        return throw ('Error');
    }
  }
}