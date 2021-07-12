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

  Future<User> login(String email, String password) async {
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

        _saveAuth(true);
        await _saveUserData(user.id , user.apiToken , user.email , user.firstName , user.lastName);
        return user;


      case 401:
        throw LoginField('Credentials Rejected');


      default:
        return throw('Credentials Rejected');

    }
  }


  Future<User> register(String firstName , String lastName, String email , String password ,) async {
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

        return body;


      case 422:
        throw MissingFields();

      case 500:
        throw LoginField('Sign Up Field');

      default:
        return throw('Sign Up Field');

    }
  }



  _saveAuth(bool isAuth) async {
    final preferences = await SharedPreferences.getInstance();
    final key = 'authenticated';
    final value = isAuth;
    preferences.setBool(key, value);
  }

  Future<void> _saveUserData (int? id , String? apiToken, String? firstName , String? lastName , String? email) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt('user_id', id!);
    preferences.setString('api_token', apiToken!);
    preferences.setString('first_name', firstName!);
    preferences.setString('last_name', lastName!);
    preferences.setString('email', email!);
    // preferences.setString('image', image!);
    print('ID is $id  and its saved in shared preferences in key user_id');
  }
 }
