import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/models/category.dart';

Widget categoryComponent(Category category) {
  return Padding(
    padding: const EdgeInsets.only(right: 12.0),
    child: Column(
      children: [
        Flexible(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 45,
            child: Image.network(category.imageLink , width: 45, height: 45, color: AppColors.M_app_main_color),
            // backgroundImage: NetworkImage(category.imageLink),
          ),
        ),
        SizedBox(height: 5),
        Text(
          category.categoryName,
          style : TextStyle(
          fontFamily: 'Quicksand')
          ),
      ],
    ),
  );
}