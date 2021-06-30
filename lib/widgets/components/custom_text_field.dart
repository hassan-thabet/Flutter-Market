
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';

class CustomTextField extends StatelessWidget {

  final String labelText;
  final IconData iconData;
  final TextEditingController controller;
  final bool isPassword ;
  final IconData suffixIconData;

  CustomTextField(
      {
        @required this.labelText,
        @required this.iconData,
        @required this.controller,
        @required this.isPassword,
        this.suffixIconData,
      }
      );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: AppColors.M_dark_text_color,
        decoration: TextDecoration.none,
        fontFamily: 'Quicksand',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      obscureText: isPassword,
      decoration: new InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: AppColors.M_semi_dark_text_color,
          decoration: TextDecoration.none,
          fontFamily: 'Quicksand',
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        border: InputBorder.none,
        prefixIcon: Icon(iconData,
            color: AppColors.M_icons_color),
        suffixIcon: Icon(
          suffixIconData,
          size: 20,
          color: AppColors.M_icons_color,
        ),
      ),
    );
  }
}