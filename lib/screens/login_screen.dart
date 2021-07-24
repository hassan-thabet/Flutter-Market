
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store/bloc/login/login_bloc.dart';
import 'package:flutter_store/bloc/login/login_states.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/screens/register_screen.dart';
import 'package:flutter_store/widgets/components/custom_text_field.dart';
import 'package:flutter_store/widgets/components/login_loading_screen.dart';
import 'package:flutter_store/widgets/components/my_snack_bar.dart';
import 'home_screen.dart';
class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocConsumer<LoginBloc , LoginStates>(
            listener: (context , state)
            {
              if(state is LoginSuccessState)
              {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginLoadingScreen(HomeScreen.id)));
              }
              if (state is LoginErrorState)
              {
                showInSnackBar( context ,'An error occurred while trying to log in');
              }
              if (state is LoginEmptyState)
              {
                showInSnackBar( context ,'E-mail and password must not be empty');
              }
            },
            builder: (context , state)
            {
              return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                      child: Container(
                        width: width,
                        color: AppColors.M_background_color,
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [

                                SizedBox(
                                  height: height / 12,
                                ),

                                Image.asset(
                                  'assets/icons/login_screen_icon.png',
                                  scale: 5,
                                  color: AppColors.M_app_main_color,
                                ),

                                SizedBox(
                                  height: height / 30,
                                ),

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

                                SizedBox(
                                  height: height / 100,
                                ),

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

                                SizedBox(
                                  height: height / 20,
                                ),

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
                                              controller: LoginBloc.get(context).emailController,
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
                                              controller: LoginBloc.get(context).passwordController,
                                              isPassword: LoginBloc.get(context).visibility,
                                              suffixIconData: (LoginBloc.get(context).visibility == true) ? Icons.visibility : Icons.visibility_off ,
                                              visibilityOnTap: ()
                                              {
                                                LoginBloc.get(context).visibilityOnTap();
                                              },
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
                                  onPressed: () { LoginBloc.get(context).onLoginPressed(); },
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
        );

  }
}
