import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';
import 'shop_detail_screen.dart'; // Import the ShopDetailScreen
import 'product_detail_screen.dart'; // Import the ProductDetailScreen
import '../../../core/widgets/product_card.dart'; // Import the ProductCard widget

class CategoryDetailScreen extends StatelessWidget {
  final String categoryName;
  const CategoryDetailScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // Sample horizontal cards
    final horizontalCards = [
      {'icon': Icons.percent, 'label': 'Promotion'},
      {'icon': Icons.storefront, 'label': 'Vendors'},
      {'icon': Icons.shopping_bag, 'label': 'Shop'},
      {'icon': Icons.local_offer, 'label': 'Cloud'},
    ];
    // Sample top brands
    final topBrands = [
      {'icon': Icons.diamond, 'verified': true},
      {'icon': Icons.token, 'verified': true},
      {'icon': Icons.shopping_cart, 'verified': true},
      {'icon': Icons.fastfood, 'verified': true},
      {'icon': Icons.emoji_food_beverage, 'verified': true},
      {'icon': Icons.language, 'verified': true},
      {'icon': Icons.account_circle, 'verified': true},
      {'icon': Icons.car_rental, 'verified': true},
    ];
    // Sample products
    final products = [
      {
        'title': 'Leather Bag',
        'desc': 'Autumn And Winter Casual cotton-padded jacket...',
        'image': 'assets/products/prod2.jpg',
        'price': 499,
        'rating': 4.5,
      },
      {
        'title': 'Classic Watch',
        'desc': 'Elegant wrist watch for all occasions.',
        'image': 'assets/products/prod3.jpg',
        'price': 299,
        'rating': 4.7,
      },
      {
        'title': 'Sneakers',
        'desc': 'Comfortable and stylish sneakers.',
        'image': 'assets/products/prod1.jpg',
        'price': 199,
        'rating': 4.3,
      },
      {
        'title': 'Backpack',
        'desc': 'Durable backpack for everyday use.',
        'image': 'assets/products/prod2.jpg',
        'price': 159,
        'rating': 4.6,
      },
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          categoryName,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Search bar
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search In $categoryName',
                hintStyle: GoogleFonts.poppins(
                  color: AppTheme.darkGrayColor,
                  fontSize: AppTheme.bodyMedium,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppTheme.darkGrayColor,
                ),
                fillColor: AppTheme.lightGrayColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
          // Horizontal cards
          SizedBox(
            height: 110,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: horizontalCards.length,
              separatorBuilder: (_, __) => const SizedBox(width: 18),
              itemBuilder: (context, index) {
                final card = horizontalCards[index];
                final labelMap = {
                  'Promotion': 'promo.png',
                  'Vendors': 'vendor.png',
                  'Shop': 'shop.png',
                  'Cloud': 'cloud.png',
                };
                final iconPath =
                    'assets/products/${labelMap[card['label']] ?? 'promo.png'}';
                return Container(
                  width: 110,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: AppTheme.lightGrayColor,
                      width: 2.5,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(iconPath, width: 48, height: 48),
                      const SizedBox(height: 8),
                      Text(
                        card['label'] as String,
                        style: GoogleFonts.poppins(
                          fontSize: AppTheme.caption,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.textColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          // Top Brands
          Text(
            'Top Brands',
            style: GoogleFonts.poppins(
              fontSize: AppTheme.bodyMedium,
              fontWeight: FontWeight.w600,
              color: AppTheme.textColor,
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: topBrands.length,
            itemBuilder: (context, index) {
              final iconPath = 'assets/icons/${index + 1}.png';
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ShopDetailScreen(brandIndex: index),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color: AppTheme.lightGrayColor,
                          width: 2.5,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(iconPath, width: 48, height: 48),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(
                            color: AppTheme.lightGrayColor,
                            width: 2.5,
                          ),
                        ),
                        child: Icon(Icons.verified, color: Colors.blue, size: 16),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          // Products title
          Text(
            'Products',
            style: GoogleFonts.poppins(
              fontSize: AppTheme.bodyMedium,
              fontWeight: FontWeight.w600,
              color: AppTheme.textColor,
            ),
          ),
          const SizedBox(height: 12),
          // Product grid using reusable ProductCard
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.60,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final p = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailScreen(
                        imageUrl: p['image'] as String,
                        name: p['title'] as String,
                        price: (p['price'] as num).toDouble(),
                        info: p['desc'] as String,
                        rating: (p['rating'] as num).toDouble(),
                        reviewCount: 7932,
                        shopName: 'Watch Store',
                      ),
                    ),
                  );
                },
                child: ProductCard(
                  imageUrl: p['image'] as String,
                  name: p['title'] as String,
                  price: (p['price'] as num).toDouble(),
                  info: p['desc'] as String,
                  rating: (p['rating'] as num).toDouble(),
                  reviewCount: 7932,
                  onFavorite: () {},
                  onAddToCart: () {},
                  isFavorite: false,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
