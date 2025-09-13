import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int _selectedCategoryIndex = 0;
  final Map<String, bool> _expandedSubCategories = {};
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleNavigationArguments();
    });
  }
  
  void _handleNavigationArguments() {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      final selectedCategoryIndex = args['selectedCategoryIndex'] as int?;
      final selectedSubcategoryName = args['selectedSubcategoryName'] as String?;
      
      if (selectedCategoryIndex != null) {
        setState(() {
          _selectedCategoryIndex = selectedCategoryIndex;
        });
        
        // If subcategory name is provided, find and expand it
        if (selectedSubcategoryName != null && _selectedCategoryIndex != 0) {
          _expandTargetSubcategory(selectedSubcategoryName);
        }
      }
    }
  }
  
  void _expandTargetSubcategory(String targetSubcategoryName) {
    final currentSubCategories = subCategories[_selectedCategoryIndex];
    
    for (int index = 0; index < currentSubCategories.length; index++) {
      final subCategory = currentSubCategories[index];
      final categoryKey = '${_selectedCategoryIndex}_$index';
      
      // Check if this subcategory matches the target name
      if (subCategory['name'].toString().toLowerCase().contains(targetSubcategoryName.toLowerCase()) ||
          targetSubcategoryName.toLowerCase().contains(subCategory['name'].toString().toLowerCase())) {
        setState(() {
          _expandedSubCategories[categoryKey] = true;
        });
        break;
      }
    }
  }

  // Main categories data
  final List<Map<String, dynamic>> mainCategories = [
    {'name': 'Just for You', 'icon': Icons.person, 'isSelected': true},
    {
      'name': "Women's & Girls' Fashion",
      'icon': Icons.checkroom,
      'isSelected': false,
    },
    {
      'name': "Men's & Boys' Fashion",
      'icon': Icons.person_outline,
      'isSelected': false,
    },
    {'name': 'Electronic Accessories', 'icon': Icons.usb, 'isSelected': false},
    {'name': 'TV & Home Appliances', 'icon': Icons.tv, 'isSelected': false},
    {
      'name': 'Electronics Device',
      'icon': Icons.camera_alt,
      'isSelected': false,
    },
    {'name': 'Mother & Baby', 'icon': Icons.child_care, 'isSelected': false},
    {
      'name': 'Automotive & Motorbike',
      'icon': Icons.directions_car,
      'isSelected': false,
    },
    {
      'name': 'Sports & Outdoors',
      'icon': Icons.sports_basketball,
      'isSelected': false,
    },
    {'name': 'Home & Lifestyle', 'icon': Icons.weekend, 'isSelected': false},
    {'name': 'Groceries', 'icon': Icons.shopping_basket, 'isSelected': false},
    {
      'name': 'Health & Beauty',
      'icon': Icons.face_retouching_natural,
      'isSelected': false,
    },
  ];

  // Sub-categories data for each main category
  final List<List<Map<String, dynamic>>> subCategories = [
    // Just for You - No dropdown
    [
      {'name': 'Gaming Headsets', 'image': 'assets/products/prod1.jpg', 'hasDropdown': false},
      {'name': 'In-Ear Headphones', 'image': 'assets/products/prod2.jpg', 'hasDropdown': false},
      {'name': 'Heaters', 'image': 'assets/products/prod3.jpg', 'hasDropdown': false},
      {'name': 'Freezers', 'image': 'assets/products/prod1.jpg', 'hasDropdown': false},
      {'name': 'Hoses & Pipes', 'image': 'assets/products/prod2.jpg', 'hasDropdown': false},
      {'name': 'Black Tea', 'image': 'assets/products/prod3.jpg', 'hasDropdown': false},
      {'name': 'Cheese Tools', 'image': 'assets/products/prod1.jpg', 'hasDropdown': false},
      {'name': 'Kitchen Fittings', 'image': 'assets/products/prod2.jpg', 'hasDropdown': false},
      {'name': 'Womens Fashion', 'image': 'assets/products/prod3.jpg', 'hasDropdown': false},
    ],
    // Women's & Girls' Fashion - With dropdown
    [
      {'name': 'Dresses', 'image': 'assets/products/prod1.jpg', 'hasDropdown': true, 'items': ['Casual', 'Formal', 'Evening', 'Summer']},
      {'name': 'Tops', 'image': 'assets/products/prod2.jpg', 'hasDropdown': true, 'items': ['T-Shirts', 'Blouses', 'Tank Tops', 'Crop Tops']},
      {'name': 'Bottoms', 'image': 'assets/products/prod3.jpg', 'hasDropdown': true, 'items': ['Jeans', 'Leggings', 'Shorts', 'Skirts']},
      {'name': 'Shoes', 'image': 'assets/products/prod1.jpg', 'hasDropdown': true, 'items': ['Sneakers', 'Heels', 'Flats', 'Boots']},
      {'name': 'Bags', 'image': 'assets/products/prod2.jpg', 'hasDropdown': true, 'items': ['Handbags', 'Backpacks', 'Clutches', 'Tote Bags']},
      {'name': 'Accessories', 'image': 'assets/products/prod3.jpg', 'hasDropdown': true, 'items': ['Jewelry', 'Scarves', 'Belts', 'Watches']},
    ],
    // Men's & Boys' Fashion - With dropdown
    [
      {'name': 'Shirts', 'image': 'assets/products/prod1.jpg', 'hasDropdown': true, 'items': ['Casual Shirts', 'Formal Shirts', 'T-Shirts', 'Polo Shirts']},
      {'name': 'Pants', 'image': 'assets/products/prod2.jpg', 'hasDropdown': true, 'items': ['Jeans', 'Chinos', 'Formal Pants', 'Shorts']},
      {'name': 'Shoes', 'image': 'assets/products/prod3.jpg', 'hasDropdown': true, 'items': ['Sneakers', 'Formal Shoes', 'Boots', 'Sandals']},
      {'name': 'Watches', 'image': 'assets/products/prod1.jpg', 'hasDropdown': true, 'items': ['Smart Watches', 'Analog Watches', 'Digital Watches', 'Sports Watches']},
      {'name': 'Belts', 'image': 'assets/products/prod2.jpg', 'hasDropdown': true, 'items': ['Leather Belts', 'Canvas Belts', 'Designer Belts', 'Casual Belts']},
    ],
    // Electronic Accessories - With dropdown
    [
      {'name': 'Phone Cases', 'image': 'assets/products/prod1.jpg', 'hasDropdown': true, 'items': ['iPhone Cases', 'Samsung Cases', 'OnePlus Cases', 'Xiaomi Cases']},
      {'name': 'Chargers', 'image': 'assets/products/prod2.jpg', 'hasDropdown': true, 'items': ['Fast Chargers', 'Wireless Chargers', 'Car Chargers', 'Power Banks']},
      {'name': 'Cables', 'image': 'assets/products/prod3.jpg', 'hasDropdown': true, 'items': ['USB-C Cables', 'Lightning Cables', 'Micro USB', 'HDMI Cables']},
      {'name': 'Screen Protectors', 'image': 'assets/products/prod1.jpg', 'hasDropdown': true, 'items': ['Tempered Glass', 'Privacy Screen', 'Anti-Glare', 'Liquid Screen']},
    ],
    // TV & Home Appliances - With dropdown
    [
      {'name': 'Smart TVs', 'image': 'assets/products/prod2.jpg', 'hasDropdown': true, 'items': ['LED TVs', 'OLED TVs', '4K TVs', '8K TVs']},
      {'name': 'Refrigerators', 'image': 'assets/products/prod3.jpg', 'hasDropdown': true, 'items': ['Single Door', 'Double Door', 'French Door', 'Side by Side']},
      {'name': 'Washing Machines', 'image': 'assets/products/prod1.jpg', 'hasDropdown': true, 'items': ['Front Load', 'Top Load', 'Semi Automatic', 'Fully Automatic']},
      {'name': 'Air Conditioners', 'image': 'assets/products/prod2.jpg', 'hasDropdown': true, 'items': ['Split AC', 'Window AC', 'Portable AC', 'Central AC']},
    ],
    // Electronics Device - With dropdown
    [
      {'name': 'Smartphones', 'image': 'assets/products/prod3.jpg', 'hasDropdown': true, 'items': ['iPhone', 'Samsung Galaxy', 'OnePlus', 'Xiaomi']},
      {'name': 'Laptops', 'image': 'assets/products/prod1.jpg', 'hasDropdown': true, 'items': ['Gaming Laptops', 'Business Laptops', 'Ultrabooks', '2-in-1 Laptops']},
      {'name': 'Tablets', 'image': 'assets/products/prod2.jpg', 'hasDropdown': true, 'items': ['iPad', 'Samsung Tablets', 'Android Tablets', 'Windows Tablets']},
      {'name': 'Cameras', 'image': 'assets/products/prod3.jpg', 'hasDropdown': true, 'items': ['DSLR', 'Mirrorless', 'Action Cameras', 'Instant Cameras']},
    ],
    // Mother & Baby - With dropdown
    [
      {'name': 'Diapers', 'image': 'assets/products/prod1.jpg', 'hasDropdown': true, 'items': ['Newborn', 'Size 1', 'Size 2', 'Size 3']},
      {'name': 'Baby Food', 'image': 'assets/products/prod2.jpg', 'hasDropdown': true, 'items': ['Formula Milk', 'Cereal', 'Purees', 'Snacks']},
      {'name': 'Toys', 'image': 'assets/products/prod3.jpg', 'hasDropdown': true, 'items': ['Educational Toys', 'Soft Toys', 'Action Figures', 'Building Blocks']},
      {'name': 'Clothing', 'image': 'assets/products/prod1.jpg', 'hasDropdown': true, 'items': ['Onesies', 'Dresses', 'Pants', 'Accessories']},
    ],
    // Automotive & Motorbike - With dropdown
    [
      {'name': 'Car Accessories', 'image': 'assets/products/prod2.jpg', 'hasDropdown': true, 'items': ['Car Covers', 'Floor Mats', 'Seat Covers', 'Air Fresheners']},
      {'name': 'Motorcycle Parts', 'image': 'assets/products/prod3.jpg', 'hasDropdown': true, 'items': ['Helmets', 'Gloves', 'Jackets', 'Boots']},
      {'name': 'Tools', 'image': 'assets/products/prod1.jpg', 'hasDropdown': true, 'items': ['Wrenches', 'Screwdrivers', 'Tool Kits', 'Jack Stands']},
      {'name': 'Oils', 'image': 'assets/products/prod2.jpg', 'hasDropdown': true, 'items': ['Engine Oil', 'Brake Oil', 'Gear Oil', 'Coolant']},
    ],
    // Sports & Outdoors - With dropdown
    [
      {'name': 'Balls', 'image': 'assets/products/prod3.jpg', 'hasDropdown': true, 'items': ['Football', 'Basketball', 'Tennis Ball', 'Cricket Ball']},
      {'name': 'Exercise Equipment', 'image': 'assets/products/prod1.jpg', 'hasDropdown': true, 'items': ['Dumbbells', 'Treadmill', 'Exercise Bike', 'Yoga Mats']},
      {'name': 'Outdoor Gear', 'image': 'assets/products/prod2.jpg', 'hasDropdown': true, 'items': ['Tents', 'Sleeping Bags', 'Backpacks', 'Camping Chairs']},
      {'name': 'Fitness Wear', 'image': 'assets/products/prod3.jpg', 'hasDropdown': true, 'items': ['Gym Shirts', 'Leggings', 'Sports Bras', 'Running Shoes']},
    ],
    // Home & Lifestyle - With dropdown
    [
      {'name': 'Furniture', 'image': 'assets/products/prod1.jpg', 'hasDropdown': true, 'items': ['Sofas', 'Beds', 'Tables', 'Chairs']},
      {'name': 'Decor', 'image': 'assets/products/prod2.jpg', 'hasDropdown': true, 'items': ['Wall Art', 'Vases', 'Candles', 'Plants']},
      {'name': 'Kitchen Items', 'image': 'assets/products/prod3.jpg', 'hasDropdown': true, 'items': ['Cookware', 'Utensils', 'Storage', 'Appliances']},
      {'name': 'Bedding', 'image': 'assets/products/prod1.jpg', 'hasDropdown': true, 'items': ['Bed Sheets', 'Pillows', 'Comforters', 'Blankets']},
    ],
    // Groceries - With dropdown
    [
      {'name': 'Fresh Produce', 'image': 'assets/products/prod2.jpg', 'hasDropdown': true, 'items': ['Fruits', 'Vegetables', 'Herbs', 'Organic']},
      {'name': 'Dairy', 'image': 'assets/products/prod3.jpg', 'hasDropdown': true, 'items': ['Milk', 'Cheese', 'Yogurt', 'Butter']},
      {'name': 'Beverages', 'image': 'assets/products/prod1.jpg', 'hasDropdown': true, 'items': ['Soft Drinks', 'Juices', 'Water', 'Energy Drinks']},
      {'name': 'Snacks', 'image': 'assets/products/prod2.jpg', 'hasDropdown': true, 'items': ['Chips', 'Cookies', 'Nuts', 'Candy']},
    ],
    // Health & Beauty - With dropdown
    [
      {'name': 'Skincare', 'image': 'assets/products/prod3.jpg', 'hasDropdown': true, 'items': ['Cleansers', 'Moisturizers', 'Serums', 'Sunscreen']},
      {'name': 'Makeup', 'image': 'assets/products/prod1.jpg', 'hasDropdown': true, 'items': ['Foundation', 'Lipstick', 'Mascara', 'Eyeshadow']},
      {'name': 'Hair Care', 'image': 'assets/products/prod2.jpg', 'hasDropdown': true, 'items': ['Shampoo', 'Conditioner', 'Hair Oil', 'Styling Products']},
      {'name': 'Personal Care', 'image': 'assets/products/prod3.jpg', 'hasDropdown': true, 'items': ['Toothpaste', 'Deodorant', 'Body Wash', 'Perfume']},
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            _buildTopAppBar(),

            // Main Content
            Expanded(
              child: Row(
                children: [
                  // Left Sidebar - Main Categories
                  _buildLeftSidebar(),

                  // Right Content Area - Sub Categories
                  Expanded(child: _buildRightContent()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopAppBar() {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white, // White background
      ),
      child: Row(
        children: [
          // Left side - Back button and title
          Expanded(
            child: Row(
              children: [
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black87,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  mainCategories[_selectedCategoryIndex]['name'],
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Right side - Search, Cart, Menu (compact)
          Row(
            children: [
              // Search
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {},
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: const Icon(Icons.search, color: Colors.black87, size: 20),
                ),
              ),
              const SizedBox(width: 4),

              // Cart with optional badge
              Stack(
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: const Icon(Icons.shopping_cart, color: Colors.black87, size: 20),
                    ),
                  ),
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 4),

              // More
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {},
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: const Icon(Icons.more_horiz, color: Colors.black87, size: 20),
                ),
              ),
              const SizedBox(width: 2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLeftSidebar() {
    return Container(
      width: 100, // Reduced width from 120 to 100
      color: const Color(0xFFF5F5F5), // Light gray background
      child: ListView.builder(
        itemCount: mainCategories.length,
        itemBuilder: (context, index) {
          final category = mainCategories[index];
          final isSelected = _selectedCategoryIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors
                          .white // White background when selected
                    : Colors.transparent,
                border: Border(
                  left: BorderSide(
                    color: isSelected ? Colors.orange : Colors.transparent,
                    width: 4,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    category['icon'],
                    color: isSelected ? Colors.orange : Colors.black54,
                    size: 24,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category['name'],
                    style: TextStyle(
                      color: isSelected ? Colors.orange : Colors.black87,
                      fontSize: 12,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRightContent() {
  final currentSubCategories = subCategories[_selectedCategoryIndex];
  final isJustForYou = _selectedCategoryIndex == 0;
  // Estimate available width for the right content area (left sidebar is 100)
  final rightSideWidth = MediaQuery.of(context).size.width - 100;

    if (isJustForYou) {
      // For "Just for You" - show grid without dropdowns
  const int crossCount = 3;
  const horizontalPadding = 16.0;
  const crossAxisSpacing = 12.0;
  const mainAxisSpacing = 16.0;
  final itemWidth = (rightSideWidth - (crossCount - 1) * crossAxisSpacing - horizontalPadding * 2) / crossCount;
  const imageHeight = 70.0;
  const textEstimate = 46.0; // allow up to ~2 lines of text (increase to avoid tiny overflow)
      final desiredItemHeight = imageHeight + 6.0 + textEstimate;
      final childAspectRatio = itemWidth / desiredItemHeight;

      return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(horizontalPadding),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossCount,
            mainAxisSpacing: mainAxisSpacing,
            crossAxisSpacing: crossAxisSpacing,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: currentSubCategories.length,
          itemBuilder: (context, index) {
            final subCategory = currentSubCategories[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: imageHeight,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        subCategory['image'],
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
                  const SizedBox(height: 6), // Reduced from 8 to 6
                  SizedBox(
                    width: itemWidth,
                    child: Text(
                      subCategory['name'],
                      style: const TextStyle(fontSize: 11, color: Colors.black87),
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
      );
    } else {
      // For other categories - show list with dropdowns
      return Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: currentSubCategories.length,
          itemBuilder: (context, index) {
            final subCategory = currentSubCategories[index];
            final categoryKey = '${_selectedCategoryIndex}_$index';
            final isExpanded = _expandedSubCategories[categoryKey] ?? false;

            return Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.shade200, width: 0.5),
                  bottom: BorderSide(color: Colors.grey.shade200, width: 0.5),
                ),
              ),
              child: Column(
                children: [
                  // Main category item - no image, just text and arrow
                  InkWell(
                    onTap: () {
                      setState(() {
                        _expandedSubCategories[categoryKey] = !isExpanded;
                      });
                    },
                    child: SizedBox(
                      height: 70, // Increased height from 60 to 70
                      child: Row(
                        children: [
                          const SizedBox(width: 24), // Increased from 20 to 24
                          
                          // Category name
                          Expanded(
                            child: Text(
                              subCategory['name'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          
                          // Vertical line separator
                          Container(
                            height: 30,
                            width: 1,
                            color: Colors.grey.shade200, // Much lighter gray
                          ),
                          
                          const SizedBox(width: 24), // Increased from 20 to 24
                          
                          // Dropdown arrow
                          Icon(
                            isExpanded 
                              ? Icons.keyboard_arrow_up 
                              : Icons.keyboard_arrow_down,
                            color: Colors.black87, // Changed from gray to black
                            size: 24,
                          ),
                          
                          const SizedBox(width: 24), // Increased from 20 to 24
                        ],
                      ),
                    ),
                  ),
                  
                  // Expanded items - grid layout with images like "Just for You"
                  if (isExpanded && subCategory['items'] != null)
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                      child: Builder(builder: (context) {
                        const int crossCount = 3;
                        const horizontalPadding = 16.0;
                        const crossAxisSpacing = 12.0;
                        const mainAxisSpacing = 16.0;
                        final itemWidth = (rightSideWidth - (crossCount - 1) * crossAxisSpacing - horizontalPadding * 2) / crossCount;
                        const imageHeight = 70.0;
                        const textEstimate = 46.0;
                        final desiredItemHeight = imageHeight + 6.0 + textEstimate;
                        final childAspectRatio = itemWidth / desiredItemHeight;

                        final items = subCategory['items'] as List;

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossCount,
                            mainAxisSpacing: mainAxisSpacing,
                            crossAxisSpacing: crossAxisSpacing,
                            childAspectRatio: childAspectRatio,
                          ),
                          itemCount: items.length,
                          itemBuilder: (context, itemIndex) {
                            final item = items[itemIndex];
                            return GestureDetector(
                              onTap: () => print('Tapped on: $item'),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 6.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: imageHeight,
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          subCategory['image'],
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
                                    SizedBox(
                                      width: itemWidth,
                                      child: Text(
                                        item,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 11, color: Colors.black87),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ),
                ],
              ),
            );
          },
        ),
      );
    }
  }
}
