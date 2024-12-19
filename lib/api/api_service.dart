import 'dart:convert';

import 'package:demo_app/models/explore_data.dart';
import 'package:flutter/services.dart';

import '../models/explore_recipe.dart';
import '../models/post.dart';

class ApiService {

  Future<String> _loadAssets(String path) async {
    return rootBundle.loadString(path);
  }

  Future<List<SimpleRecipe>> getRecipes() async {

    await Future.delayed(const Duration(milliseconds: 1000));

    //Se trae el json desde nuestro archivo
    final data = await _loadAssets('assets/sample_data/sample_recipes.json');

    //Se convierte el json a un mapa
    final Map<String, dynamic> json = jsonDecode(data);

    // Se navega el mapa y se convierte a objetos tipo SimpleRecipe
    if (json['recipes'] != null) {
      final recipes = <SimpleRecipe>[];
      json['recipes'].forEach((value){
        recipes.add(SimpleRecipe.fromJson(value));
      });

      print(recipes);
      return recipes; //Devolvemos la lista de objetos SimpleRecipes
    }

    return []; //Si tira error retorna una lista vacía
  }

  Future<List<Post>> _getFriendPosts() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    final data = await _loadAssets('assets/sample_data/sample_friends_feed.json');

    final Map<String, dynamic> json = jsonDecode(data);

    if (json['feed'] != null) {
      final posts = <Post>[];
      json['feed'].forEach((value){
        posts.add(Post.fromJson(value));
      });

      return posts;
    }

    return [];
  }

  Future <List<ExploreRecipe>> _getTodayRecipes() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    final data = await _loadAssets('assets/sample_data/sample_explore_recipes.json');

    final Map<String, dynamic> json = jsonDecode(data);


    if (json['recipes'] != null) {

      final exploreRecipes = <ExploreRecipe>[];

      json['recipes'].forEach((value){
        exploreRecipes.add(ExploreRecipe.fromJson(value));
      });

      return exploreRecipes;
    }

    return [];
  }

  Future <ExploreData> getExploreData() async {
    final todayRecipes = await _getTodayRecipes();
    final friendPosts = await _getFriendPosts();


    print("Picha mal ride");

    return ExploreData(todayRecipes, friendPosts);
  }
}
