import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_week_2/controller/cart_controller.dart';
import 'package:motion_week_2/widgets/custom_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.chevron_left)),
        title: Text(
          'My Cart',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ItemTile(
                      id: 1,
                      namaProduct: 'Mi Band 8 Pro - Brand New',
                      urlProduct: 'assets/images/jam.png',
                      hargaProduct: '\$54.00',
                      controller: controller),
                  ItemTile(
                      id: 2,
                      namaProduct: 'Lycra Men\'s shirt',
                      urlProduct: 'assets/images/baju.png',
                      hargaProduct: '\$12.00',
                      controller: controller),
                ],
              ),
              CustomButton(
                  buttonText: 'Buy Now',
                  buttonFunction: () => Get.toNamed('/invoice_page'))
            ],
          )),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int id;
  final String namaProduct, urlProduct, hargaProduct;
  const ItemTile({
    super.key,
    required this.controller,
    required this.id,
    required this.namaProduct,
    required this.urlProduct,
    required this.hargaProduct,
  });

  final CartController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(urlProduct),
        title: Text(
          namaProduct,
          style: GoogleFonts.poppins(),
        ),
        subtitle: Text(
          hargaProduct,
          style: GoogleFonts.poppins(color: Colors.green[700]),
        ),
        trailing: Card(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () => controller.quantityIncrement(id),
                  icon: const Icon(Icons.add_rounded)),
              Obx(() => Text(
                    controller.getQuantity(id).toString(),
                    style: GoogleFonts.poppins(),
                  )),
              IconButton(
                  onPressed: () => controller.quantityDecrement(id),
                  icon: const Icon(Icons.remove_rounded)),
            ],
          ),
        ),
      ),
    );
  }
}
