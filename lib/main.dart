import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/dock_controller.dart';
import 'views/dock_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DockController(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DockHome(),
      ),
    );
  }
}
