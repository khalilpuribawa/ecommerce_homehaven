import 'package:ecommerce_homehaven/features/home/widget/cart_item.dart';
import 'package:flutter/material.dart';

// Import model Product yang sudah ada
import 'package:ecommerce_homehaven/features/home/model/product_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}



class _CartScreenState extends State<CartScreen> {
  
  // Data dummy untuk keranjang belanja
  final List<Product> _cartItems = [
    Product(
      title: 'EKERÖ',
      imageUrl: 'assets/images/Image.png',
      price: '\$230.00',
      oldPrice: '\$512.58',
      discount: '45% OFF',
      rating: '4.9',
      reviews: '256',
      description: 'A minimalist chair with a reversible back cushion provides soft support for your back and has two sides to wear.',
      descriptiondetail:'Choose a stylish dark color or brighten up your home with colorful sarongs. The EKERÖ armchair has a sleek and modern look with two sides that meet at the back – and a waist support for added comfort!',
      galleryImages: ['assets/images/chair1_gallery_1.jpg'],
      specifications: {
        'Width': '70 cm',
        'Depth': '73 cm',
        'Height': '75 cm',
        'Seat Width': '57 cm',
        'Seat Depth': '46 cm',
        'Seat Height': '43 cm',
      },
    ),
    Product(
      title: 'STRANDMON',
      imageUrl: 'assets/images/image 9.png',
      price: '\$274.13',
      oldPrice: '\$856.60',
      discount: '45% OFF',
      rating: '4.8',
      reviews: '128',
      description: 'An armchair with a deep seat and high back, providing a feeling of luxury and comfort.',
      descriptiondetail:'Choose a stylish dark color or brighten up your home with colorful sarongs. The EKERÖ armchair has a sleek and modern look with two sides that meet at the back – and a waist support for added comfort!',
      galleryImages: ['assets/images/chair2_gallery_1.jpg'],
      specifications: {
        'Width': '82 cm',
        'Depth': '96 cm',
        'Height': '101 cm',
        'Seat Width': '49 cm',
        'Seat Depth': '54 cm',
        'Seat Height': '45 cm',
      },
    ),
    Product(
      title: 'PLATTLÄNS',
      imageUrl: 'assets/images/Product Image.png',
      price: '\$24.99',
      oldPrice: '\$69.99',
      discount: '45% OFF',
      rating: '4.9',
      reviews: '256',
      description: 'A modern pendant lamp with a minimalist design, perfect for dining rooms or living rooms.',
      descriptiondetail:'Choose a stylish dark color or brighten up your home with colorful sarongs. The EKERÖ armchair has a sleek and modern look with two sides that meet at the back – and a waist support for added comfort!',
      galleryImages: ['assets/images/lamp_gallery_1.jpg'],
      specifications: {
        'Diameter': '40 cm',
        'Max Height': '170 cm',
      },
    ),
    Product(
      title: 'MALM',
      imageUrl: 'assets/images/Product Image-1.png',
      price: '\$50.99',
      oldPrice: '\$69.99',
      discount: '45% OFF',
      rating: '4.9',
      reviews: '256',
      description: 'A chest of 4 drawers with a simple and minimalist design, ideal for bedroom storage.',
      descriptiondetail:'Choose a stylish dark color or brighten up your home with colorful sarongs. The EKERÖ armchair has a sleek and modern look with two sides that meet at the back – and a waist support for added comfort!',
      galleryImages: ['assets/images/drawer_gallery_1.jpg'],
      specifications: {
        'Width': '80 cm',
        'Depth': '48 cm',
        'Height': '100 cm',
        'Drawer Depth': '43 cm',
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: _cartItems.map((item) => CartItem(product: item)).toList(),
          ),
        ),
      ),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
}
