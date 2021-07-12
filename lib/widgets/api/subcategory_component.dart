import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/models/subcategory.dart';

Widget subcategoryComponent(Subcategory subcategory) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.auto_awesome_mosaic_outlined),
      title: Text(
        subcategory.subcategoryName!,
        style: TextStyle(
          color: AppColors.M_dark_text_color ,
          fontFamily: 'Quicksand',

        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios , color: AppColors.M_app_main_color,),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),

    ),
  );
}