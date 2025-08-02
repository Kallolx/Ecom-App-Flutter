import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackRefundScreen extends StatelessWidget {
  final String image;
  final String title;
  final String refundId;
  const TrackRefundScreen({super.key, required this.image, required this.title, required this.refundId});

  @override
  Widget build(BuildContext context) {
    // Dummy timeline data
    final List<_RefundStep> steps = [
      _RefundStep(
        icon: Icons.check_circle,
        label: 'Refund Confirmation',
        subLabel: 'Shop',
        time: '02:55 pm',
        date: '29 Jun, 2025',
        isActive: true,
      ),
      _RefundStep(
        icon: Icons.local_shipping,
        label: 'Pick Up',
        subLabel: 'Pick up',
        time: '',
        date: '',
        isActive: false,
      ),
      _RefundStep(
        icon: Icons.location_on,
        label: 'House 33, Road S-2,South Badda... ',
        subLabel: 'House',
        time: '02:55 pm',
        date: '29 Jun, 2025',
        isActive: false,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Track Refund', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    image,
                    width: 54,
                    height: 54,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15)),
                    const SizedBox(height: 2),
                    Text('Refund ID : $refundId', style: GoogleFonts.poppins(fontSize: 12.5, color: Colors.black87, fontWeight: FontWeight.w400)),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Status', style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 13)),
                    const SizedBox(height: 2),
                    Text('Pending', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.orange)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Detailed Status',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: steps.length,
                separatorBuilder: (context, i) => const SizedBox(height: 0),
                itemBuilder: (context, i) {
                  final step = steps[i];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              color: step.isActive ? Colors.orange : Colors.grey[200],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(step.icon, color: step.isActive ? Colors.white : Colors.grey[500], size: 22),
                          ),
                          if (i < steps.length - 1)
                            Container(
                              width: 2,
                              height: 60,
                              color: Colors.grey[300],
                            ),
                        ],
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2, bottom: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(step.label, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(step.subLabel, style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600])),
                                  if (step.time.isNotEmpty) ...[
                                    const SizedBox(width: 8),
                                    Text('•', style: TextStyle(color: Colors.grey[400], fontSize: 13)),
                                    const SizedBox(width: 8),
                                    Text(step.time, style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600])),
                                    const SizedBox(width: 8),
                                    Text('•', style: TextStyle(color: Colors.grey[400], fontSize: 13)),
                                    const SizedBox(width: 8),
                                    Text(step.date, style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600])),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RefundStep {
  final IconData icon;
  final String label;
  final String subLabel;
  final String time;
  final String date;
  final bool isActive;
  _RefundStep({
    required this.icon,
    required this.label,
    required this.subLabel,
    required this.time,
    required this.date,
    required this.isActive,
  });
}
