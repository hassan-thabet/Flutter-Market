
import '../models/product.dart';
import '../utilities/api_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProductsApi{
  Map<String , String> headers = {'Accept' : 'application/json'};

  Future<List<Product>> fetchProducts() async {

    http.Response response = await http.get(Uri.parse(ApiHelper.PRODUCTS) , headers:headers);

    switch(response.statusCode){
      case 200:
        List<Product> products = [];
        var body = convert.jsonDecode(response.body);
        for(var item in body['data']){
          products.add(Product.fromJson(item));
        }
        return products;


      default:
        return throw('Error');

    }
  }
}