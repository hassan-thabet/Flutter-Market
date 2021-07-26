

import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';

Widget error() {
  return Center(
    child: Column(
      children: [
        Icon(Icons.error , color: AppColors.M_app_main_color,),
        SizedBox(height: 2),
        Text(
          'Oops: An unexpected error occurred,\n we will fix it soon ' ,
          style: TextStyle(
            color: AppColors.M_semi_dark_text_color,
            decoration: TextDecoration.none,
            fontFamily: 'Quicksand',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}