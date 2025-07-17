import 'package:flutter/material.dart';
import '../widgets/category_card.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample categories with their images
    final categories = [
      {
        'name': 'T-Shirt',
        'count': '70',
        'image': 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?ixlib=rb-4.0.3'
      },
      {
        'name': 'Pants',
        'count': '215',
        'image': 'https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?ixlib=rb-4.0.3'
      },
      {
        'name': 'Bags',
        'count': '159',
        'image': 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?ixlib=rb-4.0.3'
      },
      {
        'name': 'Electronics',
        'count': '69',
        'image': 'https://images.unsplash.com/photo-1498049794561-7780e7231661?ixlib=rb-4.0.3'
      },
      {
        'name': 'Shoes',
        'count': '70',
        'image': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3'
      },
      {
        'name': 'Watches',
        'count': '123',
        'image': 'https://images.unsplash.com/photo-1524592094714-0f0654e20314?ixlib=rb-4.0.3'
      },
      {
        'name': 'Jewelry',
        'count': '89',
        'image': 'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?ixlib=rb-4.0.3'
      },
      {
        'name': 'Sunglasses',
        'count': '45',
        'image': 'https://images.unsplash.com/photo-1511499767150-a48a237f0083?ixlib=rb-4.0.3'
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
              debugPrint('Category tapped: ${category['name']}');
            },
          );
        },
      ),
    );
  }
}
