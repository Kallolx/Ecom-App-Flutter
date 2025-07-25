import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';
import 'order_tracking_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;
  final String status;
  final String orderDate;
  final String deliveryDate;
  final List<Map<String, dynamic>> items;
  final double subtotal;
  final double shipping;
  final double total;

  const OrderDetailsScreen({
    super.key,
    required this.orderId,
    required this.status,
    required this.orderDate,
    required this.deliveryDate,
    required this.items,
    required this.subtotal,
    required this.shipping,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Order Details',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: AppTheme.heading2,
                        color: AppTheme.textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 40), // For symmetry
                ],
              ),
            ),
            // Order info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order Id', style: GoogleFonts.poppins(fontSize: AppTheme.bodySmall, color: AppTheme.darkGrayColor)),
                      Text(
                        orderId,
                        style: GoogleFonts.poppins(
                          fontSize: AppTheme.bodyMedium,
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppTheme.primaryColor, width: 1.2),
                    ),
                    child: Text(
                      status,
                      style: GoogleFonts.poppins(
                        fontSize: AppTheme.caption,
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Dates
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order Date', style: GoogleFonts.poppins(fontSize: AppTheme.bodySmall, color: AppTheme.darkGrayColor)),
                      Text(orderDate, style: GoogleFonts.poppins(fontSize: AppTheme.bodyMedium, color: AppTheme.textColor)),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Delivery Date', style: GoogleFonts.poppins(fontSize: AppTheme.bodySmall, color: AppTheme.darkGrayColor)),
                      Text(deliveryDate, style: GoogleFonts.poppins(fontSize: AppTheme.bodyMedium, color: AppTheme.textColor)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Ordered items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Ordered Items', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: AppTheme.bodyMedium)),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 22),
                itemBuilder: (context, i) {
                  final item = items[i];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          item['image'],
                          width: 62,
                          height: 62,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['name'], style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: AppTheme.bodyLarge)),
                            const SizedBox(height: 6),
                            Text('Qty. ${item['qty']}', style: GoogleFonts.poppins(fontSize: AppTheme.bodySmall, color: AppTheme.darkGrayColor)),
                          ],
                        ),
                      ),
                      Text(
                        '\$${item['price'].toStringAsFixed(2)}',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: AppTheme.bodyLarge,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Subtotal Amount', style: GoogleFonts.poppins(fontSize: AppTheme.bodySmall, color: AppTheme.darkGrayColor)),
                const Spacer(),
                Text('\$${subtotal.toStringAsFixed(2)}', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: AppTheme.primaryColor)),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Text('Shipping Cost', style: GoogleFonts.poppins(fontSize: AppTheme.bodySmall, color: AppTheme.darkGrayColor)),
                const Spacer(),
                Text('\$${shipping.toStringAsFixed(2)}', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: AppTheme.primaryColor)),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Text('Total Amount', style: GoogleFonts.poppins(fontSize: AppTheme.bodySmall, color: AppTheme.darkGrayColor)),
                const Spacer(),
                Text('\$${total.toStringAsFixed(2)}', style: GoogleFonts.poppins(fontWeight: FontWeight.w700, color: AppTheme.primaryColor)),
              ],
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OrderTrackingScreen(),
                    ),
                  );
                },
                child: Text('Track Order', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}