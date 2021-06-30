import 'package:flutter/material.dart';
import 'package:flutter_store/api/authentication.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/screens/home_screen.dart';
import 'package:flutter_store/screens/login_screen.dart';
import 'package:flutter_store/widgets/components/custom_dialog.dart';
import 'package:flutter_store/widgets/components/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  static String id = 'RegisterScreen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Authentication authentication = Authentication();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    _onPressed() {
      setState(() {
        isLoading = true;
        if (_firstNameController.text.isNotEmpty &&
            _lastNameController.text.isNotEmpty &&
            _emailController.text.trim().isNotEmpty &&
            _passwordController.text.isNotEmpty) {
          authentication
              .register(_firstNameController.text, _lastNameController.text,
                  _emailController.text, _passwordController.text)
              .whenComplete(() => {
                    if (authentication.status != 201)
                      {
                        Navigator.pushNamed(context, RegisterScreen.id),
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              CustomDialog(
                                title: "Failed",
                                description: "We are having trouble on connecting",
                                buttonText: "Ok",
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                        ),
                        isLoading = false,
                      }
                    else
                      {
                        Navigator.pushReplacementNamed(context, HomeScreen.id),
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => CustomDialog(
                            title: "Done ",
                            description: "Your data has been saved successfully , Thank you for joining our community",
                            buttonText: "Ok",
                            icon: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        isLoading = false,
                      }
                  });
        } else {
          isLoading = false;
          showDialog(
            context: context,
            builder: (BuildContext context) => CustomDialog(
              title: "Missed data",
              description: "Here is missed data error",
              buttonText: "Ok",
              icon: Icon(
                Icons.clear,
                color: Colors.white,
                size: 40,
              ),
            ),
          );
        }
      });
    }

    return Scaffold(
      body: isLoading
          ? Container(
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
            )
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  child: Container(
                    width: width,
                    height: height,
                    color: AppColors.M_background_color,
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            //first sized box on screen
                            SizedBox(
                              height: height / 12,
                            ),

                            // screen main image "login icon"

                            Image.asset(
                              'assets/icons/register_screen_icon.png',
                              scale: 5,
                              color: AppColors.M_app_main_color,
                            ),

                            // sized box between icon and lets sign you in text
                            SizedBox(
                              height: height / 30,
                            ),

                            // lets sign you in text
                            Text(
                              'Join our community',
                              style: TextStyle(
                                color: AppColors.M_dark_text_color,
                                decoration: TextDecoration.none,
                                fontFamily: 'Quicksand',
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            // sized box between lets sign you in text and slogan
                            SizedBox(
                              height: height / 100,
                            ),

                            // slogan
                            Text(
                              'You only need one minute \n to become one of our community',
                              style: TextStyle(
                                color: AppColors.M_semi_dark_text_color,
                                decoration: TextDecoration.none,
                                fontFamily: 'Quicksand',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            // sized box for user name and password text field area
                            SizedBox(
                              height: height / 20,
                            ),

                            // user name and password text field area
                            Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: height / 50,
                                      horizontal: height / 50),
                                  width: width / 10 * 9,
                                  //height: height / 4,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withAlpha(70),
                                        blurRadius: 10,
                                        offset: Offset(0, 5),
                                      )
                                    ],
                                  ),
                                  child: Form(
                                    key: _globalKey,
                                    child: Column(
                                      children: [
                                        IntrinsicHeight(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 10.0),
                                                  child: TextFormField(
                                                    controller:
                                                        _firstNameController,
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .M_dark_text_color,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontFamily: 'Quicksand',
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    decoration:
                                                        new InputDecoration(
                                                      labelText: 'First Name',
                                                      labelStyle: TextStyle(
                                                        color: AppColors
                                                            .M_semi_dark_text_color,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontFamily: 'Quicksand',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: VerticalDivider(
                                                  color:
                                                      AppColors.M_dark_text_color,
                                                ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 10.0),
                                                  child: TextFormField(
                                                    controller:
                                                        _lastNameController,
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .M_dark_text_color,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontFamily: 'Quicksand',
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    decoration:
                                                        new InputDecoration(
                                                      labelText: 'Last Name',
                                                      labelStyle: TextStyle(
                                                        color: AppColors
                                                            .M_semi_dark_text_color,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontFamily: 'Quicksand',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Divider(
                                          color: AppColors.M_dark_text_color,
                                          height: 0.5,
                                        ),

                                        CustomTextField(
                                          isPassword: false,
                                          controller: _emailController,
                                          iconData: Icons.email_outlined,
                                          labelText: 'E-mail',
                                        ),

                                        // divider
                                        Divider(
                                          color: AppColors.M_dark_text_color,
                                          height: 0.5,
                                        ),

                                        CustomTextField(
                                            isPassword: true,
                                            controller: _passwordController,
                                            iconData: Icons.lock_open,
                                            labelText: 'Password',
                                            suffixIconData:
                                                Icons.visibility_off_outlined),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: height / 20,
                            ),

                            TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(vertical: height / 55)),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    AppColors.M_app_main_color),
                                minimumSize: MaterialStateProperty.all(
                                    Size(width / 10 * 9, height * 0.0580)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              onPressed: _onPressed,
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Quicksand',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height / 40,
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account? ',
                                    style: TextStyle(
                                      color: AppColors.M_semi_dark_text_color,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'Quicksand',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, LoginScreen.id);
                                    },
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        color: AppColors.M_app_main_color,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'Quicksand',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
          ),
    );
  }
}
