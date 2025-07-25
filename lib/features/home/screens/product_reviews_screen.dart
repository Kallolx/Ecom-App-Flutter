import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductReviewsScreen extends StatefulWidget {
  final double rating;
  final int reviewCount;
  const ProductReviewsScreen({super.key, required this.rating, required this.reviewCount});

  @override
  State<ProductReviewsScreen> createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState extends State<ProductReviewsScreen> {
  int selectedStars = 0;
  final TextEditingController _controller = TextEditingController();
  int? replyingToIndex;
  final TextEditingController _replyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final reviews = [
      {
        'user': 'Alex Morgan',
        'avatar': 'assets/images/user.png',
        'rating': 4,
        'message': 'The product quality is really good and delivery was fast. I am happy with my purchase!',
        'date': '12 days ago',
        'images': <String>[
          'assets/products/prod2.jpg',
          'assets/products/prod3.jpg',
        ],
      },
      {
        'user': 'Alex Morgan',
        'avatar': 'assets/images/user.png',
        'rating': 3,
        'message': 'Decent product for the price. Packaging could be better but overall satisfied.',
        'date': '12 days ago',
        'images': <String>[],
      },
      {
        'user': 'Alex Morgan',
        'avatar': 'assets/images/user.png',
        'rating': 5,
        'message': 'Amazing experience! The item exceeded my expectations and customer service was excellent.',
        'date': '12 days ago',
        'images': <String>[
          'assets/products/prod1.jpg',
          'assets/products/prod3.jpg',
          'assets/products/prod2.jpg',
        ],
      },
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Top bar
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text('Reviews', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18)),
                              ),
                            ],
                          ),
                        ),
                        // Rating section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.rating} Ratings',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 16),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${widget.reviewCount} Reviews',
                                    style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Reviews list
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          itemCount: reviews.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 20),
                          itemBuilder: (context, i) {
                            final r = reviews[i];
                            final avatar = r['avatar'] as String;
                            final user = r['user'] as String;
                            final rating = r['rating'] as int;
                            final message = r['message'] as String;
                            final date = r['date'] as String;
                            final images = r['images'] as List<String>;
                            return Container(
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
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundImage: AssetImage(avatar),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(user, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14)),
                                      ),
                                      Row(
                                        children: List.generate(5, (star) => Icon(
                                          Icons.star,
                                          color: star < rating ? Colors.amber : Colors.grey[300],
                                          size: 14,
                                        )),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    message,
                                    style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[800]),
                                  ),
                                  if (images.isNotEmpty) ...[
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      height: 54,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: images.length,
                                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                                        itemBuilder: (context, idx) => ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.asset(
                                            images[idx],
                                            width: 54,
                                            height: 54,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            replyingToIndex = i;
                                          });
                                        },
                                        child: Text('Reply', style: GoogleFonts.poppins(fontSize: 13, color: Colors.orange, fontWeight: FontWeight.bold)),
                                      ),
                                      const Spacer(),
                                      Text(date, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
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
                                          backgroundColor: Colors.orange,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                                        ),
                                        onPressed: () {
                                          // Handle reply send
                                          setState(() {
                                            replyingToIndex = null;
                                            _replyController.clear();
                                          });
                                        },
                                        child: Text('Send', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              offset: Offset(0, -2),
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rate Your Experience', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
            const SizedBox(height: 18),
            Row(
              children: List.generate(5, (i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: GestureDetector(
                  onTap: () => setState(() => selectedStars = i + 1),
                  child: Icon(
                    Icons.star,
                    color: i < selectedStars ? Colors.orange : Colors.grey[300],
                    size: 32,
                  ),
                ),
              )),
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type Review',
                      hintStyle: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[500]),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.attach_file, color: Colors.grey),
                        onPressed: () async {
                          // Pick image logic (dummy for now)
                          // You can use image_picker package for real implementation
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Attach image clicked')),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 22,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      // Handle send action
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
