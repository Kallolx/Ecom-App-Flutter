import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';

class RestaurantDetailScreen extends StatefulWidget {
  final Map<String, dynamic> restaurant;
  
  const RestaurantDetailScreen({
    super.key,
    required this.restaurant,
  });

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;
  late List<String> tabs;
  late List<List<Map<String, dynamic>>> menusPerTab;

  @override
  void initState() {
    super.initState();
    // Initialize tabs and menus from restaurant data (fallback to defaults)
    final restaurant = widget.restaurant;
    tabs = List<String>.from(restaurant['tabs'] ?? ['LUNCH MENU', 'FAST FOOD MENU', 'DRINKS']);

    // menus expected as a Map<String, List<Map>> keyed by tab title, or as a List<List<Map>>
    if (restaurant['menus'] != null && restaurant['menus'] is Map) {
      final Map m = restaurant['menus'] as Map;
      menusPerTab = tabs.map((t) {
        final list = m[t];
        if (list is List) return List<Map<String, dynamic>>.from(list);
        return <Map<String, dynamic>>[];
      }).toList();
    } else if (restaurant['menus'] != null && restaurant['menus'] is List) {
      menusPerTab = List<List<Map<String, dynamic>>>.from(restaurant['menus']);
      // if lengths mismatch, pad or trim
      if (menusPerTab.length < tabs.length) {
        final defaultMenu = menusPerTab.isNotEmpty ? menusPerTab[0] : <Map<String, dynamic>>[];
        while (menusPerTab.length < tabs.length) menusPerTab.add(defaultMenu);
      }
    } else {
      // Fallback sample menu (same as previous local sample)
      final sample = [
        {
          'name': 'Makroni Saldato Chicken',
          'description': 'Macaroni Saldato with chicken is a spicy and delicious Somali-style pasta dish made...',
          'price': 3.01,
          'originalPrice': 5.00,
          'discount': 30,
          'image': 'assets/products/food1.png',
        },
        {
          'name': 'Makroni Saldato Meat',
          'description': 'Macaroni Saldato with meat is a spicy Somali-style pasta dish made...',
          'price': 3.01,
          'originalPrice': 5.00,
          'discount': 30,
          'image': 'assets/products/food2.png',
        },
        {
          'name': 'Pasta Alfredo cheese Fish',
          'description': 'Fish Alfredo pasta is a creamy dish made with pasta, cooked fish, Alfre...',
          'price': 3.50,
          'originalPrice': 5.00,
          'discount': 30,
          'image': 'assets/products/food3.png',
        },
      ];
      menusPerTab = List.generate(tabs.length, (_) => List<Map<String, dynamic>>.from(sample));
    }

    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final restaurant = widget.restaurant;
    
    // sample menu removed - menus come from `menusPerTab`

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // App bar with cover image
          SliverAppBar(
            expandedHeight: 240,
            floating: false,
            pinned: true,
            backgroundColor: Colors.white,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.location_on, color: Colors.black),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: () {},
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Use a clipped, error-safe background image so small icons (e.g. gas.png)
                  // used as coverImage won't break the layout or look distorted.
                  Positioned.fill(
                    child: ClipRect(
                      child: Image.asset(
                        restaurant['coverImage'] ?? 'assets/products/rescover.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        alignment: Alignment.center,
                        errorBuilder: (context, error, stackTrace) {
                          // If cover image fails, show a pleasant gradient and the restaurant logo centered
                          return Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.grey.shade300, Colors.grey.shade200],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                child: Image.asset(
                                  restaurant['logo'] ?? 'assets/products/prod1.jpg',
                                  fit: BoxFit.contain,
                                  width: 120,
                                  height: 120,
                                  errorBuilder: (c, e, s) => const SizedBox.shrink(),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // Restaurant info overlay
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Restaurant logo
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(restaurant['logo'] ?? 'assets/products/prod1.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Restaurant details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    // Allow name to shrink/wrap and not push the verified badge off-screen
                                    Flexible(
                                      child: Text(
                                        restaurant['name'] ?? 'Restaurant Name',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.verified, color: Colors.white, size: 16),
                                          const SizedBox(width: 4),
                                          Text(
                                            'Verified',
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
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
                                    const Icon(Icons.location_on, color: Colors.red, size: 16),
                                    const SizedBox(width: 4),
                                    // Constrain location so it can't overflow the row
                                    Expanded(
                                      child: Text(
                                        restaurant['location'] ?? 'Location',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
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
                                    const Icon(Icons.star, color: Colors.orange, size: 16),
                                    const SizedBox(width: 4),
                                    // Allow rating text to truncate if needed
                                    Flexible(
                                      child: Text(
                                        '${restaurant['rating'] ?? 4.6} (${restaurant['reviews'] ?? 100}+)'
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        const Icon(Icons.access_time, size: 16, color: Colors.grey),
                                        const SizedBox(width: 4),
                                        Text(
                                          restaurant['deliveryTime'] ?? '25 - 40 mins',
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
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
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Text(
                                      restaurant['deliveredBy'] ?? 'Geeys',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
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
                  ),
                ],
              ),
            ),
          ),
          // Search bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search in ${restaurant['name'] ?? 'Restaurant'}...',
                  hintStyle: GoogleFonts.poppins(
                    color: AppTheme.darkGrayColor,
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(Icons.search, color: AppTheme.darkGrayColor),
                  suffixIcon: const Icon(Icons.tune, color: AppTheme.darkGrayColor),
                  fillColor: AppTheme.lightGrayColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ),
          // About section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    restaurant['about'] ?? 'This is a modern restaurant delivering reliable and delicious food solutions.',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          // Tabs + TabBarView driven by `tabs` and `menusPerTab`
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: tabs.asMap().entries.map((e) {
                      final idx = e.key;
                      final title = e.value;
                      return Expanded(child: _buildTab(title, idx));
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: menusPerTab.map((menuList) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: menuList.length,
                  itemBuilder: (context, index) {
                    final item = menuList[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          // Food image
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(item['image'] as String),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: item['discount'] != null
                                ? Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: const BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                      ),
                                      child: Text(
                                        '-${item['discount']}%',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                          const SizedBox(width: 12),
                          // Food details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'] as String,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['description'] as String,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                    height: 1.3,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      '\$${item['price']}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    if (item['originalPrice'] != null) ...[
                                      const SizedBox(width: 8),
                                      Text(
                                        '\$${item['originalPrice']}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        // open restaurant detail when tapping a restaurant-card style item
                                        if (item['restaurant'] != null && item['restaurant'] is Map) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => RestaurantDetailScreen(
                                                restaurant: Map<String, dynamic>.from(item['restaurant']),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        decoration: const BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        _tabController.animateTo(index);
      },
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 2,
            width: title.length * 6.0,
            color: isSelected ? Colors.orange : Colors.transparent,
          ),
        ],
      ),
    );
  }
}