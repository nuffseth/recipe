import 'dart:async';
import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bap/screens/recipe/components/recipeitem.dart';
import 'package:flutter/material.dart';
import 'package:bap/amplifyconfiguration.dart';
import 'package:bap/models/ModelProvider.dart';
import 'package:bap/screens/recipe/components/categories.dart';
import 'package:flutter/services.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  bool _isLoading = true;

  List<Recipe> _recipes = [];

  // Amplify Plugins
  final AmplifyAPI _apiPlugin =
      AmplifyAPI(modelProvider: ModelProvider.instance);
  final AmplifyAuthCognito _authPlugin = AmplifyAuthCognito();

  @override
  void initState() {
    // initialize the app
    _initializeApp();
    super.initState();
  }

  Future<void> _initializeApp() async {
    // configure Amplify
    if (!Amplify.isConfigured) {
      await _configureAmplify();
    }
    // .then((value) => _fetchTodos());

    // _fetchTodos();

    await _fetchRecipes();

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _configureAmplify() async {
    try {
      // add AMplify Plugins
      await Amplify.addPlugins([_apiPlugin, _authPlugin]);

      await Amplify.configure(amplifyconfig);
    } catch (err) {
      debugPrint('Erro occured while configuring Amplify $err');
    }
  }

  Future<void> _fetchRecipes() async {
    try {
      final request = ModelQueries.list(Recipe.classType);
      final response = await Amplify.API.query(request: request).response;

      List<Recipe?>? recipes = response.data?.items;
      final String jsonFile = await rootBundle.loadString('assets/sample.json');
      final data = await json.decode(jsonFile) as List<dynamic>;
      List<Recipe> scrapyRecipe = data.map((e) => Recipe.fromJson(e)).toList();
      if (recipes == null) {
        print('errors: ' + response.errors.toString());
        return;
      }
      print('Query result: ' + recipes.toString());
      if (recipes.length != scrapyRecipe.length) {
        for (Recipe newRecipe in scrapyRecipe) {
          final newRequest = ModelMutations.create(newRecipe);
          final newResponse =
              await Amplify.API.mutate(request: newRequest).response;
        }
      }
    } on ApiException catch (e) {
      print('Query failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Categories(),
        _isLoading
            ? const Center(child: CircularProgressIndicator())
            : RecipeList(recipes: _recipes),
      ]),
    );
  }
}

class RecipeList extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipeList({required this.recipes, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return recipes.isNotEmpty
        ? ListView(
            padding: const EdgeInsets.all(8),
            children:
                recipes.map((recipe) => RecipeItem(recipe: recipe)).toList())
        : const Center(child: Text('Tap button below to add a todo!'));
  }
}
