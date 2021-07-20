
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_store/exceptions/exceptions.dart';
import 'package:flutter_store/models/cart.dart';
import 'package:flutter_store/utilities/api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class CartsApi{


  Future<Cart> fetchCart() async {
    final preferences = await SharedPreferences.getInstance();
    final key = 'api_token';
    final value = preferences.get(key) ?? null;

    Map<String, String> authHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value',
    };
    Dio().options.headers["Authorization"] = "Bearer $value";
    http.Response response = await http.get(
        Uri.parse(ApiHelper.CARTS),
        headers: authHeaders,
    );


    switch (response.statusCode) {
      case 200 :
        var body = jsonDecode(response.body);
          return Cart.fromJson(body);

      default:
        throw ResourcesNotFound('Cart');
    }
  }

  Future<bool> addProductToCart(int productId) async {
    final preferences = await SharedPreferences.getInstance();
    final key = 'api_token';
    final value = preferences.get(key) ?? null;

    Map<String, String> authHeaders =
    {
      'Accept': 'application/json',
      'Authorization' : 'Bearer $value',
    };

    Map<String,dynamic> body =
    {
      'product_id' : productId.toString(),
      'quantity' : 1.toString(),
    };

        http.Response response =
        await http.post(
            Uri.parse(ApiHelper.ADD_TO_CART),
            headers: authHeaders ,
            body: body);
        switch(response.statusCode)
        {
          case 200 :
            print('product added successfully');
            return true ;

          default :
            throw response.body;
        }
  }

  Future<bool> removeProductFromCart(int productId) async {
    final preferences = await SharedPreferences.getInstance();
    final key = 'api_token';
    final value = preferences.get(key) ?? null;

    Map<String, String> authHeaders =
    {
      'Accept': 'application/json',
      'Authorization' : 'Bearer $value',
    };

    Map<String,dynamic> body =
    {
      'product_id' : productId.toString(),
    };

    http.Response response =
    await http.post(
        Uri.parse(ApiHelper.REMOVE_FROM_CARTS + '/' + productId.toString()),
        headers: authHeaders ,
        body: body);
    switch(response.statusCode)
    {
      case 200 :
        print('product removed successfully');
        return true ;

      default :
        throw response.body;
    }
  }

  Future<bool> deleteProductFromCart(int productId) async {
    final preferences = await SharedPreferences.getInstance();
    final key = 'api_token';
    final value = preferences.get(key) ?? null;

    Map<String, String> authHeaders =
    {
      'Accept': 'application/json',
      'Authorization' : 'Bearer $value',
    };

    Map<String,dynamic> body =
    {
      'product_id' : productId.toString(),
    };

    http.Response response =
    await http.delete(
        Uri.parse(ApiHelper.DELETE_FROM_CARTS + '/' + productId.toString()),
        headers: authHeaders ,
        body: body);
    switch(response.statusCode)
    {
      case 200 :
        print('product fully Deleted successfully');
        return true ;

      default :
        throw response.statusCode;
    }
  }

}

