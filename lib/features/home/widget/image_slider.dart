import 'dart:async';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  // Ubah tipe data untuk menampung gambar, judul, dan deskripsi
  final List<Map<String, String>> _images = [
    {
      'imagePath': 'assets/images/foto 1.png',
      'title': 'Celebrate The Season With Us!',
      'description': 'Get discounts up to 75% for furniture & decoration',
    },
    {
      'imagePath': 'assets/images/foto 2.png',
      'title': 'Make Your Home Warm & Bright',
      'description': 'Enjoy up to 70% off on home decor & accessories.',
    },
    {
      'imagePath': 'assets/images/foto 3.png',
      'title': 'New Year, New Vibes!',
      'description': 'Get special offers up to 60% on party furniture & decorations.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Menyesuaikan tinggi
      child: PageView.builder(
        controller: _pageController,
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  // Lapisan 1: Gambar di bagian bawah Stack
                  Positioned.fill(
                    child: Image.asset(
                      _images[index]['imagePath']!, // Menggunakan path dari Map
                      fit: BoxFit.cover,
                    ),
                  ),
                  
                  // Lapisan 2: Gradien di atas gambar
                  Positioned.fill( // Tambahkan ini
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.6),
                          ],
                          stops: const [0.5, 1.0], // Gradien mulai di tengah
                        ),
                      ),
                    ),
                  ),

                  // Lapisan 3: Teks di atas gradien
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          _images[index]['title']!, // Menggunakan judul dari Map
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _images[index]['description']!, // Menggunakan deskripsi dari Map
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}