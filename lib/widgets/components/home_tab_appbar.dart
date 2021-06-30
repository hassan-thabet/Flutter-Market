

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';

Stack customAppBar(double height, double width) {
  return Stack(
    children: [
      Stack(
        children: <Widget>[
          Container(
            height: height / 6.5,
            decoration: BoxDecoration(
                // borderRadius:
                // BorderRadius.only(
                //     bottomLeft: Radius.circular(35.0) ,
                //     bottomRight: Radius.circular(35.0),
                // ),
                color: AppColors.M_app_main_color),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 18 , left: width / 15 , right: width / 15),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  hintText: 'Search for your favorite',
                  hintStyle:
                  TextStyle(
                    fontSize: 14.0,
                    color: AppColors.M_dark_text_color,
                    fontFamily: 'Quicksand',
                  ),
                  prefixIcon: Icon(Icons.search, color: AppColors.M_icons_color),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}