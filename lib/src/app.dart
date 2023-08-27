import 'package:flutter/material.dart';
import 'package:lifleta/src/core/utils/theme_manager.dart';

class LifletaApp extends StatelessWidget {
  const LifletaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.myTheme,
      home: Scaffold(),
    );
  }
}
