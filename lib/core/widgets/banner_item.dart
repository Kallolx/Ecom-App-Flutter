import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BannerItem extends StatelessWidget {
  final String imageUrl;
  final String? title;
  final String? subtitle;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final bool isDark;

  const BannerItem({
    super.key,
    required this.imageUrl,
    this.title,
    this.subtitle,
    this.buttonText,
    this.onButtonPressed,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    // Check if there's any content to display
    final hasContent = (title?.isNotEmpty == true) || 
                      (subtitle?.isNotEmpty == true) || 
                      (buttonText?.isNotEmpty == true);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: hasContent ? Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.6),
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title?.isNotEmpty == true) ...[
              Text(
                title!,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
            ],
            if (subtitle?.isNotEmpty == true) ...[
              Text(
                subtitle!,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 8),
            ],
            if (buttonText?.isNotEmpty == true)
              SizedBox(
                width: 120, // Fixed width for smaller button
                height: 40, // Fixed height
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    buttonText!,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ) : null, // No overlay when no content
    );
  }
}
