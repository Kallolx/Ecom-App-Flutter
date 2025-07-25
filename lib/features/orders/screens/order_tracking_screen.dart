import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

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
                      'Order Tracking',
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
            // Map section
            Container(
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/map.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Stacked content section
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 16,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Driver info
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.lightGrayColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundImage: AssetImage('assets/images/user.png'),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Jewel Ahmed', style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: AppTheme.heading3)),
                                    const SizedBox(height: 4),
                                    Text('Delivery Man', style: GoogleFonts.poppins(fontSize: AppTheme.bodyMedium, color: AppTheme.darkGrayColor)),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.message, color: AppTheme.primaryColor, size: 28),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.phone, color: AppTheme.primaryColor, size: 28),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Tracking steps
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        child: Column(
                          children: [
                            // Packed at (in progress, dashed)
                            // Packed at (complete, solid line to next)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: AppTheme.primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.store, color: Colors.white, size: 24),
                                    ),
                                    Container(
                                      width: 2,
                                      height: 64,
                                      color: AppTheme.primaryColor,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text('Packed at', style: GoogleFonts.poppins(fontWeight: FontWeight.w500, color: AppTheme.textColor, fontSize: AppTheme.bodyLarge)),
                                          const SizedBox(width: 8),
                                          Text('T-shirt Store', style: GoogleFonts.poppins(fontWeight: FontWeight.w500, color: AppTheme.primaryColor, fontSize: AppTheme.bodyLarge)),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text('Shop', style: GoogleFonts.poppins(fontSize: AppTheme.bodyMedium, color: AppTheme.darkGrayColor)),
                                          const SizedBox(width: 8),
                                          Text('•', style: GoogleFonts.poppins(fontSize: AppTheme.bodyMedium, color: AppTheme.darkGrayColor)),
                                          const SizedBox(width: 8),
                                          Text('02:55 pm', style: GoogleFonts.poppins(fontSize: AppTheme.bodyMedium, color: AppTheme.darkGrayColor)),
                                          const SizedBox(width: 8),
                                          Text('•', style: GoogleFonts.poppins(fontSize: AppTheme.bodyMedium, color: AppTheme.darkGrayColor)),
                                          const SizedBox(width: 8),
                                          Text('29 Jun, 2025', style: GoogleFonts.poppins(fontSize: AppTheme.bodyMedium, color: AppTheme.darkGrayColor)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            // On the way (in progress, dashed line to next)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: AppTheme.primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.local_shipping, color: Colors.white, size: 24),
                                    ),
                                    CustomDashedLine(
                                      height: 64,
                                      color: AppTheme.primaryColor,
                                      dashWidth: 3,
                                      dashSpace: 4,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('On The Way', style: GoogleFonts.poppins(fontWeight: FontWeight.w500, color: AppTheme.textColor, fontSize: AppTheme.bodyLarge)),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text('Delivery', style: GoogleFonts.poppins(fontSize: AppTheme.bodyMedium, color: AppTheme.darkGrayColor)),
                                          const SizedBox(width: 8),
                                          Text('•', style: GoogleFonts.poppins(fontSize: AppTheme.bodyMedium, color: AppTheme.darkGrayColor)),
                                          const SizedBox(width: 8),
                                          Text('02:55 pm', style: GoogleFonts.poppins(fontSize: AppTheme.bodyMedium, color: AppTheme.darkGrayColor)),
                                          const SizedBox(width: 8),
                                          Text('•', style: GoogleFonts.poppins(fontSize: AppTheme.bodyMedium, color: AppTheme.darkGrayColor)),
                                          const SizedBox(width: 8),
                                          Text('29 Jun, 2025', style: GoogleFonts.poppins(fontSize: AppTheme.bodyMedium, color: AppTheme.darkGrayColor)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            // Address (pending, no connector, icon bg light gray, icon primary)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: AppTheme.lightGrayColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(Icons.location_on, color: AppTheme.primaryColor, size: 24),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('House 33, Road S-2, South Badda...', style: GoogleFonts.poppins(fontWeight: FontWeight.w500, color: AppTheme.textColor, fontSize: AppTheme.bodyLarge)),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text('House', style: GoogleFonts.poppins(fontSize: AppTheme.bodyMedium, color: AppTheme.darkGrayColor)),
                                          const SizedBox(width: 8),
                                          Text('•', style: GoogleFonts.poppins(fontSize: AppTheme.bodyMedium, color: AppTheme.darkGrayColor)),
                                          const SizedBox(width: 8),
                                          Text('02:55 pm', style: GoogleFonts.poppins(fontSize: AppTheme.bodyMedium, color: AppTheme.darkGrayColor)),
                                          const SizedBox(width: 8),
                                          Text('•', style: GoogleFonts.poppins(fontSize: AppTheme.bodyMedium, color: AppTheme.darkGrayColor)),
                                          const SizedBox(width: 8),
                                          Text('29 Jun, 2025', style: GoogleFonts.poppins(fontSize: AppTheme.bodyMedium, color: AppTheme.darkGrayColor)),
                                        ],
                                      ),
                                    ],
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
            ),
          ],
        ),
      ),
    );
  }
}

// Custom dashed line widget
class CustomDashedLine extends StatelessWidget {
  final double height;
  final Color color;
  final double dashWidth;
  final double dashSpace;

  const CustomDashedLine({
    super.key,
    required this.height,
    required this.color,
    this.dashWidth = 2,
    this.dashSpace = 3,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final boxHeight = constraints.constrainHeight();
          final dashCount = (boxHeight / (dashWidth + dashSpace)).floor();
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(dashCount, (_) => Container(
              width: 2,
              height: dashWidth,
              color: color,
            )),
          );
        },
      ),
    );
  }
}

