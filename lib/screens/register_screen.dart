import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store/bloc/register/register_bloc.dart';
import 'package:flutter_store/bloc/register/register_states.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/screens/home_screen.dart';
import 'package:flutter_store/screens/login_screen.dart';
import 'package:flutter_store/widgets/UI/custom_text_field.dart';
import 'package:flutter_store/widgets/UI/login_loading_screen.dart';
import 'package:flutter_store/widgets/UI/my_snack_bar.dart';


class RegisterScreen extends StatelessWidget {
  static String id = 'RegisterScreen';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocConsumer<RegisterBloc, RegisterStates>(
      listener: (BuildContext context, Object? state) {
        if (state is RegisterSuccessState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginLoadingScreen(HomeScreen.id)));
        }
        if (state is RegisterErrorState) {
          showInSnackBar(
              context, 'An error occurred while trying to register account');
        }
        if (state is RegisterEmptyState) {
          showInSnackBar(context, 'This fields must not be empty');
        }
      },
      builder: (context, state) {
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
                  height: height,
                  color: AppColors.M_background_color,
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height / 12,
                          ),
                          Image.asset(
                            'assets/icons/register_screen_icon.png',
                            scale: 5,
                            color: AppColors.M_app_main_color,
                          ),
                          SizedBox(
                            height: height / 30,
                          ),
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
                          SizedBox(
                            height: height / 100,
                          ),
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
                                      IntrinsicHeight(
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: TextFormField(
                                                  controller:
                                                      RegisterBloc.get(context)
                                                          .firstNameController,
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
                                                      RegisterBloc.get(context)
                                                          .lastNameController,
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
                                        controller: RegisterBloc.get(context)
                                            .emailController,
                                        iconData: Icons.email_outlined,
                                        labelText: 'E-mail',
                                        visibilityOnTap: () {},
                                      ),

                                      // divider
                                      Divider(
                                        color: AppColors.M_dark_text_color,
                                        height: 0.5,
                                      ),

                                      CustomTextField(
                                        controller: RegisterBloc.get(context)
                                            .passwordController,
                                        iconData: Icons.lock_open,
                                        labelText: 'Password',
                                        visibilityOnTap: () {
                                          RegisterBloc.get(context)
                                              .visibilityOnTap();
                                        },
                                        isPassword: (RegisterBloc.get(context)
                                                    .visibility ==
                                                false)
                                            ? true
                                            : false,
                                        suffixIconData:
                                            (RegisterBloc.get(context)
                                                        .visibility ==
                                                    false)
                                                ? Icons.visibility
                                                : Icons.visibility_off,
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
                            onPressed: () {
                              RegisterBloc.get(context).onRegisterPressed();
                            },
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
      },
    );
  }
}
