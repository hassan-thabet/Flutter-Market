
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_store/models/brand.dart';
import 'package:flutter_store/utilities/api_helper.dart';

class BrandsApi {
  Map<String, String> headers = {'Accept': 'application/json'};

  Future<List<Brand>> fetchBrands(String categoriId) async {
    String url = ApiHelper.BRANDS + '/' + categoriId;
    http.Response response = await http.get(url, headers: headers);

    switch (response.statusCode) {
      case 200:
        List<Brand> brand = [];
        var body = jsonDecode(response.body);
        for (var item in body['data']) {
          brand.add(Brand.fromJson(item));
        }
        return brand;
        break;

      default:
        return null;
        break;
    }
  }
}