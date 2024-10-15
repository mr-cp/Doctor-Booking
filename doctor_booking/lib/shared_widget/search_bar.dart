import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final double height;

  const SearchField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.validator,
      this.maxLines,
      this.contentPadding,
      this.height = 40});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      height: height,
      child: TextFormField(
        style: GoogleFonts.inter(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.08,
        ),
        cursorColor: Colors.grey[400],
        controller: controller,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(62, 255, 255, 255),
          filled: true,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 234, 232, 232)),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 234, 232, 232)),
          ),
          errorStyle: GoogleFonts.inter(
            fontSize: 9,
            color: Colors.red[400],
            fontWeight: FontWeight.w600,
            letterSpacing: 0.08,
          ),
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(vertical: 6, horizontal: 12.0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey[400],
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.inter(
              color: Colors.black.withOpacity(0.4000000059604645),
              fontSize: 12,
              fontWeight: FontWeight.w400),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                8,
              ),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(
              color: AppColors.borderGrey,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: Color(0xFF006837)),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
