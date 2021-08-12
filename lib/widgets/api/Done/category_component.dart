import 'package:flutter/material.dart';
import 'package:flutter_store/constants/api_helper.dart';
import 'package:flutter_store/models/category.dart';

Widget categoryComponent(Category category) {
  return Padding(
    padding: const EdgeInsets.only(right: 12.0),
    child: Column(
      children: [
        Flexible(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35,
            backgroundImage: NetworkImage(ApiHelper.MAIN_CATEGORIES_IMAGES_URL + category.imageLink!),
          ),
        ),
        SizedBox(height: 5),
        Text(
          category.categoryName!,
          style : TextStyle(
          fontFamily: 'Quicksand'),
          maxLines: 1,
          ),
      ],
    ),
  );
}