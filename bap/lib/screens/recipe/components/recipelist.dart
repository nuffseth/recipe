import 'package:bap/models/Recipe.dart';
import 'package:bap/screens/recipe/components/recipeitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RecipeList extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipeList({required this.recipes, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return recipes.isNotEmpty
        ? SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => RecipeItem(recipe: recipes[index]),
            ),
          )
        : const SliverFillRemaining(
            child: Center(child: Text("No Recipe Available")));
  }
}
