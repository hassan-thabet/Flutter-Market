
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';


class LoginLoadingScreen extends StatelessWidget {

  final String? routeName;
  LoginLoadingScreen(this.routeName);

  @override
  Widget build(BuildContext context) {

    navigation() {
      Navigator.pushReplacementNamed(context, routeName!);
    }

    Timer(Duration(seconds: 2), () => navigation());
    return Container(
      color: AppColors.M_isLoading_color,
      child: Center(
          child: SizedBox(
            height: 80,
            width: 80,
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                  AppColors.M_app_main_color),
              strokeWidth: 1.5,
            ),
          )),
    );
  }
}
