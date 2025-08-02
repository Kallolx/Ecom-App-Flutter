import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestReturnScreen extends StatefulWidget {
  final String image;
  final String title;
  final String orderId;
  const RequestReturnScreen({super.key, required this.image, required this.title, required this.orderId});

  @override
  State<RequestReturnScreen> createState() => _RequestReturnScreenState();
}

class _RequestReturnScreenState extends State<RequestReturnScreen> {
  int _selectedReason = 0;
  final TextEditingController _descController = TextEditingController();
  // Dummy reasons
  final List<String> reasons = [
    'This Product Is Damaged.',
    'Short On Quantity.',
    'Exchanged With Another Product.',
    'This Product Is Damaged.',
    'Short On Quantity.',
    'Exchanged With Another Product.',
  ];
  String? _photoPath;

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
        title: Text('Refund & Returns', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.image,
                    width: 54,
                    height: 54,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15)),
                    const SizedBox(height: 2),
                    Text('Order ID : ${widget.orderId}', style: GoogleFonts.poppins(fontSize: 12.5, color: Colors.black87, fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 22),
            Text('Please Choose Your Reason', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14.5)),
            const SizedBox(height: 8),
            ...List.generate(reasons.length, (i) => RadioListTile<int>(
              contentPadding: EdgeInsets.zero,
              dense: true,
              activeColor: Colors.orange,
              title: Text(reasons[i], style: GoogleFonts.poppins(fontSize: 14)),
              value: i,
              groupValue: _selectedReason,
              onChanged: (val) => setState(() => _selectedReason = val!),
            )),
            const SizedBox(height: 10),
            Text('Attach Photo', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14.5)),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: () {}, // Add image picker logic if needed
              child: Container(
                width: double.infinity,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F9),
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(_photoPath == null ? 'Upload Photo' : 'Photo Selected', style: GoogleFonts.poppins(fontSize: 13.5, color: Colors.black54)),
                    ),
                    Icon(Icons.photo_camera_outlined, color: Colors.grey[500]),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text('Describe Your Reason', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14.5)),
            const SizedBox(height: 6),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF7F7F9),
                borderRadius: BorderRadius.circular(7),
              ),
              child: TextField(
                controller: _descController,
                minLines: 3,
                maxLines: 5,
                style: GoogleFonts.poppins(fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'Type Description',
                  hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[400]),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                onPressed: () {},
                child: Text('Request Return', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
