import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widget/order_card.dart';
import '../../../core/theme/app_theme.dart';
import '../../search/screens/search_screen.dart';
import '../../cart/screens/cart_screen.dart';

class VendorOrdersScreen extends StatefulWidget {
  const VendorOrdersScreen({super.key});

  @override
  State<VendorOrdersScreen> createState() => _VendorOrdersScreenState();
}

class _VendorOrdersScreenState extends State<VendorOrdersScreen> with SingleTickerProviderStateMixin {
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
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const SearchScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOutCubic;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 300),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      // ignore: prefer_const_constructors
                      CartScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOutCubic;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 300),
                ),
              );
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
                overlayColor: WidgetStateProperty.all(Colors.transparent),
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
