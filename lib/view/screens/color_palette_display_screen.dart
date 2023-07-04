import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/color_palette_controller.dart';
import '../../model/color_palette_model.dart';

class ColorPaletteDisplayScreen extends StatefulWidget {
  final ColorPaletteModel model;
  final ColorPaletteController controller;

  const ColorPaletteDisplayScreen(this.model, this.controller, {super.key});

  @override
  State<ColorPaletteDisplayScreen> createState() =>
      _ColorPaletteDisplayScreenState();
}

class _ColorPaletteDisplayScreenState extends State<ColorPaletteDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Color Palette',
          style: GoogleFonts.poppins(),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: widget.model.colors.length,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: index == 0
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      )
                    : index == widget.model.colors.length - 1
                        ? const BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          )
                        : BorderRadius.circular(0),
                color: Color(widget.model.colors[index]),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.controller.generateRandomPalette(
                colorPalette); // Replace 5 with desired number of colors
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
