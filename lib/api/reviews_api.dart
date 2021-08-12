

import 'package:flutter_store/constants/api_helper.dart';
import 'package:flutter_store/models/review.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';


class ReviewsApi {
  Map<String, String> headers = {'Accept': 'application/json'};

  Future<List<Review>> fetchReviews(String productID) async {
    http.Response response = await http.get(
      Uri.parse(ApiHelper.PRODUCT_REVIEWS + '/' + productID),
      headers: headers,
    );

    switch (response.statusCode) {
      case 200:
        List<Review> reviews = [];
        var body = convert.jsonDecode(response.body);
        for (var item in body['data']) {
          reviews.add(Review.fromJson(item));
        }
        return reviews;

      default:
        return throw ('Error');
    }
  }

  Future<bool> createReview(int productId , double rate , String comment) async
  {
    final preferences = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = preferences.get(key) ?? null;

    Map<String,dynamic> body =
    {
      'product_id' : productId.toString(),
      'rate' : rate.toString(),
      'comment' : comment.toString(),
      'user_id' : value.toString(),
    };


    print(body.toString());
      http.Response response = await http.post(
        Uri.parse(ApiHelper.CREATE_REVIEW),
        body: body,
      );
    if (response.statusCode == 201)
    {
      print('Your comment added successfully');
      return true ;
    }else
      {
        print(body);
        throw response.statusCode;
      }




  }
}