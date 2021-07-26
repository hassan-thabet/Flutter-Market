
import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';


class InitLoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.M_isLoading_color,
      child: Center(
          child: SizedBox(
            height: 80,
            width: 80,
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                  AppColors.M_app_main_color),
              strokeWidth: 1.5,
            ),
          )),
    );
  }
}
