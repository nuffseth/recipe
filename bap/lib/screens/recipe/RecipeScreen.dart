import 'dart:async';
import 'dart:convert';

import 'package:bap/custom/AppLargeText.dart';
import 'package:bap/screens/recipe/components/RecipeAppBar.dart';
import 'package:bap/screens/recipe/components/recipelist.dart';
import 'package:bap/utils/constants.dart';
import 'package:bap/utils/size_config.dart';
import 'package:bap/utils/widget_functions.dart';
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
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  bool _isLoading = true;
  ScrollController _controller = ScrollController();
  List<Recipe> _recipes = [];
  final maxExtent = 230.0;
  double currentExtent = 0.0;

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
    _controller.dispose();
    super.dispose();
  }

  Future<void> _initializeApp() async {
    _configureController();
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

  void _configureController() {
    _controller.addListener(() {
      currentExtent = maxExtent - _controller.offset;
      if (currentExtent < 0) currentExtent = 0.0;
      if (currentExtent > maxExtent) currentExtent = maxExtent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: COLOR_WHITE,
        child: CustomScrollView(controller: _controller, slivers: <Widget>[
          /* SliverAppBar(toolbarHeight: 30, actions: [Icon(Icons.settings)]),
          //crossAxisAlignment: CrossAxisAlignment.start,
          //children: <Widget>[
          SliverAppBar(
              title: FittedBox(
                  child: SizedBox(
                      width: SizeConfig.screenWidth,
                      child: AppLargeText(text: "Discover"))),
              expandedHeight: 85,
              floating: true,
              pinned: true,
              snap: true,
              bottom: AppBar(title: Categories()))*/
          SliverPersistentHeader(
            pinned: true,
            delegate: const RecipeAppBar(),
          ),
          SliverAppBar(
            elevation: 0.5,
            forceElevated: true,
            pinned: true,
            expandedHeight: kToolbarHeight,
            primary: false,
            titleSpacing: 0,
            title: Categories(),
          ),
          //addVerticalSpace(20),
          /*Categories(),
          addVerticalSpace(20),*/
          _isLoading
              ? SliverFillRemaining(
                  child: const Center(child: Text("Loading Recipes")))
              : RecipeList(recipes: _recipes),
        ]),
      ),
    );
  }
}
