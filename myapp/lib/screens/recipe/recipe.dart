import 'package:flutter/material.dart';
import 'package:myapp/screens/recipe/components/categories.dart';

class Recipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Categories(),
      ]),
    );
  }
}
