import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza_ecom/core/theme/app_theme.dart';

class RefundReturnsScreen extends StatefulWidget {
  const RefundReturnsScreen({super.key});

  @override
  State<RefundReturnsScreen> createState() => _RefundReturnsScreenState();
}

class _RefundReturnsScreenState extends State<RefundReturnsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Map<String, dynamic>> returnItems = [
    {
      'name': 'Black Hoodie',
      'image': 'assets/products/prod1.jpg',
      'orderId': 'ID: 1245OAB866A8XXX',
    },
    {
      'name': 'Leather Bag',
      'image': 'assets/products/prod2.jpg',
      'orderId': 'ID: 1245OAB866A8XXX',
    },
    {
      'name': 'Headphone',
      'image': 'assets/products/prod3.jpg',
      'orderId': 'ID: 1245OAB866A8XXX',
    },
    {
      'name': 'Shoes',
      'image': 'assets/products/prod4.jpg',
      'orderId': 'ID: 1245OAB866A8XXX',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
        title: Text('Refund & Returns', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700)),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppTheme.primaryColor,
          unselectedLabelColor: Colors.grey,
          indicatorColor: AppTheme.primaryColor,
          labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15),
          tabs: const [
            Tab(text: 'Return'),
            Tab(text: 'Track'),
          ],
        ),
      ),
      backgroundColor: AppTheme.lightGrayColor,
      body: TabBarView(
        controller: _tabController,
        children: [
          // Return Tab
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: ListView(
              padding: const EdgeInsets.only(top: 18, left: 0, right: 0),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Text('Eligible Items For Return', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
                ),
                const SizedBox(height: 10),
                ...returnItems.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            item['image'],
                            width: 74,
                            height: 74,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['name'], style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
                              const SizedBox(height: 4),
                              Text(item['orderId'], style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600])),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ReturnRequestScreen(item: item),
                              ),
                            );
                          },
                          child: Text('Return', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15)),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                )),
                const SizedBox(height: 30),
              ],
            ),
          ),
          // Track Tab (empty for now)
          Center(child: Text('Track Returns', style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[600]))),
        ],
      ),
    );
  }
}

class ReturnRequestScreen extends StatefulWidget {
  final Map<String, dynamic> item;
  const ReturnRequestScreen({super.key, required this.item});

  @override
  State<ReturnRequestScreen> createState() => _ReturnRequestScreenState();
}

class _ReturnRequestScreenState extends State<ReturnRequestScreen> {
  int selectedReason = 0;
  final List<String> reasons = [
    'This Product Is Damaged.',
    'Short On Quantity.',
    'Exchanged With Another Product.',
    'This Product Is Damaged.',
    'Short On Quantity.',
    'Exchanged With Another Product.',
  ];
  String? photoPath;
  final TextEditingController _descController = TextEditingController();

  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

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
        title: Text('Refund & Returns', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      backgroundColor: AppTheme.lightGrayColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.item['image'],
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.item['name'], style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(widget.item['orderId'], style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600])),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('Please Choose Your Reason', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15)),
          const SizedBox(height: 10),
          ...List.generate(reasons.length, (i) => RadioListTile<int>(
                value: i,
                groupValue: selectedReason,
                onChanged: (val) => setState(() => selectedReason = val ?? 0),
                title: Text(reasons[i], style: GoogleFonts.poppins(fontSize: 14)),
                contentPadding: EdgeInsets.zero,
                activeColor: AppTheme.primaryColor,
              )),
          const SizedBox(height: 18),
          Text('Attach Photo', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.lightGrayColor,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 0,
                  ),
                  icon: const Icon(Icons.upload, color: Colors.grey),
                  label: Text(photoPath == null ? 'Upload Photo' : 'Photo Added', style: GoogleFonts.poppins(fontSize: 14)),
                  onPressed: () {
                    // Dummy photo upload
                    setState(() {
                      photoPath = 'dummy_path.jpg';
                    });
                  },
                ),
              ),
              const SizedBox(width: 8),
              if (photoPath != null)
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.grey),
                  onPressed: () => setState(() => photoPath = null),
                ),
            ],
          ),
          const SizedBox(height: 18),
          Text('Describe Your Reason', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15)),
          const SizedBox(height: 8),
          TextField(
            controller: _descController,
            decoration: InputDecoration(
              hintText: 'Type Description',
              hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[500]),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            minLines: 2,
            maxLines: 4,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Return Requested!', style: GoogleFonts.poppins())),
                );
              },
              child: Text('Request Return', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
