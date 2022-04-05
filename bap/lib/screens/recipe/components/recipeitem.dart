import 'package:bap/custom/BigText.dart';
import 'package:bap/custom/BorderBox.dart';
import 'package:bap/custom/IconandText.dart';
import 'package:bap/custom/SmallText.dart';
import 'package:bap/utils/constants.dart';
import 'package:bap/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bap/models/Recipe.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;

  const RecipeItem({required this.recipe, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize * 2),
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: SizeConfig.defaultSize * 2),
                width: SizeConfig.defaultSize * 15,
                height: SizeConfig.defaultSize * 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: COLOR_WHITE,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(recipe.imageURL)))),
            Expanded(
                child: Container(
                    margin: EdgeInsets.only(right: SizeConfig.defaultSize * 2),
                    height: SizeConfig.defaultSize * 12,
                    decoration: BoxDecoration(
                        color: COLOR_WHITE,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Padding(
                      padding: EdgeInsets.only(left: SizeConfig.defaultSize),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BigText(text: recipe.name),
                          IconAndText(
                              icon: Icons.access_time_rounded,
                              text: recipe.cookingtime.format(),
                              iconColor: COLOR_GUN),
                          IconAndText(
                              icon: Icons.restaurant,
                              text: recipe.servingsize.toString() + " servings",
                              iconColor: COLOR_GUN)
                        ],
                      ),
                    ))),
          ], /*Column(children: [
        Stack(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.network(recipe.imageURL, height: 400.0)),
          Positioned(
              top: 15,
              right: 15,
              child: BorderBox(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.favorite_border, color: COLOR_BLACK)))
        ])
      ]),*/
        ));
  }
}
