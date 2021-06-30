import 'package:flutter/material.dart';

Widget loading() {
  return Container(
    color: Color(0xFFf0f0f0),
    child: Center(
        child: SizedBox(
          height: 80,
          width: 80,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFFAC7FFD)),
            strokeWidth: 1.5,
          ),
        )),
  );
}