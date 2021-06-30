import 'package:dio/dio.dart';
import 'package:flutter_store/exceptions/exceptions.dart';
import 'package:flutter_store/models/user.dart';
import 'package:flutter_store/utilities/api_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';
import 'dart:convert';

 class Authentication {


  Map<String, String> headers = {
    'Accept': 'application/json',
  };
  var status;


  Future<User> login(String email, String password) async {
    Map<String, String> body = {'email': email, 'password': password};


      http.Response response = await http.post(
        ApiHelper.AUTH_LOGIN,
        headers: headers,
        body: body,
      );

    status = response.body.contains('error');
    var data = json.decode(response.body);
    if (status) {
      print('data : ${data["error"]}');
    } else {
      print("login done successfully");
    }

    switch (response.statusCode) {
      case 200:
        var body = convert.jsonDecode(response.body);
        print(body);
        return User.fromJson(data);
        break;

      case 401:
        throw LoginField('Credentials Rejected');
        break;

      default:
        return null;
        break;
    }
  }



  Future<User> register(
      String firstName , String lastName,
      String email ,
      String password ,

      ) async {
    FormData body =
    new FormData.fromMap({
      "first_name" : firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
    });


    Response response = await Dio().post(
      ApiHelper.AUTH_REGISTER,
      data: body,
    );

    status = response.statusCode ;


    switch (response.statusCode) {
      case 201:

        var body = response.data;
        print(body);

        return null;
        break;

      case 422:
        throw MissingFields();
        break;
      case 500:
        throw LoginField('Sign Up Field');
        break;
      default:
        return null;
        break;
    }
  }

 }
