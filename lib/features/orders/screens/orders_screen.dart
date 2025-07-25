import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/order_card.dart';
import '../../../core/theme/app_theme.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
      appBar: AppBar(
        title: Text(
          'My Orders',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Navigate to search page
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              // Navigate to cart page
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: TabBar(
                controller: _tabController,
                labelColor: AppTheme.backgroundColor,
                unselectedLabelColor: AppTheme.darkGrayColor,
                indicator: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                tabs: [
                  Container(
                    height: 36,
                    alignment: Alignment.center,
                    child: const Text('Ongoing'),
                  ),
                  Container(
                    height: 36,
                    alignment: Alignment.center,
                    child: const Text('Completed'),
                  ),
                ],
                // Remove default underline
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                dividerColor: Colors.transparent,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Ongoing orders tab
                ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: 4, // Replace with actual order count
                  itemBuilder: (context, index) {
                    return const OrderCard(
                      orderId: '1245LQA8886AAXX',
                      orderDate: '26 Jun, 2025',
                      deliveryDate: '26 Jun, 2025',
                      price: 299,
                      status: 'In Progress',
                      imageUrl: 'assets/products/prod1.jpg', // Replace with actual image
                    );
                  },
                ),
                // Completed orders tab
                ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: 2, // Replace with actual order count
                  itemBuilder: (context, index) {
                    return const OrderCard(
                      orderId: '1245LQA8886AAXX',
                      orderDate: '25 Jun, 2025',
                      deliveryDate: '26 Jun, 2025',
                      price: 299,
                      status: 'Delivered',
                      imageUrl: 'assets/products/prod2.jpg', // Replace with actual image
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
