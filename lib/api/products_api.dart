import 'dart:convert';

import 'package:flutter_store/exceptions/exceptions.dart';

import '../models/product.dart';
import '../utilities/api_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProductsApi {
  Map<String, String> headers = {'Accept': 'application/json'};

  Future<List<Product>> fetchProducts() async {
    http.Response response = await http.get(
      Uri.parse(ApiHelper.PRODUCTS),
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

  Future<List<Product>> fetchProductsBySubcategory(String subcategoryId) async {
    http.Response response = await http.get(
        Uri.parse(ApiHelper.SUBCATEGORY_PRODUCTS + '/' + subcategoryId),
        headers: headers);

    switch (response.statusCode) {
      case 200:
        List<Product> subcategoryProducts = [];
        var body = jsonDecode(response.body);
        for (var item in body['data']) {
          subcategoryProducts.add(Product.fromJson(item));
        }
        return subcategoryProducts;

      case 404:
        throw ResourcesNotFound('Products');

      default:
        return throw ('Error');
    }
  }

  Future<List<Product>> fetchProductsByBrand(String brandId) async {
    http.Response response = await http.get(
        Uri.parse(ApiHelper.BRAND_PRODUCTS + '/' + brandId),
        headers: headers);

    switch (response.statusCode) {
      case 200:
        List<Product> brandProducts = [];
        var body = jsonDecode(response.body);
        for (var item in body['data']) {
          brandProducts.add(Product.fromJson(item));
        }
        return brandProducts;

      case 404:
        throw ResourcesNotFound('Products');

      default:
        return throw ('Error');
    }
  }
}
