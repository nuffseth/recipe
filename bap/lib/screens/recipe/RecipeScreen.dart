import 'dart:async';
import 'dart:convert';

import 'package:bap/custom/AppLargeText.dart';
import 'package:bap/screens/recipe/components/recipeitem.dart';
import 'package:flutter/material.dart';
import 'package:bap/screens/recipe/components/categories.dart';
import 'package:flutter/services.dart';
import 'dart:developer';

//Amplify imports
import 'package:bap/amplifyconfiguration.dart';
import 'package:bap/models/ModelProvider.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  bool _isLoading = true;

  List<Recipe> _recipes = [];

  // Amplify Plugins
  final AmplifyDataStore _datastorePlugin =
      AmplifyDataStore(modelProvider: ModelProvider.instance);
  final AmplifyAuthCognito _authPlugin = AmplifyAuthCognito();
  late StreamSubscription _subscription;

  @override
  void initState() {
    // initialize the app
    _initializeApp();
    super.initState();
  }

  @override
  void dispose() {
    // cancel the subscription when the state is removed from the tree
    _subscription.cancel();
    super.dispose();
  }

  Future<void> _initializeApp() async {
    // configure Amplify
    if (!Amplify.isConfigured) {
      await _configureAmplify();
    }
    // .then((value) => _fetchTodos());

    // _fetchTodos();

    _subscription = Amplify.DataStore.observe(Recipe.classType).listen((e) {
      _fetchRecipes();
    });
    await _checkRecipes();
    await _fetchRecipes();

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _configureAmplify() async {
    try {
      // add AMplify Plugins
      await Amplify.addPlugins([_datastorePlugin, _authPlugin]);
      await Amplify.configure(amplifyconfig);
    } catch (err) {
      debugPrint('Erro occured while configuring Amplify $err');
    }
  }

  Future<void> _checkRecipes() async {
    List<Recipe> recipes = await Amplify.DataStore.query(Recipe.classType);
    final String jsonFile = await rootBundle.loadString('assets/recipes.json');
    final data = await json.decode(jsonFile) as List<dynamic>;
    List<Recipe> scrapyRecipe = data.map((e) => Recipe.fromJson(e)).toList();
    if (recipes.length != scrapyRecipe.length) {
      for (Recipe newRecipe in scrapyRecipe) {
        await Amplify.DataStore.save(newRecipe);
      }
    }
  }

  Future<void> _fetchRecipes() async {
    try {
      List<Recipe> recipes = await Amplify.DataStore.query(Recipe.classType);
      setState(() {
        _recipes = recipes;
      });
    } catch (e) {
      print('An error occurred while querying Todos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: AppLargeText(text: "Discover")),
            SizedBox(height: 10),
            Categories(),
            SizedBox(height: 10),
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
        ? Expanded(
            child: ListView(
                padding: const EdgeInsets.all(8),
                children: recipes
                    .map((recipe) => RecipeItem(recipe: recipe))
                    .toList()),
          )
        : const Center(child: Text('No Recipes Availble'));
  }
}
