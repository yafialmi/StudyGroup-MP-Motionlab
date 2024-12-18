import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_week_2/controller/cart_controller.dart';
import 'package:motion_week_2/model/product_model.dart';
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
                      model: ProductModel(
                          id: 1,
                          namaProduct: 'Mi Band 8 Pro',
                          urlProduct: 'assets/images/jam.png',
                          hargaProduct: '\$54.00'),
                      controller: controller),
                  ItemTile(
                      model: ProductModel(
                          id: 2,
                          namaProduct: 'Lycra Men\'s shirt',
                          urlProduct: 'assets/images/baju.png',
                          hargaProduct: '\$12.00'),
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
  final ProductModel model;
  const ItemTile({super.key, required this.controller, required this.model});

  final CartController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(model.urlProduct),
        title: Text(
          model.namaProduct,
          style: GoogleFonts.poppins(),
        ),
        subtitle: Text(
          model.hargaProduct,
          style: GoogleFonts.poppins(color: Colors.green[700]),
        ),
        trailing: Card(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () => controller.quantityIncrement(model.id),
                  icon: const Icon(Icons.add_rounded)),
              Obx(() => Text(
                    controller.getQuantity(model.id).toString(),
                    style: GoogleFonts.poppins(),
                  )),
              IconButton(
                  onPressed: () => controller.quantityDecrement(model.id),
                  icon: const Icon(Icons.remove_rounded)),
            ],
          ),
        ),
      ),
    );
  }
}
