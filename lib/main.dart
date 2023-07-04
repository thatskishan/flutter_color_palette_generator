// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_color_palette_generator/view/screens/color_palette_display_screen.dart';
import 'package:flutter_color_palette_generator/view/screens/color_palette_select_screen.dart';
import 'package:flutter_color_palette_generator/view/screens/splash_screen.dart';

import 'controller/color_palette_controller.dart';

void main() {
  runApp(ColorPaletteGeneratorApp());
}

class ColorPaletteGeneratorApp extends StatelessWidget {
  final ColorPaletteController controller = ColorPaletteController();

  ColorPaletteGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        'home': (context) => ColorPaletteSelectScreen(controller),
        'display': (context) =>
            ColorPaletteDisplayScreen(controller.model, controller),
      },
    );
  }
}
