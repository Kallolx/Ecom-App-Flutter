import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza_ecom/core/theme/app_theme.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Options',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Personal Section
          Text('Personal', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.secondaryColor)),
          const SizedBox(height: 12),
          _OptionTile(icon: Icons.person_outline, label: 'Profile'),
          _OptionTile(icon: Icons.lock_outline, label: 'Change Password'),
          _OptionTile(icon: Icons.message_outlined, label: 'Messages'),
          _OptionTile(icon: Icons.notifications_none, label: 'Notification'),
          _OptionTile(icon: Icons.assignment_return_outlined, label: 'Returns & Refunds'),
          const SizedBox(height: 24),
          // App Preference Section
          Text('App Preference', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.secondaryColor)),
          const SizedBox(height: 12),
          _OptionTile(icon: Icons.language, label: 'Language', trailing: Text('English', style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600]))),
          _OptionTile(icon: Icons.policy_outlined, label: 'Legal & Policies'),
          _OptionTile(icon: Icons.help_outline, label: 'Help & Support'),
          const SizedBox(height: 24),
          // Log Out
          Container(
            decoration: BoxDecoration(            
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(              
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Log Out', style: GoogleFonts.poppins(fontSize: 15, color: Colors.red, fontWeight: FontWeight.w600)),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget? trailing;
  const _OptionTile({required this.icon, required this.label, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.lightGrayColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Icon(icon, color: AppTheme.secondaryColor),
          title: Text(label, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
          trailing: trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: () {},
        ),
      ),
    );
  }
}
