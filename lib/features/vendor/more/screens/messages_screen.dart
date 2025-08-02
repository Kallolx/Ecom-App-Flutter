import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza_ecom/core/theme/app_theme.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = [
      {
        'avatar': 'assets/icons/1.png',
        'title': 'Graphic Tee Emporium',
        'subtitle': 'This Product Is Available.\nShipping Is Ready',
        'time': '1hr',
        'unread': 1,
      },
      {
        'avatar': 'assets/icons/2.png',
        'title': 'Chic T-Shirt Boutique',
        'subtitle': 'This Product Is Available.\nShipping Is Ready',
        'time': '1hr',
        'unread': 2,
      },
      {
        'avatar': 'assets/icons/3.png',
        'title': 'Urban Threads Co.',
        'subtitle': 'This Product Is Available.\nShipping Is Ready',
        'time': '1hr',
        'unread': 0,
      },
      {
        'avatar': 'assets/icons/4.png',
        'title': 'Casual Cotton Corner',
        'subtitle': 'This Product Is Available.\nShipping Is Ready',
        'time': '1hr',
        'unread': 0,
      },
      {
        'avatar': 'assets/icons/5.png',
        'title': 'Trendy Tee Haven',
        'subtitle': 'This Product Is Available.\nShipping Is Ready',
        'time': '1hr',
        'unread': 0,
      },
      {
        'avatar': 'assets/icons/6.png',
        'title': 'Stylish Shirt Stop',
        'subtitle': 'This Product Is Available.\nShipping Is Ready',
        'time': '1hr',
        'unread': 0,
      },
      {
        'avatar': 'assets/icons/7.png',
        'title': 'The T-Shirt Hub',
        'subtitle': 'This Product Is Available.\nShipping Is Ready',
        'time': '1hr',
        'unread': 0,
      },
      {
        'avatar': 'assets/icons/8.png',
        'title': 'The Tee Gallery',
        'subtitle': 'This Product Is Available.\nShipping Is Ready',
        'time': '1hr',
        'unread': 0,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Messages', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Message',
                hintStyle: GoogleFonts.poppins(fontSize: 15, color: Colors.grey[500]),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: AppTheme.lightGrayColor,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, i) {
                final msg = messages[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ChatScreen(
                            storeName: msg['title'] as String,
                            avatar: msg['avatar'] as String,
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 92,
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.grey.shade300, width: 2),
                                  ),
                                  child: Center(
                                    child: ClipOval(
                                      child: Image.asset(
                                        msg['avatar'] as String,
                                        width: 36,
                                        height: 36,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              msg['title'] as String,
                                              style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 17),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          SizedBox(
                                            width: 48,
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                msg['time'] as String,
                                                style: GoogleFonts.poppins(fontSize: 13, color: Colors.red, fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        (msg['subtitle'] as String).replaceAll('\\n', '\n'),
                                        style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey[700]),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (msg['unread'] != 0)
                            Positioned(
                              right: 8,
                              bottom: 12,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  msg['unread'].toString(),
                                  style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
