import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/banner_item.dart';
import '../../../core/widgets/custom_banner_slider.dart';
import '../../../core/widgets/product_card.dart';
import '../widgets/home_header.dart';
import '../widgets/section_header.dart';
import '../widgets/flash_sale_section.dart';
import 'category_tab.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  Map<String, dynamic>? user;
  final List<Map<String, dynamic>> products = [
    {
      'title': 'Black Hoodie',
      'price': 49.99,
      'description': 'Comfortable and stylish hoodie.',
      'rating': 4.5,
      'stock': 120,
    },
    {
      'title': 'Leather Bag',
      'price': 89.99,
      'description': 'Premium leather bag for all occasions.',
      'rating': 4.7,
      'stock': 80,
    },
    {
      'title': 'Headphone',
      'price': 29.99,
      'description': 'Wireless headphones with great sound.',
      'rating': 4.2,
      'stock': 200,
    },
    {
      'title': 'Shoes',
      'price': 59.99,
      'description': 'Running shoes for everyday use.',
      'rating': 4.3,
      'stock': 150,
    },
    {
      'title': 'Red Jacket',
      'price': 99.99,
      'description': 'Warm and trendy red jacket.',
      'rating': 4.8,
      'stock': 60,
    },
    {
      'title': 'Travel Backpack',
      'price': 39.99,
      'description': 'Spacious backpack for travel.',
      'rating': 4.4,
      'stock': 110,
    },
    {
      'title': 'Running Shoes',
      'price': 69.99,
      'description': 'Lightweight running shoes.',
      'rating': 4.6,
      'stock': 90,
    },
    {
      'title': 'Bluetooth Earbuds',
      'price': 24.99,
      'description': 'Compact and powerful earbuds.',
      'rating': 4.1,
      'stock': 140,
    },
  ];
  late TabController _tabController;

  // List of local asset image paths for product cards
  final List<String> productImages = [
    'assets/products/prod1.jpg',
    'assets/products/prod2.jpg',
    'assets/products/prod3.jpg'
  ];



  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header with user info and cart
            HomeHeader(
              userName: 'Webbyte',
              userImage: 'assets/images/user.png',
              subtitle: "let's go shopping",
              cartItemCount: 2,
            ),

            // Tab bar for Home and Category
            TabBar(
              controller: _tabController,
              labelColor: AppTheme.primaryColor,
              unselectedLabelColor: AppTheme.darkGrayColor,
              indicatorColor: AppTheme.primaryColor,
              tabs: const [
                Tab(text: 'Home'),
                Tab(text: 'Category'),
              ],
            ),

            // Tab content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Home tab content
                  _buildHomeContent(),

                  // Category tab content
                  const CategoryTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeContent() {
    return Container(
      color: const Color(0xFFF5F5F5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Top banner slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: BannerSlider(
                  height: 160,
                  items: [
                    BannerItem(
                      imageUrl: 'assets/images/banner1.jpg',
                      title: 'On Headphones',
                      subtitle: 'Exclusive Sales',
                      buttonText: 'Shop Now',
                      onButtonPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Flash Sale Section
            const FlashSaleSection(),
            const SizedBox(height: 24),
            SectionHeader(
              title: 'Trending Now',
              onSeeAllPressed: () {},
            ),
            // Trending products from API
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.62,
                ),
                itemCount: products.length > 8 ? 8 : products.length,
                itemBuilder: (context, index) {
                  final p = products[index];
                  return Container(
                    margin: const EdgeInsets.all(4),
                    child: ProductCard(
                      imageUrl: productImages[index % productImages.length],
                      name: p['title'] ?? '',
                      price: (p['price'] ?? 0).toDouble(),
                      info: p['description'] ?? '',
                      rating: (p['rating'] ?? 0).toDouble(),
                      reviewCount: p['stock'] ?? 0,
                      onFavorite: () {},
                      onAddToCart: () {},
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Middle banner slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: BannerSlider(
                  height: 160,
                  items: [
                    BannerItem(
                      imageUrl: 'assets/images/banner2.jpg',
                      title: '50-40% OFF',
                      subtitle: 'Now in colours',
                      buttonText: 'Shop Now',
                      onButtonPressed: () {
                        // Handle shop now
                      },
                      isDark: true,
                    ),
                    // Add more banner items
                  ],
                ),
              ),
            ),

            // New Arrivals section
            SectionHeader(
              title: 'New Arrivals',
              onSeeAllPressed: () {
                // Handle see all
              },
            ),

            // New Arrival products in 2x2 grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.60,
                ),
                itemCount: products.length > 8 ? 8 : products.length,
                itemBuilder: (context, index) {
                  final p = products[index];
                  return ProductCard(
                    imageUrl: productImages[index % productImages.length],
                    name: p['title'] ?? '',
                    price: (p['price'] ?? 0).toDouble(),
                    info: p['description'] ?? '',
                    rating: (p['rating'] ?? 0).toDouble(),
                    reviewCount: p['stock'] ?? 0,
                    onFavorite: () {},
                    onAddToCart: () {},
                  );
                },
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
