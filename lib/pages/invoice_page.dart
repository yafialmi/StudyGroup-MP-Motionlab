import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:motion_week_2/widgets/custom_button.dart';
import 'package:motion_week_2/widgets/custom_sized_box_widget.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.chevron_left_sharp),
        ),
        centerTitle: true,
        title: Text(
          'Invoice',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Lottie.asset('assets/lottie/lottie_success.json',
                    repeat: false, width: 150, height: 150),
                Text(
                  'Transaction Success',
                  style: GoogleFonts.poppins(),
                ),
                Text(
                  '\$66.00',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                const Divider(
                  indent: 65,
                  endIndent: 65,
                ),
                const TextGap(
                  textStart: 'Invoice Number',
                  textEnd: '000085752257',
                  fontWeight: FontWeight.normal,
                ),
                const TextGap(
                  textStart: 'Transaction Date',
                  textEnd: '16 June 2023',
                  fontWeight: FontWeight.normal,
                ),
                const TextGap(
                  textStart: 'Payment Method',
                  textEnd: 'Bank Transfer',
                  fontWeight: FontWeight.normal,
                ),
                const Divider(
                  indent: 65,
                  endIndent: 65,
                ),
                const CustomSizedBoxLargeWidget(),
                const TextGap(
                    textStart: 'Detail Pesanan',
                    textEnd: '',
                    fontWeight: FontWeight.bold),
                const TextGap(
                  textStart: 'Order Number',
                  textEnd: 'Indra Mahesa',
                  fontWeight: FontWeight.normal,
                ),
                const TextGap(
                  textStart: 'Order Email',
                  textEnd: 'indramahesa@gmail.com',
                  fontWeight: FontWeight.normal,
                ),
                const TextGap(
                  textStart: 'Total Price',
                  textEnd: '\$66.00',
                  fontWeight: FontWeight.normal,
                ),
                const CustomSizedBoxLargeWidget(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: CustomButton(
                  buttonText: 'Back to Home',
                  buttonFunction: () => Get.offNamed('/home_page')),
            )
          ],
        ),
      ),
    );
  }
}

class TextGap extends StatelessWidget {
  final String textStart, textEnd;
  final FontWeight fontWeight;
  const TextGap({
    required this.textStart,
    required this.textEnd,
    required this.fontWeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: 340,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textStart,
              style: GoogleFonts.poppins(fontWeight: fontWeight),
            ),
            Text(
              textEnd,
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
