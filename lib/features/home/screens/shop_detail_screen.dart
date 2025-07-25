import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/widgets/product_card.dart';
import '../../../core/theme/app_theme.dart';

class ShopDetailScreen extends StatefulWidget {
  final int brandIndex;
  const ShopDetailScreen({super.key, required this.brandIndex});

  @override
  State<ShopDetailScreen> createState() => _ShopDetailScreenState();
}

class _ShopDetailScreenState extends State<ShopDetailScreen> {
  int selectedTab = 0; // 0: All, 1: Popular, 2: New

  @override
  Widget build(BuildContext context) {
    final logoPath = 'assets/icons/${widget.brandIndex + 1}.png';
    final shopName = 'T-Shirt Store';
    final itemCount = 145;
    final rating = 92;
    // Sample products for each tab
    final allProducts = [
      {
        'imageUrl': 'assets/products/prod2.jpg',
        'name': 'Leather Bag',
        'price': 499.0,
        'info': 'Autumn And Winter Casual cotton-padded jacket...',
        'rating': 4.5,
        'reviewCount': 7932,
      },
      {
        'imageUrl': 'assets/products/prod3.jpg',
        'name': 'Shoes',
        'price': 499.0,
        'info': 'Autumn And Winter Casual cotton-padded jacket...',
        'rating': 4.5,
        'reviewCount': 7932,
      },
      {
        'imageUrl': 'assets/products/prod2.jpg',
        'name': 'Headphone',
        'price': 499.0,
        'info': 'Autumn And Winter Casual cotton-padded jacket...',
        'rating': 4.5,
        'reviewCount': 7932,
      },
      {
        'imageUrl': 'assets/products/prod1.jpg',
        'name': 'Black Hoodie',
        'price': 499.0,
        'info': 'Autumn And Winter Casual cotton-padded jacket...',
        'rating': 4.5,
        'reviewCount': 7932,
      },
    ];
    final popularProducts = [
      ...allProducts,
      {
        'imageUrl': 'assets/products/prod4.jpg',
        'name': 'Popular Bag',
        'price': 599.0,
        'info': 'Popular item for autumn...',
        'rating': 4.7,
        'reviewCount': 9000,
      },
    ];
    final newProducts = [
      ...allProducts,
      {
        'imageUrl': 'assets/products/prod5.jpg',
        'name': 'New Arrival',
        'price': 699.0,
        'info': 'Brand new for this season...',
        'rating': 4.8,
        'reviewCount': 1200,
      },
    ];
    List<Map<String, dynamic>> products;
    if (selectedTab == 1) {
      products = popularProducts;
    } else if (selectedTab == 2) {
      products = newProducts;
    } else {
      products = allProducts;
    }
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Shop Details', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: AppTheme.lightGrayColor,
                backgroundImage: AssetImage(logoPath),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(shopName, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text('$itemCount Items Listed', style: GoogleFonts.poppins(fontSize: 13, color: AppTheme.darkGrayColor)),
                    const SizedBox(height: 2),
                    Text('$rating% Positive Seller Ratings', style: GoogleFonts.poppins(fontSize: 13, color: Colors.orange)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.message, color: Colors.white),
                  const SizedBox(width: 8),
                  Text('Message Now', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Search bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: GoogleFonts.poppins(color: AppTheme.darkGrayColor, fontSize: AppTheme.bodyMedium),
              prefixIcon: const Icon(Icons.search, color: AppTheme.darkGrayColor),
              fillColor: AppTheme.lightGrayColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
          const SizedBox(height: 16),
          // Tabs
          Row(
            children: [
              GestureDetector(
                onTap: () => setState(() => selectedTab = 0),
                child: Column(
                  children: [
                    Text('All', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: selectedTab == 0 ? AppTheme.primaryColor : AppTheme.darkGrayColor)),
                    if (selectedTab == 0)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        height: 1.5, // Thinner underline
                        width: 28,
                        color: AppTheme.primaryColor,
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () => setState(() => selectedTab = 1),
                child: Column(
                  children: [
                    Text('Popular', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500, color: selectedTab == 1 ? AppTheme.primaryColor : AppTheme.darkGrayColor)),
                    if (selectedTab == 1)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        height: 1.5, // Thinner underline
                        width: 44,
                        color: AppTheme.primaryColor,
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () => setState(() => selectedTab = 2),
                child: Column(
                  children: [
                    Text('New', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500, color: selectedTab == 2 ? AppTheme.primaryColor : AppTheme.darkGrayColor)),
                    if (selectedTab == 2)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        height: 1.5, // Thinner underline
                        width: 28,
                        color: AppTheme.primaryColor,
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18), // Increased gap before product grid
          // Product grid
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.60,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final p = products[index];
                return ProductCard(
                  imageUrl: p['imageUrl'] as String,
                  name: p['name'] as String,
                  price: p['price'] as double,
                  info: p['info'] as String,
                  rating: p['rating'] as double,
                  reviewCount: p['reviewCount'] as int,
                  onFavorite: () {},
                  onAddToCart: () {},
                  isFavorite: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
