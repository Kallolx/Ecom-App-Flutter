import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza_ecom/core/theme/app_theme.dart';
import 'package:laza_ecom/features/vendor/my_order/vendor_order_details.dart';

class OrderCard extends StatelessWidget {
  final String orderId;
  final String orderDate;
  final String deliveryDate;
  final double price;
  final String status;
  final String imageUrl;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.orderDate,
    required this.deliveryDate,
    required this.price,
    required this.status,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VendorOrderDetails(
              orderId: orderId,
              status: status,
              orderDate: orderDate,
              deliveryDate: deliveryDate,
              items: [
                {
                  'image': imageUrl,
                  'name': 'Black hoodie',
                  'qty': 1,
                  'price': price,
                },
                {
                  'image': 'assets/products/prod2.jpg',
                  'name': 'Leather Bag',
                  'qty': 1,
                  'price': 19.99,
                },
                {
                  'image': 'assets/products/prod3.jpg',
                  'name': 'Headphone',
                  'qty': 1,
                  'price': 19.99,
                },
                {
                  'image': 'assets/products/prod1.jpg',
                  'name': 'Shoes',
                  'qty': 1,
                  'price': 19.99,
                },
              ],
              subtotal: 299,
              shipping: 0,
              total: 299,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imageUrl,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Id',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: AppTheme.darkGrayColor,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            orderId,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          status,
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Date',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        orderDate,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Date',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        deliveryDate,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '\$${price.toStringAsFixed(0)}',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
