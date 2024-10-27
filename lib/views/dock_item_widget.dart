import 'package:flutter/material.dart';
import '../models/dock_item.dart';

/// Widget to display individual Dock items.
class DockItemWidget extends StatelessWidget {
  const DockItemWidget({super.key, required this.item});

  final DockItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 48),
      height: 48,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.primaries[item.icon.hashCode % Colors.primaries.length],
      ),
      child: Center(child: Icon(item.icon, color: Colors.white)),
    );
  }
}
