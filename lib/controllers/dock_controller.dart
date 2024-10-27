import 'package:flutter/material.dart';
import '../models/dock_item.dart';

/// Controller managing the Dock's state and item manipulation.
class DockController extends ChangeNotifier {
  /// List of Dock items.
  final _items = [
    DockItem(Icons.person),
    DockItem(Icons.message),
    DockItem(Icons.call),
    DockItem(Icons.camera),
    DockItem(Icons.photo),
  ];

  List<DockItem> get items => _items;

  /// Method to reorder items in the list and notify listeners.
  void reorderItems(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex -= 1;
    final item = _items.removeAt(oldIndex);
    _items.insert(newIndex, item);
    notifyListeners(); // Notify listeners of state change
  }
}
