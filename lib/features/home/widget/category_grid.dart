import 'package:flutter/material.dart';
import 'package:ecommerce_homehaven/features/home/widget/category_card.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      'title': 'Outdoor',
      'icon': Icons.outdoor_grill,
      'backgroundColor': Color(0xFFE6F5E6),
      'iconColor': Color(0xFF156651),
    },
    {
      'title': 'Appliances',
      'icon': Icons.microwave,
      'backgroundColor': Color(0xFFE6F5FF),
      'iconColor': Color(0xFF2196F3),
    },
    {
      'title': 'Furniture',
      'icon': Icons.chair,
      'backgroundColor': Color(0xFFFFF2E6),
      'iconColor': Color(0xFFEBB65B),
    },
    {
      'title': 'See More',
      'icon': Icons.more_horiz,
      'backgroundColor': Colors.white,
      'iconColor': Color(0xFF404040),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Shop by Categories",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoryCard(
                title: category['title'],
                icon: category['icon'],
                backgroundColor: category['backgroundColor'],
                iconColor: category['iconColor'],
              );
            },
          ),
        ),
      ],
    );
  }
}