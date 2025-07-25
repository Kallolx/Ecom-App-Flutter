import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'product_reviews_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;
  final String info;
  final double rating;
  final int reviewCount;
  final String shopName;

  const ProductDetailScreen({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.info,
    required this.rating,
    required this.reviewCount,
    required this.shopName,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      imageUrl,
      'assets/products/prod2.jpg',
      'assets/products/prod3.jpg',
    ];
    final PageController pageController = PageController();
    int currentPage = 0;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Stack(
          children: [
            // Background color
            Container(
              color: Colors.grey[100],
            ),
            // Image section
            StatefulBuilder(
              builder: (context, setState) {
                return Stack(
                  children: [
                    // Image slider
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: MediaQuery.of(context).size.height * 0.42,
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: images.length,
                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index;
                          });
                        },
                        itemBuilder: (context, idx) => Image.asset(
                          images[idx],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Slider indicator
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.34,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(images.length, (i) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              width: i == currentPage ? 16 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: i == currentPage ? Colors.orange : Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            // Content section overlapping image
            Positioned(
              top: MediaQuery.of(context).size.height * 0.38,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Top curved container with main info
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 12,
                            offset: Offset(0, -2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '\$${price.toStringAsFixed(2)}',
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  name,
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              // Quantity selector
                              Row(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.grey[400]!, width: 1.5),
                                    ),
                                    child: const Icon(Icons.remove, size: 18, color: Colors.black),
                                  ),
                                  const SizedBox(width: 16),
                                  Text('1', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
                                  const SizedBox(width: 16),
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.grey[400]!, width: 1.5),
                                    ),
                                    child: const Icon(Icons.add, size: 18, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 16),
                              const SizedBox(width: 3),
                              Text(
                                '$rating',
                                style: GoogleFonts.poppins(fontSize: 13, color: Colors.black87),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ProductReviewsScreen(
                                        rating: rating,
                                        reviewCount: reviewCount,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  ' ($reviewCount reviews)',
                                  style: GoogleFonts.poppins(fontSize: 13, color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text('By $shopName', style: GoogleFonts.poppins(fontSize: 13, color: Colors.orange)),
                          const SizedBox(height: 10),
                          Text('Description', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                          const SizedBox(height: 10),
                          Text(
                            info,
                            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[700]),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 14),
                          // Choose Size
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Choose Size', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                              Text('Size Guide', style: GoogleFonts.poppins(color: Colors.orange, fontWeight: FontWeight.w500)),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              ...['S', 'M', 'L', 'XL', '2XL'].map((size) => Container(
                                margin: const EdgeInsets.only(right: 8),
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                                decoration: BoxDecoration(
                                  color: size == 'XL' ? Colors.orange : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(size, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: size == 'XL' ? Colors.white : Colors.black)),
                              )),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Text('Color', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              ...[Colors.black, Colors.grey[800], Colors.white].map((color) => Container(
                                margin: const EdgeInsets.only(right: 8),
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey[400]!, width: 1.5),
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                  ),
                                  onPressed: () {},
                                  child: Text('Buy Now', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.orange,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    side: const BorderSide(color: Colors.orange),
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.shopping_cart_outlined, color: Colors.orange),
                                      const SizedBox(width: 8),
                                      Text('Add to cart', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                                    ],
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
              ),
            ),
            // Overlay icons (back, favorite)
            Positioned(
              top: 16,
              left: 16,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.favorite_border, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
