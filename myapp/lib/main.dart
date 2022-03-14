import 'package:flutter/material.dart';
import 'package:myapp/models/NavItem.dart';
import 'package:myapp/screens/home/HomeScreen.dart';
import 'dart:ui';
import 'package:myapp/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
