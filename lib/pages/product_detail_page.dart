import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final String imageUrl, productName, productPrice;
  final bool isFavorite;
  const ProductDetail(
      {super.key,
      required this.imageUrl,
      required this.productName,
      required this.productPrice,
      required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.chevron_left)),
        centerTitle: true,
        title: Text(productName),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imageUrl,
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
                      Text(
                        productName,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        productPrice,
                        style: const TextStyle(
                            fontSize: 20, color: Color(0xff00623B)),
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
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: const BoxDecoration(
                  color: Color(0xff00623B),
                ),
                child: const Center(
                    child: Text(
                  "Add to Bag.",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
