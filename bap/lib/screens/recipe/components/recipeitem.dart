import 'package:bap/custom/BorderBox.dart';
import 'package:bap/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:bap/models/Recipe.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;

  const RecipeItem({required this.recipe, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(children: [
        Stack(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.network(recipe.imageURL)),
          Positioned(
              top: 15,
              right: 15,
              child: BorderBox(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.favorite_border, color: COLOR_BLACK)))
        ])
      ]),
    );
  }
}
