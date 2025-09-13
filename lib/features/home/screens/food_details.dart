import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';
import 'restaurant_detail_screen.dart'; // Import the RestaurantDetailScreen

class FoodDetailScreen extends StatelessWidget {
  final String categoryName;
  const FoodDetailScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // Sample horizontal cards
    final horizontalCards = [
      {'icon': Icons.percent, 'label': 'Resturants'},
      {'icon': Icons.storefront, 'label': 'Sweets'},
      {'icon': Icons.shopping_bag, 'label': 'Coffee'},
      {'icon': Icons.local_offer, 'label': 'Fast Food'},
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
    // Sample restaurants
    final restaurants = [
      {
        'name': 'Oshaad To Go',
        'location': 'Dabka Wabari Mogadishu',
        'rating': 4.6,
        'reviews': 100,
        'deliveryTime': '25 - 40 mins',
        'deliveredBy': 'Geeys',
        'coverImage': 'assets/products/rescover.png',
        'logo': 'assets/products/food1.png',
        'about': 'Oshaad To Go is a modern restaurant delivering reliable and delicious Somali food solutions.',
      },
      {
        'name': 'Barakad Restaurant',
        'location': 'Hodan District Mogadishu',
        'rating': 4.8,
        'reviews': 150,
        'deliveryTime': '20 - 35 mins',
        'deliveredBy': 'Geeys',
        'coverImage': 'assets/products/rescover.png',
        'logo': 'assets/products/food2.png',
        'about': 'Barakad Restaurant is known for authentic Somali cuisine and fast delivery service.',
      },
      {
        'name': 'Sahan Kitchen',
        'location': 'Karaan District Mogadishu',
        'rating': 4.5,
        'reviews': 80,
        'deliveryTime': '30 - 45 mins',
        'deliveredBy': 'Geeys',
        'coverImage': 'assets/products/rescover.png',
        'logo': 'assets/products/food3.png',
        'about': 'Sahan Kitchen specializes in traditional and modern fusion dishes.',
      },
      {
        'name': 'Deeq Restaurant',
        'location': 'Waberi District Mogadishu',
        'rating': 4.7,
        'reviews': 120,
        'deliveryTime': '25 - 40 mins',
        'deliveredBy': 'Geeys',
        'coverImage': 'assets/products/rescover.png',
        'logo': 'assets/products/food1.png',
        'about': 'Deeq Restaurant offers premium dining experience with home delivery.',
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
                  'Resturants': 'res.png',
                  'Sweets': 'sw.png',
                  'Coffee': 'co.png',
                  'Fast Food': 'ff.png',
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
                      builder: (_) => RestaurantDetailScreen(restaurant: restaurants[index % restaurants.length]),
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
          // Restaurants title
          Text(
            'Restaurants',
            style: GoogleFonts.poppins(
              fontSize: AppTheme.bodyMedium,
              fontWeight: FontWeight.w600,
              color: AppTheme.textColor,
            ),
          ),
          const SizedBox(height: 12),
          // Restaurant cards
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RestaurantDetailScreen(
                        restaurant: restaurant,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    border: Border.all(
                      color: AppTheme.lightGrayColor,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      // Restaurant logo
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(restaurant['logo'] as String),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Restaurant details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  restaurant['name'] as String,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.verified, color: Colors.white, size: 12),
                                      const SizedBox(width: 2),
                                      Text(
                                        'Verified',
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.location_on, color: Colors.red, size: 14),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    restaurant['location'] as String,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.orange, size: 14),
                                const SizedBox(width: 4),
                                Text(
                                  '${restaurant['rating']} (${restaurant['reviews']}+)',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    const Icon(Icons.access_time, size: 14, color: Colors.grey),
                                    const SizedBox(width: 4),
                                    Text(
                                      restaurant['deliveryTime'] as String,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  'Delivered by ',
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  restaurant['deliveredBy'] as String,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
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
        ],
      ),
    );
  }
}
