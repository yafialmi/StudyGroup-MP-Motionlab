import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:motion_week_2/widgets/custom_button.dart';
import 'package:motion_week_2/widgets/custom_sized_box_widget.dart';
import 'package:motion_week_2/widgets/custom_text_field_widgets.dart';
import 'package:motion_week_2/widgets/custom_text_button_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Lottie.asset(
                    'assets/lottie/lottie_login.json',
                    height: 300,
                  ),
                ),
                const MainLoginContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainLoginContent extends StatelessWidget {
  const MainLoginContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSizedBoxSmallWidget(),
        Text("Welcome!",
            style: GoogleFonts.poppins(fontSize: 24, color: Colors.black87)),
        Text("Happy Shopping All",
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.black87)),
        const CustomSizedBoxSmallWidget(),
        const CustomTextFieldWidgets(
          hintText: 'Email',
          iconText: Icon(Icons.email),
        ),
        const CustomSizedBoxSmallWidget(),
        const CustomTextFieldWidgets(
          hintText: 'Password',
          iconText: Icon(Icons.lock),
        ),
        const CustomSizedBoxSmallWidget(),
        CustomButton(
          buttonText: 'Login',
          buttonFunction: () => Get.offNamed('/home_page'),
        ),
        const CustomSizedBoxSmallWidget(),
        CustomTextButton(
          normalText: "Don't have an account?",
          boldText: "Register",
          buttonFunction: () => Get.toNamed('/register_page'),
        )
      ],
    );
  }
}
