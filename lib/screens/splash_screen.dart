import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';

import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  static String id = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    Timer(Duration(seconds: 4),
        () => Navigator.pushReplacementNamed(context, LoginScreen.id));

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
