import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza_ecom/core/theme/app_theme.dart';
import 'profile_screen.dart';
import '../../../auth/screens/verification_method_screen.dart';
import 'messages_screen.dart';
import 'notification_screen.dart';
import 'refund/refund_returns_screen.dart';
import 'help_support_screen.dart';
import 'payment_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  String selectedLanguage = 'English';
  final List<String> languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Bengali',
    'Hindi',
  ];

  void _showLanguageDialog() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Select Language'),
        children: languages
            .map(
              (lang) => SimpleDialogOption(
                onPressed: () => Navigator.pop(context, lang),
                child: Text(lang, style: GoogleFonts.poppins()),
              ),
            )
            .toList(),
      ),
    );
    if (result != null && result != selectedLanguage) {
      setState(() {
        selectedLanguage = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Options',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
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
          Text(
            'Personal',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.secondaryColor,
            ),
          ),
          const SizedBox(height: 12),

          _OptionTile(
            icon: Icons.person_outline,
            label: 'Profile',
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const ProfileScreen()));
            },
          ),

          _OptionTile(
            icon: Icons.lock_outline,
            label: 'Change Password',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const VerificationMethodScreen(),
                ),
              );
            },
          ),

          _OptionTile(
            icon: Icons.message_outlined,
            label: 'Messages',
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const MessagesScreen()));
            },
          ),

          _OptionTile(
            icon: Icons.notifications_none,
            label: 'Notification',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const NotificationScreen()),
              );
            },
          ),

          _OptionTile(
            icon: Icons.assignment_return_outlined,
            label: 'Returns & Refunds',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const RefundReturnsScreen()),
              );
            },
          ),

          _OptionTile(
            icon: Icons.assignment_return_outlined,
            label: 'Payment',
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const PaymentScreen()));
            },
          ),
          const SizedBox(height: 24),

          // App Preference Section
          Text(
            'App Preference',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.secondaryColor,
            ),
          ),
          const SizedBox(height: 12),
          _OptionTile(
            icon: Icons.language,
            label: 'Language',
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  selectedLanguage,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
              ],
            ),
            onTap: _showLanguageDialog,
          ),
          _OptionTile(icon: Icons.policy_outlined, label: 'Legal & Policies'),
          _OptionTile(
            icon: Icons.help_outline,
            label: 'Help & Support',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const HelpSupportScreen()),
              );
            },
          ),

          const SizedBox(height: 24),
          // Log Out
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text(
                'Log Out',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil('/welcome', (route) => false);
              },
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
  final VoidCallback? onTap;
  const _OptionTile({
    required this.icon,
    required this.label,
    this.trailing,
    this.onTap,
  });

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
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          leading: Icon(icon, color: AppTheme.secondaryColor),
          title: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing:
              trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: onTap,
        ),
      ),
    );
  }
}
