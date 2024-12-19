
import 'package:demo_app/models/grocery_item.dart';
import 'package:flutter/foundation.dart';

class GroceryManager extends ChangeNotifier{
  final _groceryItems = <GroceryItem>[];

  List<GroceryItem> get groceryList => List.unmodifiable(_groceryItems);

  void addItem(GroceryItem item) {
    _groceryItems.add(item);
    notifyListeners();
  }

  void deleteItem(int index) {
    _groceryItems.removeAt(index);
    notifyListeners();
  }

  void updateItem(GroceryItem item, int index) {
    _groceryItems[index] = item;
    notifyListeners();
  }

  void completeItem(int index, bool change) {
    final item = _groceryItems[index];

    _groceryItems[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}