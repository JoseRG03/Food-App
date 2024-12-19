import 'package:demo_app/models/tab_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Permite que el hijo se acomode al espacio disponible que se encuentre en la pantalla
        Flexible(
          child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset('assets/grocery_pics/empty_list.png')),
        ),
        Text('No Groceries', style: Theme.of(context).textTheme.displayLarge),
        SizedBox(height: 16),
        Text(
          'Shopping for ingredients?\nTap the + button to write them down',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        MaterialButton(
          onPressed: () {
            Provider.of<TabManager>(context, listen: false).goToRecipes();
          },
          color: Colors.green,
          textColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Text('Browse Recipes'),
        ),
      ],
    );
  }
}
