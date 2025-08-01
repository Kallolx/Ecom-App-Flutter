import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';


class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Payment', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Payment Analytics', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text('This Month', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black)),
                    const SizedBox(width: 4),
                    const Icon(Icons.keyboard_arrow_down, size: 18),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Payments', style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600], fontWeight: FontWeight.w500)),
                    Row(
                      children: [
                        Text('Total: ', style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600], fontWeight: FontWeight.w500)),
                        Text(' 244081', style: GoogleFonts.poppins(fontSize: 15, color: Color(0xFFFF8100), fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 120,
                  child: LineChart(
                    LineChartData(
                      minX: 0,
                      maxX: 6,
                      minY: 0,
                      maxY: 5,
                      gridData: const FlGridData(show: false),
                      titlesData: const FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            const FlSpot(0, 1),
                            const FlSpot(1, 4),
                            const FlSpot(2, 2),
                            const FlSpot(3, 4.5),
                            const FlSpot(4, 2.5),
                            const FlSpot(5, 3),
                            const FlSpot(6, 2),
                          ],
                          isCurved: true,
                          color: Color(0xFFFF8100),
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) {
                              if (index == 1) {
                                // Show label for the second point
                                return FlDotCirclePainter(
                                  radius: 7,
                                  color: Colors.white,
                                  strokeWidth: 3,
                                  strokeColor: Color(0xFFFF8100),
                                );
                              }
                              return FlDotCirclePainter(
                                radius: 5,
                                color: Colors.white,
                                strokeWidth: 3,
                                strokeColor: Color(0xFFFF8100),
                              );
                            },
                          ),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFFF8100).withOpacity(0.2),
                                Color(0xFFFF8100).withOpacity(0.03),
                              ],
                            ),
                          ),
                        ),
                      ],
                      showingTooltipIndicators: [
                        ShowingTooltipIndicators([
                          LineBarSpot(
                            LineChartBarData(
                              spots: [
                                const FlSpot(0, 1),
                                const FlSpot(1, 4),
                                const FlSpot(2, 2),
                                const FlSpot(3, 4.5),
                                const FlSpot(4, 2.5),
                                const FlSpot(5, 3),
                                const FlSpot(6, 2),
                              ],
                            ),
                            0,
                            const FlSpot(1, 4),
                          ),
                        ]),
                      ],
                      lineTouchData: LineTouchData(
                        enabled: true,
                        getTouchedSpotIndicator: (barData, spotIndexes) {
                          return spotIndexes.map((index) {
                            return TouchedSpotIndicatorData(
                              FlLine(color: Colors.transparent),
                              FlDotData(show: false),
                            );
                          }).toList();
                        },
                        touchTooltipData: LineTouchTooltipData(
                          tooltipBgColor: Colors.transparent,
                          tooltipRoundedRadius: 8,
                          getTooltipItems: (touchedSpots) {
                            return touchedSpots.map((spot) {
                              if (spot.x == 1) {
                                return LineTooltipItem(
                                  ' 287',
                                  GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    backgroundColor: Color(0xFFFF8100),
                                  ),
                                );
                              }
                              return null;
                            }).toList();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text('Payment History', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
          const SizedBox(height: 18),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 8,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, i) {
              return Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/products/prod1.jpg',
                      width: 44,
                      height: 44,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Polo T-Shirt', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14)),
                        const SizedBox(height: 2),
                        Text('22 Jun, 2025', style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600])),
                      ],
                    ),
                  ),
                  Text('\$19.99', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xFFFF8100))),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
