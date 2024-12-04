import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_week_2/pages/register_page.dart';

class CustomButton extends StatelessWidget {
  final String ButtonText;
  const CustomButton({super.key, required this.ButtonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterPage(),));
          },
          style: const ButtonStyle(
            shape: WidgetStatePropertyAll(LinearBorder.none),
            elevation: WidgetStatePropertyAll(8),
              backgroundColor: WidgetStatePropertyAll(Color(0xff00623B))),
          child: Text(
            ButtonText,
            style: GoogleFonts.roboto(color: Colors.white),
          ),
        ));
  }
}
