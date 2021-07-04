
import 'package:flutter/material.dart';
import 'package:flutter_store/screens/home_screen.dart';
import 'package:flutter_store/screens/login_screen.dart';
import 'package:flutter_store/screens/register_screen.dart';
import 'package:flutter_store/screens/splash_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.id,
      routes:
      {
        SplashScreen.id : (context) => SplashScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        RegisterScreen.id : (context) => RegisterScreen(),
        HomeScreen.id : (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

