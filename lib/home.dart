import 'package:demo_app/models/tab_manager.dart';
import 'package:demo_app/screens/explore_screen.dart';
import 'package:demo_app/screens/recipes_screen.dart';
import 'package:demo_app/screens/tobuy_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/theme_button.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.appTitle, required this.changeThemeMode});

  final appTitle;
  final changeThemeMode;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Widget> screens = [
    ExploreScreen(),
    RecipesScreen(),
    ToBuyScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(
      builder: (BuildContext context, tabManager, Widget? child) => Scaffold(
        appBar: AppBar(
          title: Text(widget.appTitle, style: Theme.of(context).textTheme.titleLarge),
          centerTitle: true,
          actions: [
            ThemeButton(changeTheme: widget.changeThemeMode)
          ],
        ),
        body: screens[tabManager.selectedTab],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            currentIndex: tabManager.selectedTab,
            onTap: (value) {
              tabManager.goToTab(value);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore),
                  label: "Explore"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.card_giftcard),
                  label: "Recipes"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: "To Buy"
              ),
            ]),
      ),
    );
  }
}