import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/color_palette_controller.dart';
import '../../model/color_palette_model.dart';

class ColorPaletteSelectScreen extends StatefulWidget {
  final ColorPaletteController controller;

  const ColorPaletteSelectScreen(this.controller, {super.key});

  @override
  _ColorPaletteSelectScreenState createState() =>
      _ColorPaletteSelectScreenState();
}

class _ColorPaletteSelectScreenState extends State<ColorPaletteSelectScreen> {
  int numColors = 5; // Default number of colors

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Number of Colors',
          style: GoogleFonts.poppins(),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Number of Colors: $numColors'),
            Slider(
              value: numColors.toDouble(),
              min: 1,
              max: 10,
              divisions: 9,
              onChanged: (value) {
                setState(() {
                  numColors = value.toInt();
                  colorPalette = value.toInt();
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                widget.controller.generateRandomPalette(colorPalette);
                Navigator.pushReplacementNamed(context, 'display');
              },
              child: Text(
                'Generate Palette',
                style: GoogleFonts.poppins(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
