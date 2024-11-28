import 'package:demo_app/food_theme.dart';
import 'package:flutter/material.dart';

import '../models/explore_recipe.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key, required this.recipe});

  final ExploreRecipe recipe;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints.expand(
          width: 350,
          height: 350,
        ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(recipe.backgroundImage),
              fit: BoxFit.cover
              ),
            borderRadius: BorderRadius.circular(10),
          ),
        child: Stack(
          children: [
            Text(recipe.subtitle, style: FoodTheme.darkTextTheme.bodyLarge),
            Positioned(
              top: 20,
              child: Text(
                  recipe.title,
                  style: FoodTheme.darkTextTheme.titleLarge
              )),
            Positioned(
              bottom: 30,
              right: 0,
              child: Text(
                  recipe.description,
                  style: FoodTheme.darkTextTheme.bodyLarge
              )),
            Positioned(
                bottom: 10,
                right: 0,
                child: Text(
                  recipe.authorName,
                  style: FoodTheme.darkTextTheme.bodyLarge
              )),
          ],
        )
      ),
    );
  }
}
