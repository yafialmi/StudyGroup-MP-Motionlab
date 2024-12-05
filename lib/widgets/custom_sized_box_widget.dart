import 'package:flutter/material.dart';

class CustomSizedBoxSmallWidget extends StatelessWidget {
  const CustomSizedBoxSmallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10,
    );
  }
}

class CustomSizedBoxMediumWidget extends StatelessWidget {
  const CustomSizedBoxMediumWidget({super.key});

  @override
  Widget build(BuildContext context) {
   return const SizedBox(
      height: 20,
    );
  }
}
class CustomSizedBoxLargeWidget extends StatelessWidget {
  const CustomSizedBoxLargeWidget({super.key});

  @override
  Widget build(BuildContext context) {
   return const SizedBox(
      height: 30,
    );
  }
}