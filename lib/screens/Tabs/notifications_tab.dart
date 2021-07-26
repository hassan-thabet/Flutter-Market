
import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';

class NotificationsTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'notifications'.toUpperCase(),
          style: TextStyle(
            color: AppColors.M_dark_text_color,
            fontFamily: 'Quicksand',

          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
