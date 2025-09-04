import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/banner_item.dart';
import '../../../core/widgets/custom_banner_slider.dart';
import '../../../core/widgets/product_card.dart';
import '../widgets/home_header.dart';
import '../widgets/section_header.dart';
import '../widgets/flash_sale_section.dart';
import '../widgets/voucher_section.dart';
import '../widgets/sliding_tab_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _selectedTabIndex = 0;

  // Tab data with icons and names
  final List<Map<String, dynamic>> productTabs = [
    {'name': 'For You', 'icon': Icons.favorite},
    {'name': 'Hot Deals', 'icon': Icons.local_fire_department},
    {'name': 'Voucher Max', 'icon': Icons.card_giftcard},
    {'name': 'Daraz LooK', 'icon': Icons.person},
    {'name': 'Electronics', 'icon': Icons.devices},
    {'name': 'Fashion', 'icon': Icons.checkroom},
    {'name': 'Home & Living', 'icon': Icons.home},
    {'name': 'Sports', 'icon': Icons.sports_soccer},
    {'name': 'Beauty', 'icon': Icons.face_retouching_natural},
    {'name': 'Books', 'icon': Icons.menu_book},
  ];

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

  // List of local asset image paths for product cards
  final List<String> productImages = [
    'assets/products/prod1.jpg',
    'assets/products/prod2.jpg',
    'assets/products/prod3.jpg',
  ];

  // Top (compact) category tabs data
  final List<Map<String, dynamic>> topCategoryTabs = [
    {'image': 'assets/products/1.png', 'name': 'Win Gifts!'},
    {'image': 'assets/products/2.png', 'name': 'Buy any 4'},
    {'image': 'assets/products/3.png', 'name': 'Free delivery'},
    {'image': 'assets/products/4.png', 'name': 'DarazLook'},
    {'image': 'assets/products/5.png', 'name': 'Buy more Save More'},
    {'image': 'assets/products/6.png', 'name': 'Beauty'},
    {'image': 'assets/products/7.png', 'name': 'New Arrivals'},
    {'image': 'assets/products/8.png', 'name': 'Affiliates Program'},
    {'image': 'assets/products/9.png', 'name': 'Play & Win'},
  ];

  // Bottom (larger) category tabs with different display names
  final List<Map<String, dynamic>> bottomCategoryTabs = [
    {'image': 'assets/products/c1.png', 'name': 'Gaming Headsets'},
    {'image': 'assets/products/c2.png', 'name': 'In-Ear headphones'},
    {'image': 'assets/products/c3.png', 'name': 'Creakers'},
    {'image': 'assets/products/c4.png', 'name': 'Refrigerators'},
    {'image': 'assets/products/c5.png', 'name': 'Heater'},
    {'image': 'assets/products/c6.png', 'name': 'Kitchen Fittings'},
    {'image': 'assets/products/c7.png', 'name': 'Women\'s Fashion'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header with search bar and icons
            const HomeHeader(),

            // Home content directly without tabs
            Expanded(child: _buildHomeContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeContent() {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Top banner slider - reduced height and multiple images
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: BannerSlider(
                  height: 120,
                  showIndicator: false, // hide dot slider indicators per request
                  items: [
                    BannerItem(imageUrl: 'assets/images/banner1.png'),
                    BannerItem(imageUrl: 'assets/images/banner2.png'),
                    BannerItem(imageUrl: 'assets/images/banner3.png'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Horizontally scrollable category tabs (more compact - TOP)
            SizedBox(
              height: 76, // top compact slider height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: topCategoryTabs.length,
                itemBuilder: (context, index) {
                  final category = topCategoryTabs[index];
                  return Container(
                    width: 64, // Tighter width for top
                    height: 76, // match slider height so items align
                    margin: const EdgeInsets.only(right: 4), // tightened gap between tabs
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start, // keep image fixed at top
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Image container with reduced rounded corners
                        SizedBox(
                          width: 44,
                          height: 44,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              category['image'],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey.shade300,
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        // Category name (pushes down, not image)
                        Flexible(
                          child: Text(
                            category['name'],
                            style: const TextStyle(
                              fontSize: 10, // Slightly smaller font
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // Voucher Section
            const VoucherSection(),

            const SizedBox(height: 10),

            // Single GIF Banner Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/banner.gif.webp',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade300,
                        child: const Icon(
                          Icons.image_not_supported,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Flash Sale Section
            const FlashSaleSection(),

            // Categories Section
            SectionHeader(
              title: 'Categories',
              onSeeAllPressed: () {
                Navigator.pushNamed(context, AppRoutes.categories);
              },
            ),

            // Categories horizontal slider (BOTTOM - larger, distinct from top)
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: bottomCategoryTabs.length,
                itemBuilder: (context, index) {
                  final category = bottomCategoryTabs[index];
                  return Container(
                    width: 96,
                    height: 112, // increased height so bottom items are bigger than top
                    margin: const EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              category['image'],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey.shade300,
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Flexible(
                          child: Text(
                            category['name'],
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Product tabs with smooth sliding indicator
            SlidingTabBar(
              tabs: productTabs,
              selectedIndex: _selectedTabIndex,
              onTabSelected: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
            ),

            const SizedBox(height: 16),

            // Product grid for selected tab
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
