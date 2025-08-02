import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'request_return_screen.dart';
import 'track_refund_screen.dart';

class RefundReturnsScreen extends StatefulWidget {
  const RefundReturnsScreen({super.key});

  @override
  State<RefundReturnsScreen> createState() => _RefundReturnsScreenState();
}

class _RefundReturnsScreenState extends State<RefundReturnsScreen> with SingleTickerProviderStateMixin {
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

  // Dummy product data for demonstration
  final List<Map<String, dynamic>> returnProducts = [
    {
      'image': 'assets/products/prod1.jpg',
      'title': 'Black Hoodie',
      'orderId': '1245LOAXAAH',
    },
    {
      'image': 'assets/products/prod2.jpg',
      'title': 'Leather Bag',
      'orderId': '1245LOAXAAH',
    },
    {
      'image': 'assets/products/prod3.jpg',
      'title': 'Headphone',
      'orderId': '1245LOAXAAH',
    },
    {
      'image': 'assets/products/prod1.jpg',
      'title': 'Shoes',
      'orderId': '1245LOAXAAH',
    },
  ];

  final List<Map<String, dynamic>> trackProducts = [
    {
      'image': 'assets/products/prod2.jpg',
      'title': 'Red Jacket',
      'orderId': 'TRK-001',
    },
    {
      'image': 'assets/products/prod3.jpg',
      'title': 'Travel Backpack',
      'orderId': 'TRK-002',
    },
    {
      'image': 'assets/products/prod2.jpg',
      'title': 'Running Shoes',
      'orderId': 'TRK-003',
    },
    {
      'image': 'assets/products/prod1.jpg',
      'title': 'Bluetooth Earbuds',
      'orderId': 'TRK-004',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Refund & Returns', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600)),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.orange,
          labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15),
          tabs: const [
            Tab(text: 'Return'),
            Tab(text: 'Track'),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF7F7F9),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Return Tab: Product list with Return button styled as in the image
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 22),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 12),
                child: Text(
                  'Eligible Items For Return',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
              ...returnProducts.map((p) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 18),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(9),
                        child: Image.asset(
                          p['image'],
                          width: 62,
                          height: 62,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 62,
                              height: 62,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Icon(
                                Icons.image_not_supported_outlined,
                                color: Colors.grey[400],
                                size: 30,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p['title'] ?? '',
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 13.5, color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 3),
                            Text(
                              'Order ID : ${p['orderId']}',
                              style: GoogleFonts.poppins(fontSize: 11.5, color: Colors.black, fontWeight: FontWeight.w400),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            padding: EdgeInsets.zero,
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => RequestReturnScreen(
                                  image: p['image'],
                                  title: p['title'],
                                  orderId: p['orderId'],
                                ),
                              ),
                            );
                          },
                          child: Text('Return', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
          // Track Tab: Product list (with Track button)
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 22),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 12),
                child: Text(
                  'Tracked Items',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
              ...trackProducts.map((p) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 18),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(9),
                        child: Image.asset(
                          p['image'],
                          width: 62,
                          height: 62,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 62,
                              height: 62,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Icon(
                                Icons.image_not_supported_outlined,
                                color: Colors.grey[400],
                                size: 30,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p['title'] ?? '',
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 13.5, color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 3),
                            Text(
                              'Order ID : ${p['orderId']}',
                              style: GoogleFonts.poppins(fontSize: 11.5, color: Colors.black, fontWeight: FontWeight.w400),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            padding: EdgeInsets.zero,
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => TrackRefundScreen(
                                  image: p['image'],
                                  title: p['title'],
                                  refundId: p['orderId'],
                                ),
                              ),
                            );
                          },
                          child: Text('Track', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}