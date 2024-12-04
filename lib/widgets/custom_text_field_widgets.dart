import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldWidgets extends StatelessWidget {
  final String hintText;
  final Icon iconText;
  const CustomTextFieldWidgets({required this.hintText, super.key, required this.iconText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: iconText,
          hintStyle: GoogleFonts.roboto(color: Colors.black87),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
    );
  }
}
