import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatefulWidget {
  final Map<String, dynamic> category;

  const CategoryDetailScreen({
    super.key,
    required this.category,
  });

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  // Category-specific data
  Map<String, Map<String, dynamic>> categoryData = {
    'SUUQ': {
      'tabs': ['ELECTRONICS', 'FASHION', 'HOME & LIVING'],
      'products': [
        {
          'name': 'Smart Phone',
          'description': 'Latest smartphone with great features',
          'price': 299.00,
          'image': 'assets/products/prod1.jpg',
        },
        {
          'name': 'Wireless Headphones',
          'description': 'Premium wireless headphones',
          'price': 89.00,
          'image': 'assets/products/prod2.jpg',
        },
        {
          'name': 'Smart Watch',
          'description': 'Fitness tracking smartwatch',
          'price': 199.00,
          'image': 'assets/products/prod3.jpg',
        },
      ],
      'description': 'SUUQ is your one-stop shop for electronics, fashion, and home essentials.',
    },
    'Food': {
      'tabs': ['FRESH PRODUCE', 'SNACKS', 'BEVERAGES'],
      'products': [
        {
          'name': 'Fresh Fruits',
          'description': 'Organic seasonal fruits',
          'price': 12.00,
          'image': 'assets/products/prod1.jpg',
        },
        {
          'name': 'Premium Snacks',
          'description': 'Healthy and tasty snacks',
          'price': 8.00,
          'image': 'assets/products/prod2.jpg',
        },
        {
          'name': 'Natural Juice',
          'description': '100% natural fruit juice',
          'price': 6.00,
          'image': 'assets/products/prod3.jpg',
        },
      ],
      'description': 'Food category offers fresh produce, healthy snacks, and natural beverages.',
    },
    'Gas': {
      'tabs': ['GAS PRODUCTS', 'FULL KIT GAS', 'ACCESSORIES'],
      'products': [
        {
          'name': 'GAAS 6KG BIR',
          'description': '6KG metal gas cylinder',
          'price': 6.00,
          'image': 'assets/products/gas.png',
        },
        {
          'name': 'GAAS 20KG CAAG',
          'description': '20KG composite (CAAG) gas cylinder',
          'price': 20.00,
          'image': 'assets/products/gas.png',
        },
        {
          'name': 'GAAS 20KG BIR',
          'description': '20KG composite (CAAG) Lightweight, rust-proof, and safe',
          'price': 20.00,
          'image': 'assets/products/gas.png',
        },
      ],
      'description': 'Gas is a modern energy company delivering reliable and clean gas solutions.',
    },
    'Supermarkets': {
      'tabs': ['GROCERIES', 'HOUSEHOLD', 'PERSONAL CARE'],
      'products': [
        {
          'name': 'Fresh Vegetables',
          'description': 'Farm-fresh organic vegetables',
          'price': 15.00,
          'image': 'assets/products/prod1.jpg',
        },
        {
          'name': 'Cleaning Supplies',
          'description': 'Complete household cleaning kit',
          'price': 25.00,
          'image': 'assets/products/prod2.jpg',
        },
        {
          'name': 'Personal Care Kit',
          'description': 'Essential personal care items',
          'price': 30.00,
          'image': 'assets/products/prod3.jpg',
        },
      ],
      'description': 'Supermarkets provide all your daily essentials from groceries to household items.',
    },
    'Laundry': {
      'tabs': ['WASHING', 'DRYING', 'IRONING'],
      'products': [
        {
          'name': 'Premium Wash',
          'description': 'Professional washing service',
          'price': 8.00,
          'image': 'assets/products/prod1.jpg',
        },
        {
          'name': 'Express Dry',
          'description': 'Quick drying service',
          'price': 5.00,
          'image': 'assets/products/prod2.jpg',
        },
        {
          'name': 'Steam Iron',
          'description': 'Professional ironing service',
          'price': 3.00,
          'image': 'assets/products/prod3.jpg',
        },
      ],
      'description': 'Laundry services offering professional washing, drying, and ironing solutions.',
    },
    'Delivery': {
      'tabs': ['SAME DAY', 'SCHEDULED', 'EXPRESS'],
      'products': [
        {
          'name': 'Same Day Delivery',
          'description': 'Get your items delivered today',
          'price': 5.00,
          'image': 'assets/products/prod1.jpg',
        },
        {
          'name': 'Scheduled Delivery',
          'description': 'Plan your delivery time',
          'price': 3.00,
          'image': 'assets/products/prod2.jpg',
        },
        {
          'name': 'Express Delivery',
          'description': '2-hour express delivery',
          'price': 10.00,
          'image': 'assets/products/prod3.jpg',
        },
      ],
      'description': 'Delivery services with flexible timing options for your convenience.',
    },
  };

  late List<String> tabs;
  late List<Map<String, dynamic>> products;
  late String categoryDescription;

  @override
  void initState() {
    super.initState();
    
    // Get category-specific data
    String categoryName = widget.category['name'] ?? 'Gas';
    Map<String, dynamic>? currentCategoryData = categoryData[categoryName];
    
    if (currentCategoryData != null) {
      tabs = List<String>.from(currentCategoryData['tabs']);
      products = List<Map<String, dynamic>>.from(currentCategoryData['products']);
      categoryDescription = currentCategoryData['description'];
    } else {
      // Fallback to Gas data if category not found
      tabs = List<String>.from(categoryData['Gas']!['tabs']);
      products = List<Map<String, dynamic>>.from(categoryData['Gas']!['products']);
      categoryDescription = categoryData['Gas']!['description'];
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Cover image with overlay content
            _buildCoverSection(),
            
            // Search bar with filter
            _buildSearchSection(),
            
            // About section
            _buildAboutSection(),
            
            // Tabs with underline animation
            _buildTabsSection(),
            
            // Products content
            Expanded(
              child: _buildProductsContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoverSection() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1E3A8A), Color(0xFFFFA500)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Stack(
        children: [
          // Background pattern or image overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          
          // Back button
          Positioned(
            top: 16,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          
          // Logo, name and verified badge
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              children: [
                // Logo
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      widget.category['image'] ?? 'assets/products/gas.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                
                // Name and verified badge
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.category['name'] ?? 'Category',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.verified,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Verified',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Icon(
                Icons.search,
                color: Colors.grey,
                size: 20,
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search products...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.tune,
                  color: Colors.grey,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            categoryDescription,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTabsSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Custom tab bar with underline animation
          Row(
            children: tabs.asMap().entries.map((entry) {
              final index = entry.key;
              final title = entry.value;
              final isSelected = _selectedTabIndex == index;
              
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    _tabController.animateTo(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.orange : Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 2,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.orange : Colors.transparent,
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildProductsContent() {
    return TabBarView(
      controller: _tabController,
      children: tabs.map((tab) => _buildProductsList()).toList(),
    );
  }

  Widget _buildProductsList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              // Product image
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    product['image'],
                    fit: BoxFit.contain,
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
              const SizedBox(width: 16),
              
              // Product details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product['description'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${product['price'].toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Add to cart button (circular)
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    // Handle add to cart
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${product['name']} added to cart'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
