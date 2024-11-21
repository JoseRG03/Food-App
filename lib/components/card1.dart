import 'package:demo_app/food_theme.dart';
import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key});

  final String category = "Editor\'s Choice";
  final String title = 'Art of Dough';
  final String description = 'Learn to make the perfect bread';
  final String chef = 'Ray Wender';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints.expand(
          width: 350,
          height: 350,
        ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/magazine_pics/mag1.png'),
              fit: BoxFit.cover
              ),
            borderRadius: BorderRadius.circular(10),
          ),
        child: Stack(
          children: [
            Text(category, style: FoodTheme.darkTextTheme.bodyLarge),
            Positioned(
              top: 20,
              child: Text(
                  title,
                  style: FoodTheme.darkTextTheme.titleLarge
              )),
            Positioned(
              bottom: 30,
              right: 0,
              child: Text(
                  description,
                  style: FoodTheme.darkTextTheme.bodyLarge
              )),
            Positioned(
                bottom: 10,
                right: 0,
                child: Text(
                  chef,
                  style: FoodTheme.darkTextTheme.bodyLarge
              )),
          ],
        )
      ),
    );
  }
}
