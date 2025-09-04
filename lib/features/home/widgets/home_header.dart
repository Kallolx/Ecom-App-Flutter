import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../search/screens/search_screen.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback? onSearchTap;
  final VoidCallback? onQrScanTap;
  final VoidCallback? onMobileTap;

  const HomeHeader({
    super.key,
    this.onSearchTap,
    this.onQrScanTap,
    this.onMobileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60, // Reduced height from 70 to 60
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ), // Reduced vertical padding
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            offset: Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          // QR Code Scanner Icon (Left side)
          GestureDetector(
            onTap:
                onQrScanTap ??
                () {
                  // Handle QR scan functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('QR Scanner coming soon!')),
                  );
                },
            child: Container(
              padding: const EdgeInsets.all(6), // Reduced padding
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.transparent,
              ),
              child: Icon(
                Icons.qr_code_scanner_outlined,
                size: 22, // Slightly reduced icon size
                color: AppTheme.secondaryColor,
              ),
            ),
          ),

          const SizedBox(width: 10), // Reduced spacing
          // Search Bar with Orange Border
          Expanded(
            child: GestureDetector(
              onTap:
                  onSearchTap ??
                  () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const SearchScreen(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                              const begin = Offset(0.0, 1.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOutCubic;
                              var tween = Tween(
                                begin: begin,
                                end: end,
                              ).chain(CurveTween(curve: curve));
                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                        transitionDuration: const Duration(milliseconds: 300),
                      ),
                    );
                  },
              child: Container(
                height: 38, // Reduced height from 46 to 38
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppTheme.primaryColor, width: 1.5),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryColor.withValues(alpha: 0.1),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Placeholder text on the left
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                        ), // Reduced left padding
                        child: Text(
                          'gameing headphone',
                          style: TextStyle(
                            color: AppTheme.darkGrayColor,
                            fontSize: 13, // Slightly reduced font size
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),

                    // Search button with "Search" text
                    Container(
                      margin: const EdgeInsets.only(
                        right: 4,
                      ), // Small right margin
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12, // Small font size for button
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(width: 10), // Reduced spacing
          // Mobile Phone Icon (Right side)
          GestureDetector(
            onTap:
                onMobileTap ??
                () {
                  // Handle mobile functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Mobile features coming soon!'),
                    ),
                  );
                },
            child: Container(
              padding: const EdgeInsets.all(6), // Reduced padding
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.transparent,
              ),
              child: Icon(
                Icons.phone_android_outlined,
                size: 22, // Slightly reduced icon size
                color: AppTheme.secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
