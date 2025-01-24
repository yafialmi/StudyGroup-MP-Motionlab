import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_week_2/controller/category_controller.dart';
import 'package:motion_week_2/controller/product_controller.dart';
import 'package:motion_week_2/pages/product_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    final productController = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.contain,
          width: 50,
          height: 50,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: InkWell(
                onTap: () => Get.toNamed('/cart_page'),
                splashColor: Colors.grey,
                child: const Icon(Icons.shopping_bag_outlined)),
          ),
        ],
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 225,
                child: Text(
                  "Our Way of Loving You Back",
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xffF2F2F2),
                    borderRadius: BorderRadius.all(Radius.circular(26.5))),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey[400],
                    ),
                    Text(
                      "Search",
                      style: TextStyle(color: Colors.grey[400]),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 30,
                child: Obx(() {
                  if (categoryController.isLoading.value == true) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Color(0xff00623B),
                    ));
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryController.categories.length,
                    itemBuilder: (context, index) {
                      final category = categoryController.categories[index];
                      return InkWell(
                        onTap: () => productController
                            .getProductsByCategories(category.url),
                        child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            decoration: const BoxDecoration(
                                color: Color(0xff00623B),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(26.5))),
                            child: Text(
                              category.name,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            )),
                      );
                    },
                  );
                }),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Our Best Seller",
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Obx(() => GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12),
                      itemCount: productController.products.length,
                      itemBuilder: (context, index) {
                        final products = productController.products[index];
                        if (productController.isLoading.value == true) {
                          return const Center(
                              child: CircularProgressIndicator(
                                  color: Color(0xff00623B)));
                        }
                        return BestSellerItem(
                            id: products.id,
                            productName: products.title,
                            productPrice: '${products.price}\$',
                            imageUrl: products.images.first,
                            isFavorite: false);
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xff00623B),
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, color: Colors.white),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline, color: Colors.white),
                label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.white,
                ),
                label: "Profile"),
          ]),
    );
  }
}

class BestSellerItem extends StatelessWidget {
  final int id;
  final String productName, productPrice, imageUrl;
  final bool isFavorite;
  const BestSellerItem({
    super.key,
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.imageUrl,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Get.to(ProductDetailPage(isFavorite: isFavorite), arguments: id),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: const Color(0xff00623B), width: 4),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
            Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: GoogleFonts.poppins(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productPrice,
                          style: GoogleFonts.poppins(
                              color: Colors.green[700],
                              fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.favorite,
                          color: isFavorite ? Colors.red : Colors.grey,
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
