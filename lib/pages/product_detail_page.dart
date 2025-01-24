import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_week_2/controller/product_detail_controller.dart';
import 'package:motion_week_2/widgets/custom_button.dart';

class ProductDetailPage extends StatelessWidget {
  final bool isFavorite;
  const ProductDetailPage({
    required this.isFavorite,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailController());
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.chevron_left, color: Colors.black)),
        centerTitle: true,
        title: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xff00623B)),
            );
          }
          return Text(
            controller.productDetail.value?.title ?? 'title',
            style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
          );
        }),
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
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xff00623B)),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    controller.productDetail.value!.images.first,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: 350,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Text(controller.productDetail.value?.title ?? '0',
                              style: GoogleFonts.poppins(
                                  fontSize: 28, fontWeight: FontWeight.w600)),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            controller.productDetail.value?.price.toString() ??
                                '0',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: const Color(0xff00623B),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            controller.productDetail.value?.description ?? '',
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
            );
          },
        ),
      ),
    );
  }
}
