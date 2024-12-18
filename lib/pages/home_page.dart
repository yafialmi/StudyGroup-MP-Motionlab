import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_week_2/model/product_model.dart';
import 'package:motion_week_2/pages/product_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> kategori = ["All", "Watch", "Shirt", "Shoes"];
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
              const SizedBox(
                width: 225,
                child: Text(
                  "Our Way of Loving You Back",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: kategori.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 5),
                        decoration: BoxDecoration(
                            color: kategori[index] == "All"
                                ? Colors.green[900]
                                : Colors.grey[400],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(26.5))),
                        child: Text(
                          kategori[index],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ));
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Our Best Seller",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 12,
                  children: const [
                    BestSellerItem(
                      id: 1,
                      productPrice: "\$54.00",
                      isFavorite: true,
                      productName: "Mi Band 8 Pro",
                      imageUrl: 'assets/images/jam.png',
                    ),
                    BestSellerItem(
                      id: 2,
                      productPrice: "\$12.00",
                      isFavorite: false,
                      productName: "Lycra Men's shirt",
                      imageUrl: 'assets/images/baju.png',
                    ),
                    BestSellerItem(
                      id: 3,
                      productPrice: "\$30.00",
                      isFavorite: false,
                      productName: "Artisan Headset",
                      imageUrl: 'assets/images/headset.png',
                    ),
                    BestSellerItem(
                      id: 4,
                      productPrice: "\$24.00",
                      isFavorite: false,
                      productName: "AeroStreet",
                      imageUrl: 'assets/images/sepatu.png',
                    ),
                  ],
                ),
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
      onTap: () => Get.to(ProductDetail(
          model: ProductModel(
              id: id,
              namaProduct: productName,
              urlProduct: imageUrl,
              hargaProduct: productPrice),
          isFavorite: isFavorite)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[400]!,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 0))
            ]),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Container(
                width: double.infinity,
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productName),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productPrice,
                          style: TextStyle(
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
