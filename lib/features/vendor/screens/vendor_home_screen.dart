import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import 'vendor_home_tab.dart';
import 'vendor_inventory_tab.dart';
import '../../home/widgets/home_header.dart';

class VendorHomeScreen extends StatefulWidget {
  const VendorHomeScreen({super.key});

  @override
  State<VendorHomeScreen> createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen> with SingleTickerProviderStateMixin {
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
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            HomeHeader(
              userName: 'Webbyte',
              userImage: 'assets/images/user.png',
              subtitle: 'Metal T-Shirt Store',
              cartItemCount: 0,
              onSearchTap: () {},
            ),

            // Tab bar
            TabBar(
              controller: _tabController,
              labelColor: AppTheme.primaryColor,
              unselectedLabelColor: AppTheme.darkGrayColor,
              indicatorColor: AppTheme.primaryColor,
              tabs: const [
                Tab(text: 'Home'),
                Tab(text: 'Inventory'),
              ],
            ),

            // Tab content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  VendorHomeTab(),
                  VendorInventoryTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
