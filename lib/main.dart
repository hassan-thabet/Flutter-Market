
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store/bloc/login/login_bloc.dart';
import 'package:flutter_store/screens/home_screen.dart';
import 'package:flutter_store/screens/login_screen.dart';
import 'package:flutter_store/screens/register_screen.dart';
import 'package:flutter_store/screens/splash_screen.dart';

import 'bloc/search/search_bloc.dart';
import 'constants/app_color.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => SearchBloc()),


      ],
      child: MaterialApp(
        initialRoute: SplashScreen.id,
        routes:
        {
          SplashScreen.id : (context) => SplashScreen(),
          LoginScreen.id : (context) => LoginScreen(),
          RegisterScreen.id : (context) => RegisterScreen(),
          HomeScreen.id : (context) => HomeScreen(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
             scaffoldBackgroundColor : AppColors.M_background_color
        ),
      ),
    );
  }
}

