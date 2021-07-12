import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';

class MoreTab extends StatefulWidget {
  @override
  _MoreTabState createState() => _MoreTabState();
}

class _MoreTabState extends State<MoreTab> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'more'.toUpperCase(),
          style: TextStyle(
            color: AppColors.M_dark_text_color,
            fontFamily: 'Quicksand',
            letterSpacing: 4,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.notifications_active_outlined,
              color: AppColors.M_icons_color,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: height / 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Settings & Privacy',
                    style: TextStyle(
                      color: AppColors.M_semi_dark_text_color,
                      decoration: TextDecoration.none,
                      fontFamily: 'Quicksand',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 50,
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: height / 50, horizontal: height / 50),
                      width: width / 10 * 9,
                      //height: height / 4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(70),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            tileColor: Colors.white,
                            leading: Icon(
                              Icons.flag_outlined,
                              color: AppColors.M_app_main_color,
                            ),
                            title: Text(
                              "Shipping Address",
                              style: TextStyle(
                                color: AppColors.M_dark_text_color,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: AppColors.M_semi_dark_text_color,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          // Divider(),
                          ListTile(
                            tileColor: Colors.white,
                            leading: Icon(
                              Icons.credit_card_rounded,
                              color: AppColors.M_app_main_color,
                            ),
                            title: Text(
                              "Payment Method",
                              style: TextStyle(
                                color: AppColors.M_dark_text_color,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: AppColors.M_semi_dark_text_color,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          // Divider(),
                          ListTile(
                            tileColor: Colors.white,
                            leading: Icon(
                              Icons.attach_money,
                              color: AppColors.M_app_main_color,
                            ),
                            title: Text(
                              "Currency",
                              style: TextStyle(
                                color: AppColors.M_dark_text_color,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: AppColors.M_semi_dark_text_color,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          // Divider(),
                          ListTile(
                            tileColor: Colors.white,
                            leading: Icon(
                              Icons.language,
                              color: AppColors.M_app_main_color,
                            ),
                            title: Text(
                              "App language",
                              style: TextStyle(
                                color: AppColors.M_dark_text_color,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: AppColors.M_semi_dark_text_color,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          ListTile(
                            tileColor: Colors.white,
                            leading: Icon(
                              Icons.notifications_active_outlined,
                              color: AppColors.M_app_main_color,
                            ),
                            title: Text(
                              "Notification Settings",
                              style: TextStyle(
                                color: AppColors.M_dark_text_color,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: AppColors.M_semi_dark_text_color,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Help & Support',
                    style: TextStyle(
                      color: AppColors.M_semi_dark_text_color,
                      decoration: TextDecoration.none,
                      fontFamily: 'Quicksand',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 50,
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: height / 50, horizontal: height / 50),
                      width: width / 10 * 9,
                      //height: height / 4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(70),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          // Divider(),
                          ListTile(
                            tileColor: Colors.white,
                            leading: Icon(
                              Icons.privacy_tip_outlined,
                              color: AppColors.M_app_main_color,
                            ),
                            title: Text(
                              "Privacy Policy",
                              style: TextStyle(
                                color: AppColors.M_dark_text_color,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: AppColors.M_semi_dark_text_color,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          // Divider(),
                          ListTile(
                            tileColor: Colors.white,
                            leading: Icon(
                              Icons.question_answer_outlined,
                              color: AppColors.M_app_main_color,
                            ),
                            title: Text(
                              "FAQ",
                              style: TextStyle(
                                color: AppColors.M_dark_text_color,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: AppColors.M_semi_dark_text_color,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          // Divider(),
                          ListTile(
                            tileColor: Colors.white,
                            leading: Icon(
                              Icons.info_outlined,
                              color: AppColors.M_app_main_color,
                            ),
                            title: Text(
                              "Legal Information",
                              style: TextStyle(
                                color: AppColors.M_dark_text_color,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: AppColors.M_semi_dark_text_color,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
