import 'package:flutter/material.dart';
import 'package:motion_week_2/pages/login_page.dart';
import 'package:motion_week_2/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login_page',
      routes: {
        '/login_page': (context) => const LoginPage(),
        '/register_page' : (context) => const RegisterPage(),
        '/home_page' : (context) => const HomePage(),
      },
    );
  }
}

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left),
        centerTitle: true,
        title: const Text("Product"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              Icons.favorite,
              color: Colors.red[700],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                        'assets/images/jam.png',
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
                      const Text(
                        "Mi Band 8 Pro",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "\$54.00",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff00623B)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.justify,
                      ),
                       const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: const BoxDecoration(
                          color: Color(0xff00623B),
                        ),
                        child: const Center(child: Text("Add to Bag.", style: TextStyle(fontSize: 18,color: Colors.white),)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Icon(Icons.shopping_bag_outlined),
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
                      hargaBarang: "\$54.00",
                      isFavorite: true,
                      namaBarang: "Mi Band 8 Pro",
                      urlGambar: 'assets/images/jam.png',
                    ),
                    BestSellerItem(
                      hargaBarang: "\$12.00",
                      isFavorite: false,
                      namaBarang: "Lycra Men's shirt",
                      urlGambar: 'assets/images/baju.png',
                    ),
                    BestSellerItem(
                      hargaBarang: "\$30.00",
                      isFavorite: false,
                      namaBarang: "Artisan Headset",
                      urlGambar: 'assets/images/headset.png',
                    ),
                    BestSellerItem(
                      hargaBarang: "\$24.00",
                      isFavorite: false,
                      namaBarang: "AeroStreet",
                      urlGambar: 'assets/images/sepatu.png',
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
                icon: Icon(Icons.home_outlined, color: Colors.white), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.wallet_outlined, color: Colors.white), label: "Wallet"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline, color: Colors.white), label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined, color: Colors.white,),
                label: "Notifications"),
          ]),
    );
  }
}

class BestSellerItem extends StatelessWidget {
  final String namaBarang, hargaBarang, urlGambar;
  final bool isFavorite;
  const BestSellerItem({
    super.key,
    required this.namaBarang,
    required this.hargaBarang,
    required this.urlGambar,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              urlGambar,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(namaBarang),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        hargaBarang,
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
    );
  }
}
