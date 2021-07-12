import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  read() async
  {
    final preferences = await SharedPreferences.getInstance();
    final key = 'authenticated';
    final value = preferences.get(key) ?? null;
    if (value == true)
    {
      Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.id, (route) => false);
    }else
      {
        Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
      }
  }

  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 4),
            () => read()
    );

    return Scaffold(
      backgroundColor: AppColors.M_app_main_color,
      body: Container(
        //color: KBackgroundColor,
        child: Center(
            child: SizedBox(
          height: 80,
          width: 80,
          child:
          Image.asset(
            'assets/icons/m.png',
            scale: 5,
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
