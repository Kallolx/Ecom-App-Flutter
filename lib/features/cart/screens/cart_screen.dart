import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController voucherController = TextEditingController();
  int selectedPayment = 0; // 0: Visa, 1: Master, 2: Bkash
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardExpiryController = TextEditingController();
  final TextEditingController cardCvvController = TextEditingController();
  final TextEditingController bkashNumberController = TextEditingController();
  final double shippingCost = 40;

  List<Map<String, dynamic>> cartItems = [
    {
      'image': 'assets/products/prod1.jpg',
      'name': 'Black Hoodie',
      'store': 'T-Shirt Store',
      'qty': 1,
      'price': 19.99,
    },
    {
      'image': 'assets/products/prod2.jpg',
      'name': 'Leather Bag',
      'store': 'Bag Store',
      'qty': 1,
      'price': 19.99,
    },
    {
      'image': 'assets/products/prod3.jpg',
      'name': 'Headphone',
      'store': 'Accxe store',
      'qty': 1,
      'price': 19.99,
    },
    {
      'image': 'assets/products/prod1.jpg',
      'name': 'Shoes',
      'store': 'Shoes Store',
      'qty': 1,
      'price': 19.99,
    },
  ];

  double get subtotal => cartItems.fold(0, (sum, item) => sum + (item['price'] * item['qty']));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Text(
              'Cart',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                color: AppTheme.textColor,
                fontSize: 22,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                builder: (context) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 24,
                          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                width: 40,
                                height: 4,
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                            Text('Add Voucher', style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 18)),
                            const SizedBox(height: 18),
                            TextField(
                              controller: voucherController,
                              decoration: InputDecoration(
                                hintText: 'Add Voucher',
                                filled: true,
                                fillColor: AppTheme.lightGrayColor,
                                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
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
                                  // Add voucher logic here
                                  Navigator.of(context).pop();
                                },
                                child: Text('Add', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Text(
              'Add Voucher',
              style: GoogleFonts.poppins(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: AppTheme.lightGrayColor,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            // Cart items
            ...List.generate(cartItems.length, (i) {
              final item = cartItems[i];
              return Column(
                children: [
                  if (i != 0) const SizedBox(height: 22),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                        onPressed: () {
                          setState(() => cartItems.removeAt(i));
                        },
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          item['image'],
                          width: 72,
                          height: 72,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['name'], style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
                            Text('By ${item['store']}', style: GoogleFonts.poppins(fontSize: 13, color: AppTheme.primaryColor)),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                _circleBtn(Icons.remove, () {
                                  if (item['qty'] > 1) setState(() => item['qty']--);
                                }),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(item['qty'].toString(), style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                                ),
                                _circleBtn(Icons.add, () {
                                  setState(() => item['qty']++);
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text('\$${item['price'].toStringAsFixed(2)}', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: AppTheme.primaryColor, fontSize: 17)),
                      ),
                    ],
                  ),
                ],
              );
            }),
            // Address
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Address', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Select Address',
                  prefixIcon: const Icon(Icons.location_pin, color: AppTheme.primaryColor),
                  filled: true,
                  fillColor: AppTheme.lightGrayColor,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            // Payment method
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Select Payment Method', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  _paymentRadio(0, 'assets/images/visa.png'),
                  const SizedBox(width: 16),
                  _paymentRadio(1, 'assets/images/master.png'),
                  const SizedBox(width: 16),
                  _paymentRadio(2, 'assets/images/bkash.png'),
                ],
              ),
            ),
            if (selectedPayment == 0 || selectedPayment == 1)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    _cardField(cardNumberController, 'Card Number', Icons.credit_card),
                    const SizedBox(height: 8),
                    _cardField(TextEditingController(), 'Card Holder Name', Icons.person),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(child: _cardField(cardExpiryController, 'MM/YY', Icons.date_range)),
                        const SizedBox(width: 12),
                        Expanded(child: _cardField(cardCvvController, 'CVV', Icons.lock)),
                      ],
                    ),
                  ],
                ),
              ),
            if (selectedPayment == 2)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: _cardField(bkashNumberController, 'Bkash Number', Icons.phone),
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
                Text('\$${shippingCost.toStringAsFixed(2)}', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: AppTheme.primaryColor)),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Text('Total Amount', style: GoogleFonts.poppins(fontSize: AppTheme.bodySmall, color: AppTheme.darkGrayColor)),
                const Spacer(),
                Text('\$${(subtotal + shippingCost).toStringAsFixed(2)}', style: GoogleFonts.poppins(fontWeight: FontWeight.w700, color: AppTheme.primaryColor)),
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
                onPressed: () {},
                child: Text('Checkout', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppTheme.primaryColor, width: 1.2),
        ),
        child: Icon(icon, size: 16, color: AppTheme.primaryColor),
      ),
    );
  }

  Widget _paymentRadio(int value, String asset) {
    return Row(
      children: [
        Radio<int>(
          value: value,
          groupValue: selectedPayment,
          activeColor: AppTheme.primaryColor,
          onChanged: (v) => setState(() => selectedPayment = v!),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.primaryColor, width: 1.2),
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
          ),
          child: Image.asset(asset, width: 36, height: 24),
        ),
      ],
    );
  }

  Widget _cardField(TextEditingController controller, String hint, IconData icon) {
    return TextField(
      controller: controller,
      keyboardType: hint == 'Card Number' || hint == 'Bkash Number' ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: AppTheme.primaryColor),
        filled: true,
        fillColor: AppTheme.lightGrayColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
