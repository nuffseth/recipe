import 'package:bap/utils/constants.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  double size;
  final String text;
  Color color;
  TextOverflow overFlow;
  BigText(
      {Key? key,
      this.size = 18,
      required this.text,
      this.color = COLOR_BLACK,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: overFlow,
        maxLines: 1,
        style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: FontWeight.w700,
            fontFamily: "Montserrat"));
  }
}
