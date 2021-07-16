import 'package:dio/dio.dart';
import 'package:flutter_store/exceptions/exceptions.dart';
import 'package:flutter_store/models/user.dart';
import 'package:flutter_store/utilities/api_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';
import 'dart:convert';

class Authentication {
  Map<String, String> headers = {
    'Accept': 'application/json',
  };
  var status;

  Future<User> login(
      String email,
      String password,
      ) async {
    Map<String, String> body = {'email': email, 'password': password};
    http.Response response = await http.post(
      Uri.parse(ApiHelper.AUTH_LOGIN),
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
        var data = body['data'];
        User? user = User.fromJson(data);

        await _saveUserData(
            true ,
            user.id,
            user.apiToken,
            user.firstName,
            user.lastName ,
            user.email,
            user.image,
        );

        return user;

      case 401:
        throw LoginField('Credentials Rejected');

      default:
        return throw ('Credentials Rejected');
    }
  }

  Future<User> register(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    FormData body = new FormData.fromMap({
      "first_name": firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
    });

    Response response = await Dio().post(
      ApiHelper.AUTH_REGISTER,
      data: body,
    );

    status = response.statusCode;

    switch (response.statusCode) {
      case 201:
        var body = response.data;

        var data = body['data'];
        User? user = User.fromJson(data);
        await _saveUserData(
          true ,
          user.id,
          user.apiToken,
          user.firstName,
          user.lastName ,
          user.email,
          user.image,
        );
        print('data saved successfully in sharedPreferences');

        return body;

      case 422:
        throw MissingFields();

      case 500:
        throw LoginField('Sign Up Field');

      default:
        return throw ('Sign Up Field');
    }
  }

  Future<void> _saveUserData(
      bool? isAuth ,
      int? id,
      String? apiToken,
      String? firstName,
      String? lastName,
      String? email ,
      String? image ,
      ) async {

    final preferences = await SharedPreferences.getInstance();
    preferences.setBool('authenticated', isAuth!);
    preferences.setInt('user_id', id!);
    preferences.setString('api_token', apiToken!);
    preferences.setString('first_name', firstName!);
    preferences.setString('last_name', lastName!);
    preferences.setString('email', email!);

    if (image != null)
    {
      preferences.setString('image', image);
    }else{print('don\'t Have image');}



    print('save data in pref done successfully');
  }
}
