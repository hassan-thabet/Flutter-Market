import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';

Widget loading() {
  return Container(
    color: AppColors.M_background_color,
    child: Center(
        child: SizedBox(
          height: 80,
          width: 80,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(AppColors.M_app_main_color),
            strokeWidth: 1.5,
          ),
        )),
  );
}