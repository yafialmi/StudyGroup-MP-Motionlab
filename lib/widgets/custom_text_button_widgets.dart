import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButton extends StatelessWidget {
  final String normalText, boldText;
  final Function buttonFunction;
  const CustomTextButton(
      {super.key,
      required this.normalText,
      required this.boldText,
      required this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          normalText,
          style: GoogleFonts.poppins(),
        ),
        const SizedBox(
          width: 5,
        ),
        InkWell(
            onTap: () => buttonFunction(),
            child: Text(
              boldText,
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
