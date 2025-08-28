import 'package:flutter/material.dart';

class Product {
  final String title;
  final String imageUrl;
  final String price;
  final String oldPrice;
  final String discount;
  final String rating;
  final String reviews;
  final String description;
  final String descriptiondetail;
  final List<String> galleryImages;
  final Map<String, String> specifications;

  Product({
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.rating,
    required this.reviews,
    required this.description,
    required this.descriptiondetail,
    required this.galleryImages,
    required this.specifications,
  });
}