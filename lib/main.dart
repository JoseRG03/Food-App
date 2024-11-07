import 'package:flutter/material.dart';

void main() => runApp(FoodSocialApp());

class FoodSocialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Social App',
      theme: ThemeData(

      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Food Social App'),
        ),
        body: Center(
          child: Container(
            child: Text('Good Food'),
          ),
        ),
      ),
    );
  }
}