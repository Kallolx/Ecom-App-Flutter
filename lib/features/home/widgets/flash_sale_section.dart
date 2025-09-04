import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import 'flash_sale_card.dart';

class FlashSaleSection extends StatefulWidget {
  const FlashSaleSection({super.key});

  @override
  State<FlashSaleSection> createState() => _FlashSaleSectionState();
}

class _FlashSaleSectionState extends State<FlashSaleSection> {
  Timer? _timer;
  int _hours = 2;
  int _minutes = 15;
  int _seconds = 45;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          if (_minutes > 0) {
            _minutes--;
            _seconds = 59;
          } else {
            if (_hours > 0) {
              _hours--;
              _minutes = 59;
              _seconds = 59;
            } else {
              timer.cancel();
            }
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Flash Sale',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Timer display
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        _buildTimeBox(_hours.toString().padLeft(2, '0')),
                        const Text(' : '),
                        _buildTimeBox(_minutes.toString().padLeft(2, '0')),
                        const Text(' : '),
                        _buildTimeBox(_seconds.toString().padLeft(2, '0')),
                      ],
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  // Handle shop more flash sales
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Shop More',
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 8,
                      color: AppTheme.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Flash sale products
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              FlashSaleCard(
                imageUrl: 'assets/products/prod1.jpg',
                price: 98,
                discountPercentage: 35,
                statusText: 'Only 1 left',
              ),
              FlashSaleCard(
                imageUrl: 'assets/products/prod2.jpg',
                price: 279,
                discountPercentage: 53,
                statusText: '107 Sold',
              ),
              FlashSaleCard(
                imageUrl: 'assets/products/prod3.jpg',
                price: 232,
                discountPercentage: 61,
                statusText: 'Only 5 left',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeBox(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        value,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
