import 'package:flutter/material.dart';
import '../widgets/category_card.dart';
import 'category_detail_screen.dart'; 

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample categories with their images
    final categories = [
      {
        'name': 'T-Shirt',
        'count': '70',
        'image': 'assets/category/1.png',
      },
      {
        'name': 'Pants',
        'count': '215',
        'image': 'assets/category/2.png',  
      },
      {
        'name': 'Bags',
        'count': '159',
        'image': 'assets/category/3.png'
      },
      {
        'name': 'Electronics',
        'count': '69',
        'image': 'assets/category/4.png'
      },
      {
        'name': 'Shoes',
        'count': '70',
        'image': 'assets/category/5.png'
      },
      {
        'name': 'Watches',
        'count': '123',
        'image': 'assets/category/4.png'
      },
      {
        'name': 'Jewelry',
        'count': '89',
        'image': 'assets/category/2.png'
      },
      {
        'name': 'Sunglasses',
        'count': '45',
        'image': 'assets/category/1.png'
      },
    ];

    return Container(
      color: const Color(0xFFF5F5F5),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          
          return CategoryCard(
            title: category['name']!,
            productCount: category['count']!,
            imageUrl: category['image']!,
            isReversed: index % 2 == 1,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CategoryDetailScreen(categoryName: category['name']!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
