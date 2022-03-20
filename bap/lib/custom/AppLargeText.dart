import 'package:bap/utils/constants.dart';
import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  Color color;
  AppLargeText(
      {Key? key, this.size = 30, required this.text, this.color = COLOR_BLACK})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: FontWeight.bold,
            fontFamily: "Montserrat"));
  }
}
