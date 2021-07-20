import 'package:dio/dio.dart';
import 'package:flutter_store/models/brand.dart';
import 'package:flutter_store/utilities/api_helper.dart';

class BrandsApi {
  // Map<String, String> headers = {'Accept': 'application/json'};

  Future<List<Brand>> fetchBrands(String categoryId)
  async {
    Response response = await Dio().get(
        ApiHelper.BRANDS + '/' + categoryId
    );
    switch (response.statusCode) {
      case 200:
        List<Brand> brand = [];
        var body = response.data;
        for (var item in body['data']) {
          brand.add(Brand.fromJson(item));
        }
        return brand;
      default:
        return throw ('Error');
    }
  }
}
