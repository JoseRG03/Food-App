import 'package:demo_app/components/theme_button.dart';
import 'package:demo_app/food_theme.dart';
import 'package:demo_app/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(FoodSocialApp());

class FoodSocialApp extends StatefulWidget {

  @override
  State<FoodSocialApp> createState() => _FoodSocialAppState();
}

class _FoodSocialAppState extends State<FoodSocialApp> {
  ThemeData theme = FoodTheme.lightTheme();

  void changeThemeMode(bool isLightMode) {
    setState(() {
      if (isLightMode) {
        theme = FoodTheme.darkTheme();
      } else {
        theme = FoodTheme.lightTheme();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Food Social App';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: theme,
      home: Home(appTitle: appTitle, changeThemeMode: changeThemeMode)
    );
  }
}