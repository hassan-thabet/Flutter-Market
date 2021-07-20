
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';


  void showInSnackBar(BuildContext context  , String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontFamily: 'Quicksand',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: AppColors.M_app_main_color,
      ),
    );
  }
