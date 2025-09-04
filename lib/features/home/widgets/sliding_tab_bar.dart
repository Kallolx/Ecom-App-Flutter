import 'package:flutter/material.dart';

class SlidingTabBar extends StatelessWidget {
  final List<Map<String, dynamic>> tabs;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const SlidingTabBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (tabs.isEmpty) {
      return Container(height: 50, color: const Color(0xFFF0F8FF));
    }

    return Container(
      height: 50,
      color: const Color(0xFFF0F8FF),
      padding: const EdgeInsets.all(4),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: tabs.asMap().entries.map((entry) {
            final index = entry.key;
            final tab = entry.value;
            final isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () => onTabSelected(index),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      tab['icon'] ?? Icons.circle,
                      size: 16,
                      color: isSelected ? Colors.orange : Colors.black54,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      tab['name']?.toString() ?? 'Tab',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? Colors.orange : Colors.black54,
                      ),
                    ),

                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}