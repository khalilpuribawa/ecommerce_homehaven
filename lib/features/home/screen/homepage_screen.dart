import 'package:flutter/material.dart';
import 'package:ecommerce_homehaven/features/home/widget/image_slider.dart';
import 'package:ecommerce_homehaven/features/home/widget/product_slider.dart' hide Product;
import 'package:ecommerce_homehaven/features/home/widget/category_grid.dart';
import 'package:ecommerce_homehaven/features/home/widget/category_card.dart';
import 'package:ecommerce_homehaven/features/home/model/product_model.dart'; // Impor model produk di sini

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final List<String> testLocations = const [
    'Jakarta, DKI Jakarta',
    'Bandung, Jawa Barat',
    'Surabaya, Jawa Timur',
    'Yogyakarta, DI Yogyakarta',
    'Medan, Sumatera Utara',
  ];

  String selectedLocation = 'Jakarta, DKI Jakarta';

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

  void _showLocationPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: testLocations.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(testLocations[index]),
                onTap: () {
                  setState(() {
                    selectedLocation = testLocations[index];
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
           padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
           child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none,
                          hintText: 'Search for products',
                        ),
                      ),
                    )),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        
                      ),
                      child: const Icon(Icons.notifications_none, color: Color(0xff404040), size: 30,),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, color: Colors.black, size: 24),
                    const SizedBox(width: 8),
                    const Text(
                      "Deliver to",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: GestureDetector(
                        onTap: _showLocationPicker,
                        child: Text(
                          selectedLocation,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _showLocationPicker,
                      child: const Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 24),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                const ImageSlider(),
                const SizedBox(height: 24),
                
                // Mulai kode Product Slider
                Column(
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
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 240, 
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
                            specifications: Map<String, String>.from(product['specifications'] ?? {})
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
                    const SizedBox(height: 24),
                    CategoryGrid()
                    
                  ],
                ),
                // Akhir kode Product Slider
                
              ],
           ),
        ),
      ),
    );
  }
}