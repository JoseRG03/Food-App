import 'package:demo_app/components/card3.dart';
import 'package:demo_app/models/grocery_manager.dart';
import 'package:demo_app/screens/empty_grocery_sreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToBuyScreen extends StatelessWidget {
  const ToBuyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white, size: 40,),
      ),
      body: buildGroceryScreen(),
    );
  }

  Consumer<GroceryManager> buildGroceryScreen() {
    return Consumer<GroceryManager>(builder: (context, groceryManager, child) {
      if (groceryManager.groceryList.isNotEmpty) {
        return const Placeholder();
      } else {
        return const EmptyGroceryScreen();
      }
    });
  } //Card3;
}
