import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function buttonFunction;
  const CustomButton({super.key, required this.buttonText, required this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        child: ElevatedButton(
          onPressed: () => buttonFunction(),
          style:  const ButtonStyle(
            splashFactory: InkSplash.splashFactory,
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)))),
              elevation: WidgetStatePropertyAll(8),
              backgroundColor: WidgetStatePropertyAll(Color(0xff00623B))),
          child: Text(
            buttonText,
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ));
  }
}
