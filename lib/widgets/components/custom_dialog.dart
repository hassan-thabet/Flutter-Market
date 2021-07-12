
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';

class Constants {
  Constants._();

  static const double padding = 16.0;
  static const double avatarRadius = 45.0;
}


class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Icon? icon;
  final VoidCallback buttonFunc;



  CustomDialog({
    required this.title,
    required this.description,
    required this.buttonText,
    required this.buttonFunc,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Constants.avatarRadius + Constants.padding,
            bottom: Constants.padding,
            left: Constants.padding,
            right: Constants.padding,
          ),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Constants.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: AppColors.M_dark_text_color,
                  decoration: TextDecoration.none,
                  fontFamily: 'Quicksand',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.M_semi_dark_text_color,
                  decoration: TextDecoration.none,
                  fontFamily: 'Quicksand',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: buttonFunc,
                  child: Text(
                      buttonText,
                    style: TextStyle(
                      color: AppColors.M_app_main_color,
                      decoration: TextDecoration.none,
                      fontFamily: 'Quicksand',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: AppColors.M_app_main_color,
            radius: Constants.avatarRadius,
            child: icon,
          ),
        ),
      ],
    );
  }

}