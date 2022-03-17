import 'package:flutter/material.dart';
import 'package:bap/screens/home/HomeScreen.dart';
import 'dart:ui';
import 'package:bap/utils/constants.dart';
// Amplify Flutter Packages

void main() {
  runApp(BapApp());
}

class BapApp extends StatelessWidget {
  const BapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: COLOR_WHITE,
              elevation: 0,
              foregroundColor: COLOR_BLACK),
          primaryColor: COLOR_WHITE,
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
          fontFamily: "Montserrat"),
      home: HomeScreen(),
    );
  }
}
