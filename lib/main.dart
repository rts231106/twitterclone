import 'package:flutter/material.dart';
import 'package:twitterclone/screen/signupscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xff1DA1F2),
      ),
      home: const SignUpScreen(),
    );
  }
}
