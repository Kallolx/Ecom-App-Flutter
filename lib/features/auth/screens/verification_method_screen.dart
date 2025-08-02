import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza_ecom/core/theme/app_theme.dart';
import 'email_verification_screen.dart';

class VerificationMethodScreen extends StatefulWidget {
  const VerificationMethodScreen({super.key});

  @override
  State<VerificationMethodScreen> createState() => _VerificationMethodScreenState();
}

class _VerificationMethodScreenState extends State<VerificationMethodScreen> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppTheme.textColor),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Change\nPassword',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                'How do you want to receive the code to reset your password?',
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey[700], fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 32),
              _buildOption(0, 'Send Code Via Email', 'john***@gmail.com'),
              const SizedBox(height: 16),
              _buildOption(1, 'Send Code Via Phone', '+8801877769**7'),
              const SizedBox(height: 16),
              _buildOption(2, 'Send Code Via WhatsApp', '+8801877769**7'),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey.shade400, width: 1.5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Previous', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => EmailVerificationScreen(
                                email: 'contact@webbytestudio.com',
                                onVerificationComplete: (code) {
                                  Navigator.of(context).pushReplacementNamed('/change-password', arguments: {'email': 'contact@webbytestudio.com'});
                                },
                              ),
                            ),
                          );
                        },
                        child: Text('Next', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(int index, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: () => setState(() => _selected = index),
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            Radio<int>(
              value: index,
              groupValue: _selected,
              onChanged: (v) => setState(() => _selected = v!),
              activeColor: AppTheme.primaryColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black)),
                Text(subtitle, style: GoogleFonts.poppins(fontSize: 17, color: AppTheme.primaryColor, fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
