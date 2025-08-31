import 'package:flutter/material.dart';
import 'package:ecommerce_homehaven/features/home/model/product_model.dart';

// Widget ProductCard untuk setiap item produk
class ProductCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String price;
  final String oldPrice;
  final String discount;

  // Properti tambahan untuk rating dan ulasan
  final String rating;
  final String reviews;
  final Product productData;

  const ProductCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.rating,
    required this.reviews,
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product-detail',
          arguments: productData,
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Stack(
                children: [
                  Image.asset(
                    imageUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: const BoxDecoration(
                        color: Color(0xffE44A4A),
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(5)),
                      ),
                      child: Text(
                        discount,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    oldPrice,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xffEBB65B),
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        " (",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        reviews,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        ")",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductSlider extends StatelessWidget {
  // Data produk dummy
  final List<Map<String, dynamic>> products = [
    {
      'title': 'EKERÖ',
      'imageUrl': 'assets/images/Image 1.png',
      'price': '\$230.00',
      'oldPrice': '\$512.58',
      'discount': '45% OFF',
      'rating': '4.9',
      'reviews': '256',
      'description': 'A minimalist chair with a reversible back cushion provides soft support for your back and has two sides to wear.',
      'descriptiondetail':'Choose a stylish dark color or brighten up your home with colorful sarongs. The EKERÖ armchair has a sleek and modern look with two sides that meet at the back – and a waist support for added comfort!',
       'galleryImages': [
        'assets/images/Image 1.png',
        'assets/images/Image 2.png',
        'assets/images/Image 3.png',
      ],
      'specifications': {
      'Width': '70 cm',
      'Depth': '73 cm',
      'Height': '75 cm',
      'Seat Width': '57 cm',
      'Seat Depth': '46 cm',
      'Seat Height': '43 cm',
    },
    },
    {
      'title': 'STRANDMON',
      'imageUrl': 'assets/images/image 9.png',
      'price': '\$274.13',
      'oldPrice': '\$856.60',
      'discount': '45% OFF',
      'rating': '4.8',
      'reviews': '128',
      'description': 'An armchair with a deep seat and high back, providing a feeling of luxury and comfort.',
      'descriptiondetail':'Choose a stylish dark color or brighten up your home with colorful sarongs. The EKERÖ armchair has a sleek and modern look with two sides that meet at the back – and a waist support for added comfort!',
      'galleryImages': [
        'assets/images/image 9.png',
        'assets/images/image 9.png',
        'assets/images/image 9.png',
      ],
    },
    {
      'title': 'PLATTLÄNS',
      'imageUrl': 'assets/images/Product Image.png',
      'price': '\$24.99',
      'oldPrice': '\$69.99',
      'discount': '45% OFF',
      'rating': '4.9',
      'reviews': '256',
      'description': 'A modern pendant lamp with a minimalist design, perfect for dining rooms or living rooms.',
      'descriptiondetail':'Choose a stylish dark color or brighten up your home with colorful sarongs. The EKERÖ armchair has a sleek and modern look with two sides that meet at the back – and a waist support for added comfort!',
      'galleryImages': [
        'assets/images/Product Image.png',
        'assets/images/Product Image.png',
        'assets/images/Product Image.png',
      ],
    },
    {
      'title': 'MALM',
      'imageUrl': 'assets/images/Product Image-1.png',
      'price': '\$50.99',
      'oldPrice': '\$69.99',
      'discount': '45% OFF',
      'rating': '4.9',
      'reviews': '256',
      'description': 'A chest of 4 drawers with a simple and minimalist design, ideal for bedroom storage.',
      'descriptiondetail':'Choose a stylish dark color or brighten up your home with colorful sarongs. The EKERÖ armchair has a sleek and modern look with two sides that meet at the back – and a waist support for added comfort!',
      'galleryImages': [
        'assets/images/Product Image-1.png',
        'assets/images/Product Image-1.png',
        'assets/images/Product Image-1.png',
      ],
    },
  ];

  ProductSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Special Offers",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "See More",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF156651),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              final productObject = Product(
                title: product['title']!,
                imageUrl: product['imageUrl']!,
                price: product['price']!,
                oldPrice: product['oldPrice']!,
                discount: product['discount']!,
                rating: product['rating']!,
                reviews: product['reviews']!,
                description: product['description']!,
                descriptiondetail: product['descriptiondetail']!,
                galleryImages: List<String>.from(product['galleryImages']!),
                 specifications: Map<String, String>.from(product['specifications']!),
              );
              return ProductCard(
                title: productObject.title,
                imageUrl: productObject.imageUrl,
                price: productObject.price,
                oldPrice: productObject.oldPrice,
                discount: productObject.discount,
                rating: productObject.rating,
                reviews: productObject.reviews,
                productData: productObject,
              );
            },
          ),
        ),
      ],
    );
  }
}
