import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_theme.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  int expandedIndex = -1;
  final List<Map<String, String>> faqs = [
    {
      'question': 'How To Buy Product ?',
      'answer': 'To buy a product, browse our catalog, select the item you want, and click "Add to Cart". Then proceed to checkout to complete your purchase.'
    },
    {
      'question': 'How To Make A Refund Request?',
      'answer': 'Refund requests can be made from the Returns & Refunds section in your account.'
    },
    {
      'question': 'How To Use Cart Option?',
      'answer': 'Add products to your cart and proceed to checkout.'
    },
    {
      'question': 'How To Track An Order?',
      'answer': 'Go to your orders and select the order to track.'
    },
    {
      'question': 'How To Contact Customer Support?',
      'answer': 'You can contact customer support via the Contact Us section in the app.'
    },
    {
      'question': 'How To Change My Password?',
      'answer': 'You can change your password in the Profile section under Account Settings.'
    },
    {
      'question': 'How To Update My Profile?',
      'answer': 'Update your profile information in the Profile section of your account.'
    },
    {
      'question': 'How To View My Order History?',
      'answer': 'Your order history can be viewed in the Orders section of your account.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Help & Support', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Help section with bg and arrow
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: AppTheme.lightGrayColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(Icons.help_outline, color: AppTheme.secondaryColor),
                const SizedBox(width: 12),
                Expanded(
                  child: Text('Help', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
                ),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
          const SizedBox(height: 18),
          // FAQ title with primary color
          Text('FAQ', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15, color: AppTheme.primaryColor)),
          const SizedBox(height: 10),
          ...faqs.asMap().entries.map((entry) {
            int idx = entry.key;
            var faq = entry.value;
            bool expanded = expandedIndex == idx;
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      expandedIndex = expanded ? -1 : idx;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: expanded ? Colors.grey[200] : AppTheme.lightGrayColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.transparent, width: 0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                faq['question'] ?? '',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: expanded ? AppTheme.primaryColor : Colors.black,
                                ),
                              ),
                            ),
                            Icon(
                              expanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_right_rounded,
                              color: expanded ? AppTheme.primaryColor : Colors.grey,
                            ),
                          ],
                        ),
                        if (expanded) ...[
                          const SizedBox(height: 8),
                          Text(
                            faq['answer'] ?? '',
                            style: GoogleFonts.poppins(fontSize: 13.5, color: Colors.black87),
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
          const SizedBox(height: 18),
          Center(
            child: Text(
              "Couldn't Find Any Answers?",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              onPressed: () {
                // TODO: Implement call support action
              },
              child: Text('Call For Support', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
