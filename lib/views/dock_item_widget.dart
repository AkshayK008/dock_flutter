import 'package:floating_draggable_widget/floating_draggable_widget.dart';
import 'package:flutter/material.dart';
import '../models/dock_item.dart';

class DockItemWidget extends StatelessWidget {
  const DockItemWidget({super.key, required this.item});

  final DockItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: FloatingDraggableWidget(
        screenHeight: MediaQuery.of(context).size.height,
        screenWidth: MediaQuery.of(context).size.width,
        mainScreenWidget: Container(
          constraints: const BoxConstraints(minWidth: 48),
          height: 48,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.primaries[item.icon.hashCode % Colors.primaries.length],
          ),
          child: Center(child: Icon(item.icon, color: Colors.white)),
        ),
        floatingWidget: 
        const SizedBox(),
        floatingWidgetWidth: 48,
        floatingWidgetHeight: 48,
      ),
    );
  }
}
