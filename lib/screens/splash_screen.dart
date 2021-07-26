import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';


class SplashScreen extends StatelessWidget {
  static String id = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    read() async {
      final preferences = await SharedPreferences.getInstance();
      final key = 'authenticated';
      final value = preferences.get(key) ?? null;
      if (value == true) {

        Navigator.pushReplacementNamed(context, HomeScreen.id);
      } else {
        Navigator.pushReplacementNamed(context, LoginScreen.id);
      }
    }

    Timer(Duration(seconds: 2), () => read());
    return Scaffold(
      backgroundColor: AppColors.M_app_main_color,
      body: Container(
        //color: KBackgroundColor,
        child: Center(
            child: SizedBox(
              height: 80,
              width: 80,
              child: Image.asset(
                'assets/icons/m.png',
                scale: 5,
                color: Colors.white,
              ),
            )),
      ),
    );
  }


}
