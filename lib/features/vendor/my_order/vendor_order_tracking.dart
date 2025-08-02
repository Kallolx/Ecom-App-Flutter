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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Driver info
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.lightGrayColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundImage: AssetImage('assets/images/user.png'),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Jewel Ahmed', style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 15)),
                                      const SizedBox(height: 2),
                                      Text('Delivery Man', style: GoogleFonts.poppins(fontSize: 12, color: AppTheme.darkGrayColor)),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.message, color: AppTheme.primaryColor, size: 22),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.phone, color: AppTheme.primaryColor, size: 22),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Tracking steps
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          child: Column(
                            children: [
                              // Order Confirmation (first step)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 28,
                                        height: 28,
                                        decoration: BoxDecoration(
                                          color: AppTheme.primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.check_circle, color: Colors.white, size: 16),
                                      ),
                                      Container(
                                        width: 2,
                                        height: 38,
                                        color: AppTheme.primaryColor,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Order Confirmation', style: GoogleFonts.poppins(fontWeight: FontWeight.w500, color: AppTheme.textColor, fontSize: 13)),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Text('Shop', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                            const SizedBox(width: 6),
                                            Text('•', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                            const SizedBox(width: 6),
                                            Text('02:55 pm', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                            const SizedBox(width: 6),
                                            Text('•', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                            const SizedBox(width: 6),
                                            Text('29 Jun, 2025', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              // Packed at (second step)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 28,
                                        height: 28,
                                        decoration: BoxDecoration(
                                          color: AppTheme.primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.store, color: Colors.white, size: 16),
                                      ),
                                      Container(
                                        width: 2,
                                        height: 38,
                                        color: AppTheme.primaryColor,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text('Packed at', style: GoogleFonts.poppins(fontWeight: FontWeight.w500, color: AppTheme.textColor, fontSize: 13)),
                                            const SizedBox(width: 6),
                                            Text('T-shirt Store', style: GoogleFonts.poppins(fontWeight: FontWeight.w500, color: AppTheme.primaryColor, fontSize: 13)),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Text('Shop', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                            const SizedBox(width: 6),
                                            Text('•', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                            const SizedBox(width: 6),
                                            Text('02:55 pm', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                            const SizedBox(width: 6),
                                            Text('•', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                            const SizedBox(width: 6),
                                            Text('29 Jun, 2025', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              // On the way (third step)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 28,
                                        height: 28,
                                        decoration: BoxDecoration(
                                          color: AppTheme.primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.local_shipping, color: Colors.white, size: 16),
                                      ),
                                      CustomDashedLine(
                                        height: 38,
                                        color: AppTheme.primaryColor,
                                        dashWidth: 2,
                                        dashSpace: 3,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('On The Way', style: GoogleFonts.poppins(fontWeight: FontWeight.w500, color: AppTheme.textColor, fontSize: 13)),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Text('Delivery', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                            const SizedBox(width: 6),
                                            Text('•', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                            const SizedBox(width: 6),
                                            Text('02:55 pm', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                            const SizedBox(width: 6),
                                            Text('•', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                            const SizedBox(width: 6),
                                            Text('29 Jun, 2025', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              // Address (last step)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 28,
                                        height: 28,
                                        decoration: BoxDecoration(
                                          color: AppTheme.lightGrayColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.location_on, color: AppTheme.primaryColor, size: 16),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('House 33, Road S-2, South Badda...', style: GoogleFonts.poppins(fontWeight: FontWeight.w500, color: AppTheme.textColor, fontSize: 13)),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Text('House', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                            const SizedBox(width: 6),
                                            Text('•', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                            const SizedBox(width: 6),
                                            Text('02:55 pm', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                            const SizedBox(width: 6),
                                            Text('•', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
                                            const SizedBox(width: 6),
                                            Text('29 Jun, 2025', style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.darkGrayColor)),
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

