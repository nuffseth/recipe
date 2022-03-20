import 'package:bap/utils/constants.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  double size;
  final String text;
  Color color;
  double height;
  SmallText(
      {Key? key,
      this.size = 12,
      this.height = 1.2,
      required this.text,
      this.color = COLOR_GREY})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: color,
            fontSize: size,
            fontFamily: "Montserrat",
            height: height));
  }
}
