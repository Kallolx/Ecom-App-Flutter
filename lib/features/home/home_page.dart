import 'package:flutter/material.dart';
import '../../core/widgets/custom_bottom_nav_bar.dart';
import 'screens/home_tab.dart';
import '../orders/screens/orders_screen.dart';
import '../wishlist/screens/wishlist_screen.dart';
import '../more/screens/more_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeTab(),
    const OrdersScreen(),
    const WishlistScreen(),
    const MoreScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}


