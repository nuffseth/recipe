import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bap/amplifyconfiguration.dart';
import 'package:bap/models/ModelProvider.dart';

class RecipeRepository {
  final AmplifyDataStore _datastorePlugin =
      AmplifyDataStore(modelProvider: ModelProvider.instance);
  final AmplifyAuthCognito _authPlugin = AmplifyAuthCognito();

  Future<List<Recipe>> getRecipes() async {
    try {
      final List<Recipe> recipes =
          await Amplify.DataStore.query(Recipe.classType);
      return recipes;
    } catch (e) {
      throw ('An error occurred while querying Recipes: $e');
    }
  }

  Stream observeRecipes() {
    return Amplify.DataStore.observe(Recipe.classType);
  }

  Future<void> _configureAmplify() async {
    try {
      // add AMplify Plugins
      await Amplify.addPlugins([_datastorePlugin, _authPlugin]);
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      throw ('Erro occured while configuring Amplify $e');
    }
  }
}
