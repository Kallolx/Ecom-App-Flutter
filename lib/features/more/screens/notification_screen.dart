import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza_ecom/core/theme/app_theme.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      // Recent
      {
        'section': 'Recent',
        'items': [
          {
            'icon': 'assets/icons/1.png',
            'title': 'T-Shirt Store Send You A Message',
            'subtitle': 'This Product Is Available',
            'reply': true,
            'time': '1hr',
          },
          {
            'icon': null,
            'iconData': Icons.shopping_bag_outlined,
            'title': 'Purchase Complete',
            'subtitle': 'You Have Successfully Purchased The T-Shirt.',
            'reply': false,
            'time': '1hr',
          },
          {
            'icon': null,
            'iconData': Icons.flash_on_outlined,
            'title': 'Flash Sell',
            'subtitle': 'Get 20% Discount For The First Transaction In This Month',
            'reply': false,
            'time': '1hr',
          },
        ],
      },
      // Yesterday
      {
        'section': 'Yesterday',
        'items': [
          {
            'icon': null,
            'iconData': Icons.local_shipping_outlined,
            'title': 'Package Sent',
            'subtitle': 'Hi, Your Package Has Been Shipped To Your Address',
            'reply': false,
            'time': '1hr',
          },
          {
            'icon': 'assets/icons/1.png',
            'title': 'T-Shirt Store Send You A Message',
            'subtitle': 'This Product Is Available',
            'reply': true,
            'time': '1hr',
          },
          {
            'icon': null,
            'iconData': Icons.shopping_bag_outlined,
            'title': 'Purchase Complete',
            'subtitle': 'You Have Successfully Purchased The T-Shirt.',
            'reply': false,
            'time': '1hr',
          },
          {
            'icon': null,
            'iconData': Icons.flash_on_outlined,
            'title': 'Flash Sell',
            'subtitle': 'Get 20% Discount For The First Transaction In This Month',
            'reply': false,
            'time': '1hr',
          },
          {
            'icon': null,
            'iconData': Icons.local_shipping_outlined,
            'title': 'Package Sent',
            'subtitle': 'Hi, Your Package Has Been Shipped To Your Address',
            'reply': false,
            'time': '1hr',
          },
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Notifications', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      backgroundColor: AppTheme.lightGrayColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        children: [
          const SizedBox(height: 8),
          ...notifications.map((section) => _NotificationSection(section: section)),
        ],
      ),
    );
  }
}

class _NotificationSection extends StatefulWidget {
  final Map section;
  const _NotificationSection({required this.section});

  @override
  State<_NotificationSection> createState() => _NotificationSectionState();
}

class _NotificationSectionState extends State<_NotificationSection> {
  int? replyingToIndex;
  final TextEditingController _replyController = TextEditingController();

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
            child: Text(
              widget.section['section'],
              style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87),
            ),
          ),
          ...List.generate((widget.section['items'] as List).length, (i) {
            final item = widget.section['items'][i];
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppTheme.lightGrayColor, width: 1),
                            ),
                            child: item['icon'] != null
                                ? CircleAvatar(
                                    backgroundColor: AppTheme.lightGrayColor,
                                    backgroundImage: AssetImage(item['icon']),
                                    radius: 22,
                                  )
                                : CircleAvatar(
                                    backgroundColor: AppTheme.lightGrayColor,
                                    radius: 22,
                                    child: Icon(item['iconData'], color: Colors.grey[700], size: 26),
                                  ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              item['title'],
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 15, color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            item['time'],
                            style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[500], fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item['subtitle'],
                        style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[800]),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          if (item['reply'] == true)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  replyingToIndex = i;
                                });
                              },
                              child: Text('Reply', style: GoogleFonts.poppins(fontSize: 13, color: Colors.deepOrange, fontWeight: FontWeight.bold)),
                            ),
                          const Spacer(),
                          // You can add more actions here if needed
                        ],
                      ),
                      if (replyingToIndex == i) ...[
                        const SizedBox(height: 10),
                        TextField(
                          controller: _replyController,
                          decoration: InputDecoration(
                            hintText: 'Type your reply...',
                            hintStyle: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[500]),
                            filled: true,
                            fillColor: Colors.grey[100],
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                            ),
                            onPressed: () {
                              setState(() {
                                replyingToIndex = null;
                                _replyController.clear();
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Reply sent!', style: GoogleFonts.poppins())),
                              );
                            },
                            child: Text('Send', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
