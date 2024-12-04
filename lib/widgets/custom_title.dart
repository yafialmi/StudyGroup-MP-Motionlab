import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_week_2/pages/register_page.dart';

class CustomTitle extends StatelessWidget {
  final String normalText, BoldText;
  const CustomTitle(
      {super.key, required this.normalText, required this.BoldText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          normalText,
          style: GoogleFonts.roboto(),
        ),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: () => Navigator.pushNamed(context, '/register_page'),
            child: Text(
          BoldText,
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ))
      ],
    );
  }
}
