import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontweight;
  const CustomText(
      {super.key,
      required this.text,
      this.fontSize = 12.0,
      this.fontweight = FontWeight.w400,
      this.color = Colors.black87});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        color: color,
        fontWeight: fontweight,
      ),
    );
  }
}
