import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainFont extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const MainFont({
    Key? key,
    required this.text,
    this.color = Colors.white,
    this.size = 20,
    TextAlign? textAlign,
  }) : super(key: key);

//This is a custom widget that will be used to modify the text.
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.kanit(
        color: color,
        fontSize: size,
      ),
    );
  }
}
