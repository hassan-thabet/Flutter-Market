import 'package:flutter/material.dart';
import 'package:flutter_store/api/authentication.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/screens/register_screen.dart';
import 'package:flutter_store/widgets/components/custom_text_field.dart';
import 'package:flutter_store/widgets/components/my_snack_bar.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    Authentication authentication = Authentication();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    _onPressed() {
      setState(() {
        if (_emailController.text.trim().toLowerCase().isNotEmpty &&
            _passwordController.text.isNotEmpty) {
          authentication
              .login(_emailController.text, _passwordController.text)
              .whenComplete(() => {
                    if (authentication.status != 200)
                      {
                        showInSnackBar(context, 'error on email or password'),
                      }
                    else
                      {
                        Navigator.pushReplacementNamed(context, HomeScreen.id),
                        showInSnackBar(context, 'Welcome back'),
                      }
                  });
        } else {
          showInSnackBar(context, 'Missed data please try again');
        }
      });
    }

    return Scaffold(
      body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  child: Container(
                    //height: height,
                    width: width,
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
                              'assets/icons/login_screen_icon.png',
                              scale: 5,
                              color: AppColors.M_app_main_color,
                            ),

                            // sized box between icon and lets sign you in text
                            SizedBox(
                              height: height / 30,
                            ),

                            // lets sign you in text
                            Text(
                              'Let\'s sign you in .',
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
                              'Sign in with data that you have \nentered during registration',
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

                            //user name and password text field area
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
                                        // email text field
                                        CustomTextField(
                                          isPassword: false,
                                          controller: _emailController,
                                          iconData: Icons.email_outlined,
                                          labelText: 'E-mail',
                                          visibilityOnTap: (){},
                                        ),

                                        // divider
                                        Divider(
                                          color: AppColors.M_dark_text_color,
                                        ),

                                        // password text field
                                        CustomTextField(
                                            visibilityOnTap: ()
                                            {
                                              setState(() {
                                                visibility = !visibility;
                                              });
                                            },
                                            isPassword: (visibility == false) ? true : false,
                                            suffixIconData: (visibility == false) ? Icons.visibility : Icons.visibility_off ,
                                            controller: _passwordController,
                                            iconData: Icons.lock_open,
                                            labelText: 'Password',

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

                            TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        vertical: height / 55)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
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
                                "Login",
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
                              height: height / 70,
                            ),

                            TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        vertical: height / 55)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.transparent),
                                minimumSize: MaterialStateProperty.all(
                                    Size(width / 10 * 9, height * 0.0580)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                        color: AppColors.M_app_main_color,
                                        width: 1.0,
                                      )),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(HomeScreen.id);
                              },
                              child: Text(
                                "Continue as a Guest",
                                style: TextStyle(
                                  color: AppColors.M_app_main_color,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account? ',
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
                                        context, RegisterScreen.id);
                                  },
                                  child: Text(
                                    'Register',
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
                          ],
                        )),
                  ),
                ),
              ),
            ),
    );
  }
}
