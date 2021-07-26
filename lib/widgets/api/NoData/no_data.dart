

import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';

Widget noData(String text) {
  return Center(
    child: Column(
      children: [
        Icon(Icons.hourglass_empty_rounded , size: 30, color: AppColors.M_app_main_color,),
        SizedBox(height: 10,),
        Text(
            text,
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