import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:motion_week_2/widgets/custom_button.dart';
import 'package:motion_week_2/widgets/custom_sized_box_widget.dart';
import 'package:motion_week_2/widgets/custom_text_field_widgets.dart';
import 'package:motion_week_2/widgets/custom_title.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(
                'assets/lottie/lottie_login.json',
                height: 300,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Welcome!",
                style: GoogleFonts.roboto(
                    fontSize: 24, color: Colors.black87)),
            const CustomSizedBoxWidget(),
            const CustomTextFieldWidgets(
              hintText: 'Email',
              iconText: Icon(Icons.email),
            ),
            const CustomSizedBoxWidget(),
            const CustomTextFieldWidgets(
              hintText: 'Password',
              iconText: Icon(Icons.lock),
            ),
            const CustomSizedBoxWidget(),
            const CustomButton(ButtonText: 'Login'),
            const CustomSizedBoxWidget(),
            const CustomTitle(normalText: "Don't have an account?", BoldText: "Register")
          ],
        ),
      ),
    );
  }
}
