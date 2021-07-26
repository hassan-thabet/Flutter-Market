import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/widgets/UI/custom_dialog.dart';
import 'package:flutter_store/widgets/UI/custom_list_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_screen.dart';

class MoreTab extends StatelessWidget {
  const MoreTab({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'more'.toUpperCase(),
          style: TextStyle(
            color: AppColors.M_dark_text_color,
            fontFamily: 'Quicksand',

          ),
        ),
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
                          CustomListTile(Icons.flag_outlined, "Shipping Address", (){}),
                          CustomListTile(Icons.credit_card_rounded,  "Payment Method", (){}),
                          CustomListTile(Icons.attach_money, "Currency", (){}),
                          CustomListTile(Icons.language, "App language", (){}),
                          CustomListTile(Icons.notifications_active_outlined, "Notification Settings", (){}),

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
                          CustomListTile(Icons.privacy_tip_outlined, 'Privacy Policy', (){}),
                          CustomListTile(Icons.question_answer_outlined, 'FAQ', (){}),
                          CustomListTile(Icons.info_outlined, "Legal Information", (){}),
                          CustomListTile(
                            Icons.logout_outlined,
                            'Logout',
                                () async {
                              final preferences = await SharedPreferences.getInstance();
                              final key = 'authenticated';
                              final value = preferences.get(key) ?? null;

                              final imageKey = 'image';
                              final imageValue = preferences.get(imageKey) ?? null;

                              if (value == true) {
                                preferences.remove('authenticated');
                                preferences.remove('user_id');
                                preferences.remove('api_token');
                                preferences.remove('first_name');
                                preferences.remove('last_name');
                                preferences.remove('email');

                                if (imageValue != null)
                                {
                                  preferences.remove('image');
                                }else{print('don\'t Have image another data was deleted');}


                                print('user data removed successfully');
                                Navigator.of(context)
                                    .pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
                              }else{
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => CustomDialog(
                                    title: "You are not logged in",
                                    description: "",
                                    buttonText: "OK",
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    buttonFunc: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                );
                              }
                            },
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
