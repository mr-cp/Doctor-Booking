import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final BorderSide? borderSide;
  final double height;

  const CustomButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.borderSide,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: backgroundColor,
          side: borderSide,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Center(child: text),
      ),
    );
  }
}
