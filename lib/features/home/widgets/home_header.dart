import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  final String userImage;
  final String subtitle;
  final VoidCallback? onSearchTap;
  final VoidCallback? onCartTap;
  final int cartItemCount;

  const HomeHeader({
    Key? key,
    required this.userName,
    required this.userImage,
    required this.subtitle,
    this.onSearchTap,
    this.onCartTap,
    this.cartItemCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // User info with image
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(userImage),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, $userName',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: AppTheme.darkGrayColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          // Search and Cart icons
          Row(
            children: [
              IconButton(
                onPressed: onSearchTap,
                icon: const Icon(Icons.search, size: 28),
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: onCartTap,
                    icon: const Icon(Icons.shopping_cart_outlined, size: 28),
                  ),
                  if (cartItemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: AppTheme.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          cartItemCount.toString(),
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
