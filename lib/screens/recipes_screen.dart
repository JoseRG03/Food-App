// import 'package:demo_app/components/card2.dart';
import 'dart:ffi';

import 'package:demo_app/api/api_service.dart';
import 'package:demo_app/models/explore_recipe.dart';
import 'package:flutter/material.dart';

class RecipesScreen extends StatelessWidget {
  RecipesScreen({super.key});

  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiService.getRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return RecipesGrid(recipes: snapshot.data ?? []);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  } //Card2();
}

class RecipesGrid extends StatelessWidget {
  const RecipesGrid({super.key, required this.recipes, });

  final List<SimpleRecipe> recipes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: recipes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final simpleRecipe = recipes[index];
          return RecipeThumbnail(simpleRecipe: simpleRecipe);
        },
    );
  }
}

class RecipeThumbnail extends StatelessWidget {
  const RecipeThumbnail({
    super.key,
    required this.simpleRecipe,
  });

  final SimpleRecipe simpleRecipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
          BoxShadow(
              color: Theme.of(context).appBarTheme.foregroundColor ?? Colors.black,
              offset: Offset(2.5, 2.5),
              blurRadius: 7.0,
              spreadRadius: 3.0)
        ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(simpleRecipe.dishImage, fit: BoxFit.fill, height: 150, width: double.infinity,),
              ),
            ),
            const SizedBox(
              height: 10
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(simpleRecipe.title, maxLines: 1, style: Theme.of(context).textTheme.bodyLarge),
                  Text(simpleRecipe.duration, maxLines: 1, style: Theme.of(context).textTheme.bodyLarge)
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}
