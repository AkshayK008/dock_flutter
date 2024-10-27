import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/dock_controller.dart';
import 'dock_item_widget.dart';

class DockView extends StatelessWidget {
  const DockView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DockController>(context);

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
        color: Colors.white,
      ),
      child: SizedBox(
        height: 60,
        child: ReorderableListView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          onReorder: (int oldIndex, int newIndex) {
            controller.reorderItems(oldIndex, newIndex);
          },
          children: controller.items.map((item) {
            return Padding(
              key: ValueKey(item.icon),
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: DockItemWidget(item: item),
            );
          }).toList(),
        ),
      ),
    );
  }
}
