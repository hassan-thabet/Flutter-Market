
import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';

class CustomListTile extends StatelessWidget {

    final IconData leadingIcon;
    final String title;
    final VoidCallback onTap;

  CustomListTile(this.leadingIcon, this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(
        leadingIcon,
        color: AppColors.M_icons_color,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.M_dark_text_color,
          fontFamily: 'Quicksand',
        ),
      ),
      trailing: Icon(
          Icons.arrow_forward_ios,
          size: 15,
          color: AppColors.M_app_main_color,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: onTap,
    );
  }
}
