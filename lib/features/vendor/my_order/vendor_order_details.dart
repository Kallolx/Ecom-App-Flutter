import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';
import 'vendor_order_tracking.dart';

class VendorOrderDetails extends StatefulWidget {
  final String orderId;
  final String status;
  final String orderDate;
  final String deliveryDate;
  final List<Map<String, dynamic>> items;
  final double subtotal;
  final double shipping;
  final double total;

  const VendorOrderDetails({
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
  State<VendorOrderDetails> createState() => _VendorOrderDetailsState();
}

class _VendorOrderDetailsState extends State<VendorOrderDetails> {
  bool isConfirmed = false;
  String address = 'House - 1, Road - S2, Mirzanagar, Mirpur-1, Dhaka';
  String paymentStatus = 'Done';
  String orderStatus = 'Pending';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Order Overview',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 40), // For symmetry
                ],
              ),
            ),
            // Ordered Items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Text('Ordered Items', style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                itemCount: widget.items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemBuilder: (context, i) {
                  final item = widget.items[i];
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            item['image'],
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['name'], style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
                              const SizedBox(height: 4),
                              Text('Qty. ${item['qty']}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600])),
                            ],
                          ),
                        ),
                        Text(
                          '\$${item['price'].toStringAsFixed(2)}',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xFFFF8100),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text('Address', style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey[600], fontWeight: FontWeight.w500)),
                  const SizedBox(height: 4),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      address,
                      style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey[800], fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Text('Payment', style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600])),
                      const Spacer(),
                      Text(paymentStatus, style: GoogleFonts.poppins(fontSize: 14, color: Color(0xFFFF8100), fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('Status', style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600])),
                      const Spacer(),
                      Text(orderStatus, style: GoogleFonts.poppins(fontSize: 14, color: Color(0xFFFF8100), fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Subtotal Amount', style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey[600], fontWeight: FontWeight.w500)),
                      const Spacer(),
                      Text('\$${widget.subtotal.toStringAsFixed(0)}', style: GoogleFonts.poppins(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('Shipping Cost', style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey[600], fontWeight: FontWeight.w500)),
                      const Spacer(),
                      Text('\$${widget.shipping.toStringAsFixed(0)}', style: GoogleFonts.poppins(fontSize: 15, color: Color(0xFFFF8100), fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('Total Amount', style: GoogleFonts.poppins(fontSize: 17, color: Colors.grey[600], fontWeight: FontWeight.w600)),
                      const Spacer(),
                      Text(
                        '\$${widget.total.toStringAsFixed(0)}',
                        style: GoogleFonts.poppins(fontSize: 24, color: Color(0xFFFF8100), fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
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
        child: isConfirmed
            ? SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF8100),
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
              )
            : Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF8100),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        setState(() {
                          isConfirmed = true;
                          orderStatus = 'Confirmed';
                        });
                      },
                      child: Text('Confirm Order', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Color(0xFFFF8100),
                        side: const BorderSide(color: Color(0xFFFF8100)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}