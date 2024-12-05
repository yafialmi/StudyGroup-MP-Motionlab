import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_week_2/widgets/custom_button.dart';
import 'package:motion_week_2/widgets/custom_sized_box_widget.dart';
import 'package:motion_week_2/widgets/custom_text_button_widgets.dart';
import 'package:motion_week_2/widgets/custom_text_field_widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [TitleText(), MainContent()],
            ),
          ),
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSizedBoxLargeWidget(),
        const CustomTextFieldWidgets(
            hintText: 'Full Name', iconText: Icon(Icons.person_outline)),
        const CustomSizedBoxSmallWidget(),
        const CustomTextFieldWidgets(
            hintText: 'Email', iconText: Icon(Icons.email_outlined)),
        const CustomSizedBoxSmallWidget(),
        const CustomTextFieldWidgets(
            hintText: 'Password', iconText: Icon(Icons.lock_outline)),
        const CustomSizedBoxSmallWidget(),
        const CustomTextFieldWidgets(
            hintText: 'Confirm Password', iconText: Icon(Icons.lock_outlined)),
        const CustomSizedBoxLargeWidget(),
        CustomButton(
          buttonText: 'Register',
          buttonFunction: () {},
        ),
        const CustomSizedBoxSmallWidget(),
        CustomTextButton(
            normalText: 'Already have an account?',
            boldText: 'Login',
            buttonFunction: () => Navigator.pop(context))
      ],
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Register",
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: Colors.black87,
                  height: 2,
                  fontWeight: FontWeight.bold)),
          Text("Create your account for Happy Shopping",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black87,
              )),
        ],
      ),
    );
  }
}
