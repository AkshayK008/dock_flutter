import 'package:flutter/material.dart';
import '../controllers/dock_controller.dart';
import '../models/dock_item.dart';
import 'dock_view.dart';

class DockHome extends StatelessWidget {
  const DockHome({super.key});

  @override
  Widget build(BuildContext context) {
    final dockController = DockController();
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
        body: Stack(
          children: [
            Positioned.fill(
              child: DragTarget<DockItem>(
                builder: (context, candidateData, rejectedData) {
                  return Container(color: Colors.transparent);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: DockView(
                controller: dockController,
                itemBuilder: (item) {
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
                },
              ),
            ),
          ],
        ),
      );
  }
}
