import 'package:dio/dio.dart';
import 'package:flutter_store/constants/exceptions.dart';
import 'package:flutter_store/models/user.dart';
import 'package:flutter_store/constants/api_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Authentication {

  var status;
  Future<User> login(
      String email,
      String password,
      ) async {

    FormData body = new FormData.fromMap({
      "email": email,
      'password': password,
    });
    Response response = await Dio().post(
      ApiHelper.AUTH_LOGIN,
      data: body,
    );
    status = response.statusCode;
    switch (response.statusCode) {
      case 200:
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
        print('user logged in successfully');
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
