
import 'package:flutter/material.dart';
import 'package:flutter_store/models/brand.dart';

Widget brandComponent(Brand brand) {
  return Padding(
    padding: const EdgeInsets.only(right: 12.0),
    child: Column(
      children: [
        Flexible(child: Image.network(brand.imageLink!),),
        SizedBox(height: 5),
        Text(
            brand.brandName!,
            style : TextStyle(
                fontFamily: 'Quicksand')),
      ],
    )
  );
}