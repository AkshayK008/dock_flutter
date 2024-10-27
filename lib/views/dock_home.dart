import 'package:flutter/material.dart';
import 'dock_view.dart';

class DockHome extends StatelessWidget {
  const DockHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: const Column(
        children: [
          Spacer(),
          DockView(),
          // SizedBox(height: 16),
        ],
      ),
    );
  }
}
