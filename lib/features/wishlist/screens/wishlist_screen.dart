import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/wishlist_item_card.dart';
import '../../cart/screens/cart_screen.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Wishlist',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 16),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 5,
              itemBuilder: (context, index) {
                // Sample data
                final items = [
                  {
                    'title': 'Black Hoodie',
                    'store': 'T-Shirt Store',
                    'price': 19.99,
                    'image': 'assets/products/prod1.jpg',
                  },
                  {
                    'title': 'Leather Bag',
                    'store': 'Bag Store',
                    'price': 19.99,
                    'image': 'assets/products/prod2.jpg',
                  },
                  {
                    'title': 'Headphone',
                    'store': 'Accxe Store',
                    'price': 19.99,
                    'image': 'assets/products/prod3.jpg',
                  },
                  {
                    'title': 'Shoes',
                    'store': 'Shoes Store',
                    'price': 19.99,
                    'image': 'assets/products/prod1.jpg',
                  },
                  {
                    'title': 'Leather Bag',
                    'store': 'Bag Store',
                    'price': 19.99,
                    'image': 'assets/products/prod2.jpg',
                  },
                ];
                final item = items[index];
                return WishlistItemCard(
                  title: item['title'] as String,
                  store: item['store'] as String,
                  price: item['price'] as double,
                  imageUrl: item['image'] as String,
                  onRemove: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
