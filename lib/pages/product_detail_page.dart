import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_week_2/model/product_model.dart';
import 'package:motion_week_2/widgets/custom_button.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel model;
  final bool isFavorite;
  const ProductDetail({
    required this.isFavorite,
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Get.back(), child: const Icon(Icons.chevron_left)),
        centerTitle: true,
        title: Text(
          model.namaProduct,
          style: GoogleFonts.poppins(fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              Icons.favorite,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                model.urlProduct,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(model.namaProduct,
                          style: GoogleFonts.poppins(
                              fontSize: 28, fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        model.hargaProduct,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: const Color(0xff00623B),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
                        style: GoogleFonts.poppins(fontSize: 18),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                    buttonText: 'Add to Bag', buttonFunction: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
