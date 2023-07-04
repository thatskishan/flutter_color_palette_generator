import 'dart:math';

import 'package:flutter/material.dart';

import '../model/color_palette_model.dart';

class ColorPaletteController {
  ColorPaletteModel model;
  Function()? onPaletteUpdated;

  ColorPaletteController({this.onPaletteUpdated})
      : model = ColorPaletteModel([]);

  void generateRandomPalette(int numColors) {
    List<int> colors = [];
    for (int i = 0; i < numColors; i++) {
      colors.add(generateRandomColor());
    }
    model.colors = colors;
    onPaletteUpdated?.call();
  }

  int generateRandomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)].value;
  }
}
