import 'package:bap/Recipe_Repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bap/models/Recipe.dart';

abstract class RecipeState {}

class LoadingRecipes extends RecipeState {}

class RecipesSuccess extends RecipeState {
  final List<Recipe> recipes;
  RecipesSuccess({required this.recipes});
}

class RecipesFailure extends RecipeState {
  final exception;
  RecipesFailure({required this.exception});
}

class RecipeCubit extends Cubit<RecipeState> {
  final _recipeRepo = RecipeRepository();

  RecipeCubit() : super(LoadingRecipes());

  void getRecipes() async {
    if (state is RecipesSuccess == false) {
      emit(LoadingRecipes());
    }

    try {
      final recipes = await _recipeRepo.getRecipes();
      emit(RecipesSuccess(recipes: recipes));
    } catch (e) {
      emit(RecipesFailure(exception: e));
    }
  }

  void observeItems() {
    final itemStream = _recipeRepo.observeRecipes();
    itemStream.listen((e) => getRecipes());
  }
}
