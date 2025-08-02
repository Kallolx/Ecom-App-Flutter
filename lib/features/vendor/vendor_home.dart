import 'package:flutter/material.dart';
import '../../features/vendor/widgets/vendor_bottom_nav_bar.dart';
import 'screens/vendor_home_screen.dart';
import 'my_order/vendor_order.dart';
import 'more/screens/more_screen.dart';
import 'chat/messages_screen.dart';

class VendorHome extends StatefulWidget {
  const VendorHome({super.key});

  @override
  State<VendorHome> createState() => _VendorHomeState();
}

class _VendorHomeState extends State<VendorHome> {
  int _currentIndex = 0;

  // For now, we only have the home screen with tabs
  // Other screens will be added later
  final List<Widget> _pages = [
    const VendorHomeScreen(),
    const VendorOrdersScreen(),
    const MessagesScreen(),
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
      bottomNavigationBar: VendorBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
