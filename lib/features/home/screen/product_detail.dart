import 'package:ecommerce_homehaven/features/home/model/product_model.dart';
import 'package:ecommerce_homehaven/features/home/screen/profile_info_screen.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  String _selectedColor = "Harvest Gold"; // Status warna yang dipilih
  bool _isLiked = false;

  // Daftar warna dummy untuk pengujian
  final List<Map<String, dynamic>> colors = [
    {'name': 'Harvest Gold', 'color': const Color(0xFFC4962C)},
    {'name': 'Eerie Black', 'color': const Color(0xFF1E1E1E)},
    {'name': 'Flame', 'color': const Color(0xFFE44A4A)},
    {'name': 'Pakistan Green', 'color': const Color(0xFF003D00)},
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageIndex = _pageController.page!.round();
      });
    });
  }

  

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Menerima data produk dari halaman sebelumnya
    final Product? product = ModalRoute.of(context)!.settings.arguments as Product?;

    // Menangani kasus di mana produk tidak ditemukan
    if (product == null) {
      return const Scaffold(
        appBar: null,
        body: Center(
          child: Text('Product not found!'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[200], // Mengatur warna latar belakang menjadi abu-abu muda
      appBar: AppBar(
        title: Text(product.title), // Menampilkan nama produk di app bar
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bagian Image Slider Utama
                  SizedBox(
                    height: 350, // Tinggi slider gambar utama
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: product.galleryImages.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          product.galleryImages[index],
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
      
                  // Bagian Thumbnail Slider
                  Center(
                    child: SizedBox(
                      height: 80, // Tinggi slider thumbnail
                      child: ListView.builder(
                        shrinkWrap: true, // Tambahkan ini
                        scrollDirection: Axis.horizontal,
                        itemCount: product.galleryImages.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            },
                            child: Container(
                              width: 60,
                              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: _currentPageIndex == index ? Colors.blue : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  product.galleryImages[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  
                  // Bungkus Padding dengan Container untuk background dan rounded
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          // Baris untuk harga, harga lama, dan diskon
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(product.price, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                              const SizedBox(width: 10),
                              Text(product.oldPrice, style: const TextStyle(fontSize: 16, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                              const SizedBox(width: 10),
                              // Label Diskon
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xffE44A4A),
                                  borderRadius: const BorderRadius.only( // Perbaikan di sini
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                                child: Text(product.discount, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Bintang dan Ulasan
                          Row(
                            children: [
                              const Icon(Icons.star, color: Color(0xffEBB65B), size: 18),
                              const SizedBox(width: 4),
                              Text('${product.rating} (${product.reviews})', style: const TextStyle(fontSize: 16, color: Colors.grey)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(product.description, style: const TextStyle(fontSize: 16, color: Colors.black)),
                          const SizedBox(height: 20),
                          const Divider(thickness: 1, color: Colors.grey),
                          const SizedBox(height: 20),
        
                          // Bagian "Colors"
                          const Text(
                            "Colors",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: colors.map((colorData) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedColor = colorData['name'];
                                  });
                                },
                                child: Container(
                                  width: 180, 
                                  height: 51,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: _selectedColor == colorData['name'] ? Colors.green : Colors.grey,
                                      width: 2,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: colorData['color'],
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(colorData['name'], style: const TextStyle(fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 20),
                          ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            title: const Text("Product Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(product.description, style: const TextStyle(fontSize: 16, color: Colors.black)),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            title: const Text("Size", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                            children: <Widget>[
                              Column(
                                children: [
                                  const SizedBox(height: 10),
                                  ...product.specifications.entries.map((entry) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(entry.key, style: const TextStyle(fontSize: 16, color: Colors.grey)),
                                          Text(entry.value, style: const TextStyle(fontSize: 16, color: Colors.black)),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ],
                              ),
                              Image.asset('assets/images/spesification.png', fit: BoxFit.contain),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bagian Tombol Add to Cart
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x40000000), // Warna shadow yang lebih jelas (opasitas 25%)
                  spreadRadius: 2,
                  blurRadius: 8, // Blur radius yang lebih besar
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _isLiked = !_isLiked; // Mengubah status saat diklik
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(color: _isLiked ? AppColors.primary : AppColors.primary, width: 2), // Mengubah warna border
                      ),
                      child: Icon(
                        _isLiked ? Icons.favorite : Icons.favorite_border, // Mengubah ikon
                        color: _isLiked ? AppColors.primary : AppColors.primary, // Mengubah warna ikon
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    
                    flex: 4,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF156651),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}