import 'package:flutter/material.dart';
import '../models/dock_item.dart';

class DockController extends ChangeNotifier {
  final _items = [
    DockItem(icon: Icons.person),
    DockItem(icon: Icons.message),
    DockItem(icon: Icons.call),
    DockItem(icon: Icons.camera),
    DockItem(icon: Icons.photo),
  ];

  List<DockItem> get items => _items;

  void reorderItems(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex -= 1;
    final item = _items.removeAt(oldIndex);
    _items.insert(newIndex, item);
    notifyListeners();
  }
}
