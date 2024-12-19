import 'package:demo_app/components/card1.dart';
import 'package:demo_app/components/card2.dart';
import 'package:demo_app/components/card3.dart';
import 'package:demo_app/models/explore_recipe.dart';
import 'package:flutter/material.dart';

class TodayRecipeListview extends StatelessWidget {
  const TodayRecipeListview({super.key, required this.recipes});
  
  final List<ExploreRecipe> recipes;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Recipes of the Day 🍽️', style: Theme.of(context).textTheme.displayLarge,),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 400,
            color: Colors.transparent,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(width: 16);
                },
                itemCount: recipes.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];

                  return buildCard(recipe);
                },
            ),
          ),
        )
      ],
    );
  }

  Widget buildCard(ExploreRecipe recipe) {
    print("${recipe.title}");
    if (recipe.cardType == CardTypes.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == CardTypes.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == CardTypes.card3){
      return Card3(recipe: recipe);
    } else {
      throw Exception("This card does not exist");
    }
  }
}
