import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {

  // Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  // late String firstName;
  // late Future<String> lastName ;
  // late Future<String> email;


  String firstName = '';
  String lastName = '';
  String email = '';
  String image = '';

  _loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      firstName = (preferences.getString('first_name') ?? 'Guest');
      lastName = (preferences.getString('last_name') ?? 'User');
      email = (preferences.getString('email') ?? 'Email');
      image = (preferences.getString('image') ?? 'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png');
    });
  }


  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile'.toUpperCase(),
          style: TextStyle(
            color: AppColors.M_dark_text_color,
            fontFamily: 'Quicksand',
            letterSpacing: 4,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height / 45, horizontal: height / 45),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: width / 6,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(image)),
                    SizedBox(
                      width: width / 15,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          firstName + ' ' + lastName,
                          style: TextStyle(
                            color: AppColors.M_semi_dark_text_color,
                            decoration: TextDecoration.none,
                            fontFamily: 'Quicksand',
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          email,
                          style: TextStyle(
                            color: AppColors.M_semi_dark_text_color,
                            decoration: TextDecoration.none,
                            fontFamily: 'Quicksand',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: height / 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'My Account',
                    style: TextStyle(
                      color: AppColors.M_semi_dark_text_color,
                      decoration: TextDecoration.none,
                      fontFamily: 'Quicksand',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
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
                                Icons.favorite_border_outlined,
                                color: AppColors.M_app_main_color,
                              ),
                              title: Text(
                                "My favourites",
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
                                Icons.view_list_sharp,
                                color: AppColors.M_app_main_color,
                              ),
                              title: Text(
                                "Orders",
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
                                Icons.shopping_basket_outlined,
                                color: AppColors.M_app_main_color,
                              ),
                              title: Text(
                                "Finished Orders",
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Market App',
                    style: TextStyle(
                      color: AppColors.M_semi_dark_text_color,
                      decoration: TextDecoration.none,
                      fontFamily: 'Quicksand',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
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
                                Icons.share_outlined,
                                color: AppColors.M_app_main_color,
                              ),
                              title: Text(
                                "Invite Friends",
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
                                Icons.headset_mic_outlined,
                                color: AppColors.M_app_main_color,
                              ),
                              title: Text(
                                "Customer Support",
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
                                Icons.star_border,
                                color: AppColors.M_app_main_color,
                              ),
                              title: Text(
                                "Rate Our App",
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
                                Icons.description,
                                color: AppColors.M_app_main_color,
                              ),
                              title: Text(
                                "Make a Suggestion",
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
      ),
    );
  }
}
